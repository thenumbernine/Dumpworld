local table = require 'ext.table'
local class = require 'ext.class'

local bit = require 'bit'
local ffi = require 'ffi'
local sdl = require 'ffi.sdl'
local gl = require 'ffi.OpenGL'
local ig = require 'ffi.imgui'

local vec2 = require 'vec.vec2'
local vec3 = require 'vec.vec3'
local box2 = require 'vec.box2'
local Tex2D = require 'gl.tex2d'
local Image = require 'image'

local gui = require 'base.script.singleton.gui'
local animsys = require 'base.script.singleton.animsys'
local threads = require 'base.script.singleton.threads'
local modio = require 'base.script.singleton.modio'
local game = require 'base.script.singleton.game'
local SpawnInfo = require 'base.script.spawninfo'
local Object = require'base.script.obj.object'

local Editor = class()

--Editor.active = true
Editor.active = false

local paintBrush
local smoothBrush

paintBrush = {
	name = 'Paint',
	paint = function(self, cx, cy)
		local level = game.level

		local texpack = level.texpackTex
		local tilesWide = texpack.width / level.tileSize
		local tilesHigh = texpack.height / level.tileSize
		local fgtx = (self.selectedFgTileIndex > 0) and ((self.selectedFgTileIndex-1) % tilesWide)
		local fgty = (self.selectedFgTileIndex > 0) and ((self.selectedFgTileIndex-fgtx-1) / tilesWide)
		local bgtx = (self.selectedBgTileIndex > 0) and ((self.selectedBgTileIndex-1) % tilesWide)
		local bgty = (self.selectedBgTileIndex > 0) and ((self.selectedBgTileIndex-bgtx-1) / tilesWide)
		local xmin = math.floor(cx - tonumber(self.brushTileWidth[0]-1)/2)
		local ymin = math.floor(cy - tonumber(self.brushTileHeight[0]-1)/2)
		local xmax = xmin + self.brushTileWidth[0]-1
		local ymax = ymin + self.brushTileHeight[0]-1
		if xmax < 1 then return end
		if ymax < 1 then return end
		if xmin > level.size[1] then return end
		if ymin > level.size[2] then return end
		if xmin < 1 then xmin = 1 end
		if ymin < 1 then ymin = 1 end
		if xmax > level.size[1] then xmax = level.size[1] end
		if ymax > level.size[2] then ymax = level.size[2] end
		for y=ymin,ymax do
			for x=xmin,xmax do
				local offset = x-1 + level.size[1] * (y-1)
				if self.paintingTileType[0] then
					level.tileMap[offset] = self.selectedTileTypeIndex[0]
					level.tileMapOriginal[offset] = self.selectedTileTypeIndex[0]
				end
				if self.paintingFgTile[0] then
					if self.selectedFgTileIndex == 0 then
						level.fgTileMap[offset] = 0
						level.fgTileMapOriginal[offset] = 0
					else
						level.fgTileMap[offset] = 
							1
							+ ((fgtx+((x-xmin)%self.brushStampWidth[0]))%tilesWide)
							+ tilesWide * (
								((fgty+((ymax-y)%self.brushStampHeight[0]))%tilesHigh)
							)
						level.fgTileMapOriginal[offset] = level.fgTileMap[offset]
					end
				end
				if self.paintingBgTile[0] then
					level.bgTileMap[offset] = (self.selectedBgTileIndex == 0) and 0 or (
						1 + ((bgtx+(x-xmin)%self.brushStampWidth[0])%tilesWide)
						+ tilesWide * (
							((bgty+(ymax-y)%self.brushStampHeight[0])%tilesHigh)
						)
					)
					level.bgTileMapOriginal[offset] = level.bgTileMap[offset]
				end
				if self.paintingBackground[0] then
					level.backgroundMap[offset] = self.selectedBackgroundIndex[0]
					level.backgroundMapOriginal[offset] = self.selectedBackgroundIndex[0]
				end
			end
		end
	
		if self.smoothWhilePainting[0] then
			smoothBrush.paint(self, cx, cy, self.smoothBorder[0])
		end
	end,
}

local fillBrush = {
	name='Fill',
	paint = function(self, x, y)
		local level = game.level
		if x < 1 or y < 1 or x > level.size[1] or y > level.size[2] then return end
		
		-- only on click:
		local mouse = gui.mouse
		if not (mouse.leftDown and not mouse.lastLeftDown) then return end

		local thread = function()
			local alreadyHit = table()
			alreadyHit[x..','..y] = true
			local check = table{vec2(x,y)}
			local offset = x-1 + level.size[1] * (y-1)
			local infos = {
				{map='tileMap', mask=self.paintingTileType[0], value=self.selectedTileTypeIndex[0]},
				{map='fgTileMap', mask=self.paintingFgTile[0], value=self.selectedFgTileIndex},
				{map='bgTileMap', mask=self.paintingBgTile[0], value=self.selectedBgTileIndex},
				{map='backgroundMap', mask=self.paintingBackground[0], value=self.selectedBackgroundIndex[0]},
			}
			for _,info in ipairs(infos) do
				info.srcValue = level[info.map][offset]
			end

			local paintingAny = false
			for _,info in ipairs(infos) do
				paintingAny = paintingAny or info.mask 
			end
			if not paintingAny then return end
			
			local different = false
			for _,info in ipairs(infos) do
				-- enable/disable this test to only check maps of fill for congruency 
				do--if info.mask then
					if info.value ~= info.srcValue then
						different = true
						break
					end
				end
			end
			if not different then return end
		
			local iter = 0
			while #check > 0 do
				iter = iter + 1
				if iter%100 == 0 then coroutine.yield() end
				local pt = check:remove(1)
				local offset = (pt[1]-1) + level.size[1] * (pt[2]-1)
				for _,info in ipairs(infos) do
					if info.mask then
						level[info.map][offset] = info.value
						level[info.map..'Original'][offset] = info.value
					end
				end
				for side,dir in pairs(dirs) do
					local nbhd = pt + dir
					if nbhd[1] >= 1
					and nbhd[2] >= 1
					and nbhd[1] <= level.size[1]
					and nbhd[2] <= level.size[2]
					then
						if not alreadyHit[nbhd[1]..','..nbhd[2]] then
							alreadyHit[nbhd[1]..','..nbhd[2]] = true
							local offset = (nbhd[1]-1) + level.size[1] * (nbhd[2]-1)
							local same = true
							for _,info in ipairs(infos) do
								-- enable/disable this test to only check maps of fill for congruency 
								do--if info.mask then
									if info.srcValue ~= level[info.map][offset] then
										same = false
										break
									end
								end
							end
							if same then
								check:insert(nbhd)
							end
						end
					end
				end
			end
		end
		threads:add(thread)
	end,
}

local patch = require 'base.script.patch'
local patchTilesWide = #patch.template[1]
local patchTilesHigh = #patch.template

do
	local function isSelectedTemplate(map,x,y)
		local level = game.level
		local texpack = level.texpackTex
		local tilesWide = texpack.width / level.tileSize
		
		if x < 1 or y < 1 or x > level.size[1] or y > level.size[2] then return end
		
		-- read the tile
		local offset = x-1 + level.size[1] * (y-1)
		local index = level[map][offset]
		if index > 0 then
			-- see if this is a member of the current patch
			-- ... check if it exists at the 2d offset from the selected fg tile index (check 'patchObj.patch' above)
			local tx = (index-1)%tilesWide
			local ty = (index-tx-1)/tilesWide
	
			-- make sure this tile's texture is a part of a valid patch 
			local patchtx = tx - tx%patchTilesWide
			local patchty = ty - ty%patchTilesHigh
			local row = patch.locs[patchtx/patchTilesWide]
			local valid = row and row[patchty/patchTilesHigh]
			if not valid then return end
			
			local i = tx - patchtx
			local j = ty - patchty
			
			local row = patch.template[j+1]
			if row then
				local name = row[i+1]
				if name then
					if name == '' then return end
					return true	
				end
			end	
		end
	end

	local function isTileTypeSmoothable(map,x,y)
		local level = game.level
		-- if we're oob then should we consider the neighbor as bad?
		-- TODO only if 'patch with any neighbor' is set
		if x < 1 or y < 1 or x > level.size[1] or y > level.size[2] then
			return
		end
		local offset = x-1 + level.size[1] * (y-1)
		local index = level[map][offset]
		if index == 0 then return end
		-- what should we smooth?  diagonals for sure
		-- and ... only the first solid?  or *any* solid?
		-- only the first for now -- in case there's solid=true blocks that shouldn't be smoothed (like shootable)
		return index == 1 or index.diag
	end

	local function validNeighbor(self,map,x,y)
		local level = game.level
		if x < 1 or y < 1 or x > level.size[1] or y > level.size[2] then return end
		if not self.alignPatchToAnything[0] then return isSelectedTemplate(map,x,y) end
		local offset = x-1 + level.size[1] * (y-1)
		local index = level[map][offset]
		return index > 0
	end

	smoothBrush = {
		name = 'Smooth',
		-- names in the neighbor table of where the patch tiles are
		paint = function(self, cx, cy, extraBorder)
			extraBorder = extraBorder or 0
			local level = game.level

			local texpack = level.texpackTex
			local tilesWide = texpack.width / level.tileSize
			local tilesHigh = texpack.height / level.tileSize

			local xmin = math.floor(cx - tonumber(self.brushTileWidth[0]-1)/2) - extraBorder
			local ymin = math.floor(cy - tonumber(self.brushTileHeight[0]-1)/2) - extraBorder
			local xmax = xmin + self.brushTileWidth[0]-1 + 2*extraBorder
			local ymax = ymin + self.brushTileHeight[0]-1 + 2*extraBorder
			if xmax < 1 then return end
			if ymax < 1 then return end
			if xmin > level.size[1] then return end
			if ymin > level.size[2] then return end
			if xmin < 1 then xmin = 1 end
			if ymin < 1 then ymin = 1 end
			if xmax > level.size[1] then xmax = level.size[1] end
			if ymax > level.size[2] then ymax = level.size[2] end

			for _,info in ipairs{
				{map='fgTileMap', painting=self.paintingFgTile[0], selected=self.selectedFgTileIndex},
				{map='bgTileMap', painting=self.paintingBgTile[0], selected=self.selectedBgTileIndex},
				{map='tileMap', painting=self.paintingTileType[0], selected=self.selectedTileTypeIndex[0], drawingTileType=true},
			} do
				local map = info.map
				local painting = info.painting
				local selectedIndex = info.selected
				local drawingTileType = info.drawingTileType
				if painting then
					for y=ymin,ymax do
						for x=xmin,xmax do
							-- get the current tile's associated patch
							local seltx, selty
							if not drawingTileType then
								if x >= 1 and y >= 1 and x <= level.size[1] and y <= level.size[2] then 
									local offset = x-1 + level.size[1] * (y-1)
									local index = level[map][offset]
									if index > 0 then
										seltx = (index-1)%tilesWide
										selty = (index-seltx-1)/tilesWide
										seltx = seltx - seltx % patchTilesWide
										selty = selty - selty % patchTilesHigh
									end
								end
							end
							-- for fg/bg (drawingTileType == 0), if the fg/bg tex is part of a patch, then align it.  if it's not, ignore it.
							local checkThisTile = drawingTileType and isTileTypeSmoothable(map,x,y) or isSelectedTemplate(map,x,y)
							if checkThisTile then
								for _,neighbor in ipairs(patch.neighbors) do
									if (neighbor.diag or 0) <= self.smoothDiagLevel[0] then	    -- and we're within our diagonalization precedence (0 for 90', 1 for 45', 2 for 30')
										local neighborIsValid = true
										-- make sure all neighbors that should differ do differ
										if neighbor.differOffsets then
											for _,offset in ipairs(neighbor.differOffsets) do
												-- if not 'alignPatchToAnything' then only go by same templates. otherwise - go by anything 
												-- if drawing tile type then just check if it's empty.  TODO still only consider matching templates!
												if drawingTileType and isTileTypeSmoothable(map,x+offset[1],y+offset[2])
												or validNeighbor(self,map,x+offset[1], y+offset[2])
												then
													neighborIsValid = false
													break
												end
											end
										end
										-- make sure all neighbors that should match do match
										if neighborIsValid and neighbor.matchOffsets then
											for _,offset in ipairs(neighbor.matchOffsets) do
												-- same test as above
												if not (drawingTileType and isTileTypeSmoothable(map,x+offset[1],y+offset[2])
												or validNeighbor(self,map,x+offset[1], y+offset[2]))
												then
													neighborIsValid = false
													break
												end
											end
										end
										if neighborIsValid then
											-- if unsmooth then force it to the center
											if self.unsmooth[0] then
												neighbor = select(2, patch.neighbors:find(nil, function(neighbor)
													return neighbor.name == 'c00'
												end))
											end
											-- find the offset in the patch that this neighbor represents
											local done = false
											if drawingTileType then
												-- convert neighbor name to tileType
												local tileTypeIndex = level.tileTypes:find(nil, function(tileType)
													if neighbor.diag then
														return tileType.name == neighbor.name
													end
													return tileType.name == 'solid'
												end)
												level[map][x-1+level.size[1]*(y-1)] = tileTypeIndex or 0
												level[map..'Original'][x-1+level.size[1]*(y-1)] = tileTypeIndex or 0
												if tileTypeIndex then done = true end
											else
												for j,row in ipairs(patch.template) do
													for i,name in ipairs(row) do
														if neighbor.name == name then
															--  use the patch that the current tile belongs to
															local tx = seltx + i-1
															local ty = selty + j-1
															-- ... and paint it on the foreground
															level[map][x-1+level.size[1]*(y-1)] = 1+tx+tilesWide*ty
															level[map..'Original'][x-1+level.size[1]*(y-1)] = 1+tx+tilesWide*ty
															done = true
															break
														end
													end
													if done then break end
												end
											end
											-- don't need to check anymore neighbors -- we've found one
											if done then break end
										end
									end
								end
							end
						end
					end
				end
			end
		end,
	}
end

local function hoverTooltip(name)
	if ig.igIsItemHovered() then
		ig.igBeginTooltip()
		ig.igText(name)
		ig.igEndTooltip()
	end
end

local function checkboxTooltip(name, ptr)
	assert(ptr, "forgot to pass a ptr for "..name)
	ig.igPushIdStr(name)
	ig.igCheckbox('', ptr)
	hoverTooltip(name)
	ig.igPopId()
end

local function radioTooltip(name, ptr, value)
	ig.igPushIdStr(name)
	ig.igRadioButton('', ptr, value)
	hoverTooltip(name)
	ig.igPopId()
end

local function buttonTooltip(name, ptr)
	ig.igPushIdStr(name)
	local result = ig.igButton('', ig.ImVec2(16,16))
	hoverTooltip(name)
	ig.igPopId()
	return result
end

local PickTileTypeWindow = class()

function PickTileTypeWindow:init(editor)
	self.editor = editor
	self.opened = ffi.new('bool[1]',false)
	self.index = 0
end

-- 'self' is only used to get the tileOptions.  otherwise this works like a checkbox
function PickTileTypeWindow:radioButton(selected, index, callback)
	local editor = self.editor
	local tileTypeOption = editor.tileOptions[index]
	local tex = tileTypeOption.tex
	-- no-texture renders solid white.  TODO replace with a completely blank textures.
	local texIDPtr = ffi.cast('void*',ffi.cast('intptr_t',tex and tex.id or 0))
	if ig.igImageButton(
		texIDPtr,
		ig.ImVec2(32, 32), --size
		ig.ImVec2(0, 1), --uv0
		ig.ImVec2(1, 0), --uv1
		-1,	-- frame_padding
		index == selected and ig.ImVec4(1,1,0,.25) or ig.ImVec4(0,0,0,0))	-- bg_col
	then
		callback(index)
	end
	if ig.igIsItemHovered() then
		ig.igBeginTooltip()
		ig.igText('tile type: '..tileTypeOption.tileType.name)
		ig.igEndTooltip()
	end
end

function PickTileTypeWindow:update()
	local editor = self.editor
	if not self.opened[0] then return end
	ig.igBegin('Choose Tile Type...', self.opened)
	
	for i=0,#editor.tileOptions do
		ig.igPushIdStr('PickTileTypeWindow:update '..i)
		self:radioButton(self.index, i, function(i)
			self.callback(i)
			self.opened[0] = false
		end)
		
		-- it would be nice if wrapping controls was automatic
		local tileOptionsWide = 5
		if (i+1) % tileOptionsWide > 0 and i < #editor.tileOptions then 
			ig.igSameLine()
		end
		ig.igPopId()
	end

	ig.igEnd()
end

function PickTileTypeWindow:open(index, callback)
	self.opened[0] = true
	self.index = index
	self.callback = callback
end

function PickTileTypeWindow:openButton(index, callback)
	local editor = self.editor
	ig.igPushIdStr('PickTileTypeWindow:openButton')
	self:radioButton(-1, index, function()
		self:open(index, callback)
	end)
	ig.igPopId()
end


local PickTileWindow = class()

function PickTileWindow:init()
	self.opened = ffi.new('bool[1]',false)
end

function PickTileWindow:update()
	if not self.opened[0] then return end

	ig.igBegin('Choose Tile...', self.opened)

	local tex = game.level.texpackTex
	local texIDPtr = ffi.cast('void*',ffi.cast('intptr_t',tex.id))
	local level = game.level
	local tilesWide = tex.width / level.tileSize
	local tilesHigh = tex.height / level.tileSize

	local size = ig.igGetWindowSize()
	--ig.igPushStyleVar(ig.ImGuiStyleVar_ChildWindowRounding, 5)
	ig.igBeginChild('choose a texture...',
		ig.ImVec2(size.x - 30, size.y - 40),	-- size
		false,
		ig.ImGuiWindowFlags_HorizontalScrollbar)	--true?

	local texScreenPos = ig.igGetCursorScreenPos()
	local mousePos = ig.igGetMousePos()
	local cursorX = mousePos.x - texScreenPos.x - 4
	local cursorY = mousePos.y - texScreenPos.y - 4
	local x = math.clamp(math.floor(cursorX / tex.width * tilesWide), 0, tilesWide-1)
	local y = math.clamp(math.floor(cursorY / tex.height * tilesHigh), 0, tilesHigh-1)

	if ig.igImageButton(
		texIDPtr,
		ig.ImVec2(tex.width, tex.height))	-- size
	then
		self.callback(1+x+tilesWide*y)
		self.opened[0] = false
	end
	if ig.igIsItemHovered() then
		ig.igBeginTooltip()
		ig.igImage(
			texIDPtr, -- tex
			ig.ImVec2(64, 64), -- size
			ig.ImVec2(x/tilesWide, y/tilesHigh), -- uv0
			ig.ImVec2((x+1)/tilesWide, (y+1)/tilesHigh)) -- uv1
		ig.igEndTooltip()
	end

	ig.igEndChild()
	
	ig.igEnd()
end

-- don't call open until this is called (so the ptr exists)
function PickTileWindow:open(callback)
	self.opened[0] = true
	self.callback = callback
end

function PickTileWindow:openButton(hoverText, tileIndex, callback)
	local level = game.level
	local tex = level.texpackTex
	local texIDPtr = ffi.cast('void*',ffi.cast('intptr_t',tex.id))
	local tilesWide = tex.width / level.tileSize
	local tilesHigh = tex.height / level.tileSize
	local ti = (tileIndex - 1) % tilesWide
	local tj = (tileIndex - 1 - ti) / tilesWide
	if ig.igImageButton(
		texIDPtr,
		ig.ImVec2(32,32),	-- size
		ig.ImVec2(ti/tilesWide, tj/tilesHigh),	-- uv0
		ig.ImVec2((ti+1)/tilesWide, (tj+1)/tilesHigh))	-- uv1
	then
		self:open(callback)
	end
	if hoverText and ig.igIsItemHovered() then
		ig.igBeginTooltip()
		ig.igText(hoverText..': '..tileIndex)
		ig.igEndTooltip()
	end
end


--[[
move all tiles and spawnobjs in the world
and objs while we're at it
clips tiles at borders
--]]

local function doMoveWorld(dx, dy)
	-- move tile stuff
	local level = game.level
	-- move original buffers
	for _,key in ipairs{'tileMap', 'fgTileMap', 'bgTileMap', 'backgroundMap'} do
		local map = level[key..'Original']
		-- format will be "type[?]" for type the c type
		local ctype = assert(tostring(ffi.typeof(map)):match('^ctype<(.*)%[%?%]>$'))
		local newMap = ffi.new(ctype..'[?]', level.size[1] * level.size[2])
		for j=0,level.size[2]-1 do
			for i=0,level.size[1]-1 do
				local x = i - dx
				local y = j - dy
				if x >= 0 and y >= 0 and x < level.size[1] and y < level.size[2] then
					newMap[i+level.size[1]*j] = map[x+level.size[1]*y]
				end
			end
		end
		for j=0,level.size[2]-1 do
			for i=0,level.size[1]-1 do
				map[i+level.size[1]*j] = newMap[i+level.size[1]*j]
			end
		end
	end
	level:refreshTiles()	-- copy original into current buffer
	-- move rooms?
	do
		local map = level.roomMap
		local ctype = assert(tostring(ffi.typeof(map)):match('^ctype<(.*)%[%?%]>$'))
		local newMap = ffi.new(ctype..'[?]', level.sizeInMapTiles[1] * level.sizeInMapTiles[2])
		for j = 0,level.sizeInMapTiles[2]-1 do
			for i = 0,level.sizeInMapTiles[1]-1 do
				local x = math.floor(i - dx/level.mapTileSize[1])
				local y = math.floor(j - dy/level.mapTileSize[2])
				if x >= 0 and y >= 0 and x < level.sizeInMapTiles[1] and y < level.sizeInMapTiles[2] then
					newMap[i+level.sizeInMapTiles[1]*j] = map[x+level.sizeInMapTiles[1]*y]
				end
			end
		end
		for j=0,level.sizeInMapTiles[2]-1 do
			for i=0,level.sizeInMapTiles[1]-1 do
				map[i+level.sizeInMapTiles[1]*j] = newMap[i+level.sizeInMapTiles[1]*j]
			end
		end
	end
	-- move spawninfos
	for _,spawnInfo in ipairs(level.spawnInfos) do
		spawnInfo.pos[1] = spawnInfo.pos[1] + dx
		spawnInfo.pos[2] = spawnInfo.pos[2] + dy
	end
	-- move objects
	for _,obj in ipairs(game.objs) do
		obj.pos[1] = obj.pos[1] + dx
		obj.pos[2] = obj.pos[2] + dy
	end
end

local MoveWorldWindow = class()

function MoveWorldWindow:init()
	self.opened = ffi.new('bool[1]',false)
	self.xPtr = ffi.new('int[1]',0)
	self.yPtr = ffi.new('int[1]',0)
end

-- draws the button
-- shows the popup if it's opened
function MoveWorldWindow:update()
	if buttonTooltip('Move Whole World') then
		self.opened[0] = true
		self.xPtr[0] = 0
		self.yPtr[0] = 0
	end
	if self.opened[0] then
		ig.igBegin('Move World', self.opened)
		ig.igInputInt('Move X', self.xPtr)
		ig.igInputInt('Move Y', self.yPtr)
		if ig.igButton('OK') then
			doMoveWorld(self.xPtr[0], self.yPtr[0])
			self.opened[0] = false
		end
		ig.igSameLine()
		if ig.igButton('Cancel') then
			self.opened[0] = false
		end
		ig.igEnd()
	end
end

local TileExchangeWindow = class()

-- needs editor for the painting flags and buttons
function TileExchangeWindow:init(editor)
	self.editor = editor
	self.tileTypeFrom = 0
	self.tileTypeTo = 0
	self.tileFrom = 0
	self.tileTo = 0
	self.widthPtr = ffi.new('int[1]',1)
	self.heightPtr = ffi.new('int[1]',1)
	self.opened = ffi.new('bool[1]', false)
	self.transferTilesFromToPtr = ffi.new('bool[1]', true)
	self.transferTilesToFromPtr = ffi.new('bool[1]', true)
end

function TileExchangeWindow:update()
	local level = game.level
	local editor = self.editor
	
	if buttonTooltip('Tile Exchange') then
		self.opened[0] = true
	end
	
	if self.opened[0] then
		ig.igPushIdStr('Tile Exchange Window')
		ig.igBegin('Tile Exchange', self.opened)
		
		checkboxTooltip('Tile Type', editor.paintingTileType)
		ig.igSameLine()
		checkboxTooltip('Fg Tile', editor.paintingFgTile)
		ig.igSameLine()
		checkboxTooltip('Bg Tile', editor.paintingBgTile)

		ig.igSeparator()

		--[[ here we're going to need a button that shows a popup that lets you choose
		ig.igPushIdStr('Tile Type From')
		editor:tileTypeButton(self.tileTypeFrom
		ig.igPopId()
		ig.igPushIdStr('Tile Type To')
		ig.igPopId()
		--]]

		ig.igPushIdStr('Tile From')
		editor.pickTileWindow:openButton('from', self.tileFrom, function(i)
			self.tileFrom = i
		end)
		
		ig.igPopId()
		ig.igSameLine()
		
		ig.igPushIdStr('Tile To')
		editor.pickTileWindow:openButton('to', self.tileTo, function(i)
			self.tileTo = i
		end)
		ig.igPopId()
		
		ig.igSliderInt('width', self.widthPtr, 1, 64)
		ig.igSliderInt('height', self.heightPtr, 1, 64)
		
		checkboxTooltip('from->to', self.transferTilesFromToPtr)
		ig.igSameLine()
		checkboxTooltip('to->from', self.transferTilesToFromPtr)

		if self.tileFrom > 0
		and self.tileTo > 0	-- TODO handle clear for 'move to' to support selective erases
		and (self.transferTilesFromToPtr[0] or self.transferTilesToFromPtr[0])
		then 
			local texpackImage = level.texpackImage
			local width, height, channels, format = texpackImage.width, texpackImage.height, texpackImage.channels, texpackImage.format
			local tilesWide = width / level.tileSize
			local tilesHigh = height / level.tileSize
			local moveFromXMin = (self.tileFrom-1) % tilesWide
			local moveFromYMin = (self.tileFrom-moveFromXMin-1) / tilesWide
			local moveFromXMax = moveFromXMin + self.widthPtr[0] - 1
			local moveFromYMax = moveFromYMin + self.heightPtr[0] - 1
			local moveToXMin = (self.tileTo-1) % tilesWide
			local moveToYMin = (self.tileTo-moveToXMin-1) / tilesWide
			local moveToXMax = moveToXMin + self.widthPtr[0] - 1
			local moveToYMax = moveToYMin + self.heightPtr[0] - 1

			if ig.igButton('Swap In Texpack')
			then
				local newTexpackImage = Image(width, height, channels, format)
				for j=0,tilesHigh-1 do
					for i=0,tilesWide-1 do
						for u=0,level.tileSize-1 do
							for v=0,level.tileSize-1 do
								local dx = u + level.tileSize * i
								local dy = v + level.tileSize * j
								local sx, sy = dx, dy
								if self.transferTilesFromToPtr[0] 
								and i >= moveFromXMin and i <= moveFromXMax
								and j >= moveFromYMin and j <= moveFromYMax
								then
									sx = u + level.tileSize * (i - moveFromXMin + moveToXMin)
									sy = v + level.tileSize * (j - moveFromYMin + moveToYMin)
								elseif self.transferTilesToFromPtr[0]
								and i >= moveToXMin and i <= moveToXMax
								and j >= moveToYMin and j <= moveToYMax
								then
									sx = u + level.tileSize * (i - moveToXMin + moveFromXMin)
									sy = v + level.tileSize * (j - moveToYMin + moveFromYMin)
								end
								for k = 0,channels-1 do
									newTexpackImage.buffer[k+channels*(dx+width*dy)] = 
										texpackImage.buffer[k+channels*(sx+width*sy)]
								end
							end
						end
					end
				end
				level.texpackImage = newTexpackImage
				level.texpackTex:delete()
				level.texpackTex = Tex2D{
					image = level.texpackImage,
					minFilter = gl.GL_NEAREST,
					magFilter = gl.GL_NEAREST,
					internalFormat = gl.GL_RGBA,
					format = gl.GL_RGBA,
				}
			end
			if ig.igIsItemHovered() then
				ig.igBeginTooltip()
				ig.igText('Exchange two tile ranges within the texpack.\n'
						..'The map will retain its tile indexes, so\n'
						..'textures will appear exchanged in the map as well.')
				ig.igEndTooltip()
			end
			
			if ig.igButton('Swap in Level') then
				local maps = table()
				if editor.paintingFgTile[0] then maps:insert(level.fgTileMapOriginal) end
				if editor.paintingBgTile[0] then maps:insert(level.bgTileMapOriginal) end
				for _,map in ipairs(maps) do
					for y=0,level.size[2]-1 do
						for x=0,level.size[1]-1 do
							local tile = map[x+level.size[1]*y]
							if tile > 0 then
								local tx = (tile-1) % tilesWide
								local ty = (tile-tx-1) / tilesWide
								local update
								if self.transferTilesFromToPtr[0]
								and tx >= moveFromXMin and tx <= moveFromXMax
								and ty >= moveFromYMin and ty <= moveFromYMax
								then
									tx = tx - moveFromXMin + moveToXMin
									ty = ty - moveFromYMin + moveToYMin
									update = true
								elseif self.transferTilesToFromPtr[0]
								and tx >= moveToXMin and tx <= moveToXMax
								and ty >= moveToYMin and ty <= moveToYMax
								then
									tx = tx - moveToXMin + moveFromXMin
									ty = ty - moveToYMin + moveFromYMin
									update = true
								end
								if update then
									map[x+level.size[1]*y] = 1 + tx + tilesWide * ty
								end
							end
						end
					end
				end
				level:refreshTiles()
			end
			
			if ig.igIsItemHovered() then
				ig.igBeginTooltip()
				ig.igText('Exchange two tile ranges of indexes within the map.')
				ig.igEndTooltip()
			end
		end

		ig.igEnd()
		ig.igPopId()
	end
end

local ConsoleWindow = class()

function ConsoleWindow:init()
	self.opened = ffi.new('bool[1]', false)
	self.buffer = ffi.new('char[?]', 2048)
end

function ConsoleWindow:update()
	if buttonTooltip('Console') then
		self.opened[0] = true
	end

	if not self.opened[0] then return end
	local bufferSize = ffi.sizeof(self.buffer)

	ig.igBegin('Console', self.opened)
	local size = ig.igGetWindowSize()
	if ig.igInputTextMultiline('code', self.buffer, bufferSize,
		ig.ImVec2(size.x,size.y - 56),
		ig.ImGuiInputTextFlags_EnterReturnsTrue
		+ ig.ImGuiInputTextFlags_AllowTabInput)
	or ig.igButton('run code')
	then
		self.buffer[bufferSize-1] = 0
		local code = ffi.string(self.buffer)
		local sandbox = require 'base.script.singleton.sandbox'
		print('executing...\n'..code)
		sandbox(code)
	end
	ig.igSameLine()
	if ig.igButton('clear code') then
		ffi.fill(self.buffer, bufferSize)
	end
	ig.igEnd()
end

local InitFileWindow = class()

function InitFileWindow:init()
	self.opened = ffi.new('bool[1]',false)
	-- hmm ... init files have a max size ...
	self.buffer = ffi.new('char[?]', 65536)
end

function InitFileWindow:update()
	if self.opened[0] then
		local bufferSize = ffi.sizeof(self.buffer)
		ig.igBegin('Level Init Code', self.opened)
		local size = ig.igGetWindowSize()
		ig.igInputTextMultiline('code', self.buffer, bufferSize,
			ig.ImVec2(size.x, size.y - 56),	-- minus titlebar height and button height
			ig.ImGuiInputTextFlags_AllowTabInput)
		if ig.igButton('Save') then
			self.buffer[bufferSize-1] = 0
			local code = ffi.string(self.buffer)
			local dir = modio.search[1]..'/maps/'..modio.levelcfg.path
			file[dir..'/init.lua'] = code
			self.opened[0] = false
		end
		ig.igSameLine()
		if ig.igButton('Cancel') then
			self.opened[0] = false
		end
		ig.igEnd()
	end
end

function InitFileWindow:open()
	self.opened[0] = true
	local dir = modio.search[1]..'/maps/'..modio.levelcfg.path
	local initFileData = file[dir..'/init.lua'] or ''
	local bufferSize = ffi.sizeof(self.buffer)
	ffi.copy(self.buffer, initFileData, math.min(#initFileData, bufferSize-1))
	self.buffer[bufferSize-1] = 0
end


local editModePaintTiles = 0
local editModeFillTiles = 1
local editModeSmoothTiles = 2
local editModeObjects = 3
local editModeRooms = 4
local editModeMove = 5	-- drag to make rect, then click-and-drag rect to move it around

function Editor:init()	
	self.editMode = ffi.new('int[1]', editModePaintTiles)
	
	self.paintingTileType = ffi.new('bool[1]',true)
	self.paintingFgTile = ffi.new('bool[1]',true)
	self.paintingBgTile = ffi.new('bool[1]',true)
	self.paintingBackground = ffi.new('bool[1]',true)
	self.paintingObjects = ffi.new('bool[1]',true)	-- only used by move tool 

	-- paint & smooth brush options:
	self.brushTileWidth = ffi.new('int[1]',1)
	self.brushTileHeight = ffi.new('int[1]',1)
	-- paint brush options:
	self.brushStampWidth = ffi.new('int[1]',1)
	self.brushStampHeight = ffi.new('int[1]',1)
	self.smoothWhilePainting = ffi.new('bool[1]',0)
	self.smoothBorder = ffi.new('int[1]',1)
	-- smooth brush options:
	self.alignPatchToAnything = ffi.new('bool[1]',true)
	self.smoothDiagLevel = ffi.new('int[1]',0)

	self.selectedTileTypeIndex = ffi.new('int[1]',0)
	self.selectedFgTileIndex = 0
	self.selectedBgTileIndex = 0
	self.selectedBackgroundIndex = ffi.new('int[1]',0)
	self.selectedSpawnIndex = ffi.new('int[1]',0)
	self.selectedRoomIndex = ffi.new('int[1]',0)

	self.showTileTypes = ffi.new('bool[1]',true)
	self.showSpawnInfos = ffi.new('bool[1]',true)
	self.showObjects = ffi.new('bool[1]',true)
	self.showRooms = ffi.new('bool[1]',true)
	
	self.noClipping = ffi.new('bool[1]',true)
	self.unsmooth = ffi.new('bool[1]',false)

	self.pickTileTypeWindow = PickTileTypeWindow(self)
	self.pickTileWindow = PickTileWindow()
	self.moveWorldWindow = MoveWorldWindow()
	self.tileExchangeWindow = TileExchangeWindow(self)
	self.consoleWindow = ConsoleWindow()
	self.initFileWindow = InitFileWindow()
end

local colorForTypeTable = table()
local predefinedColors = table{
	{0,0,0},
	{1,1,1},
	{1,0,0},
	{1,1,0},
	{0,1,0},
	{0,1,1},
	{0,0,1},
	{1,0,1},
}
local function colorForType(index)
	local color = colorForTypeTable[index]
	if not color then 
		color = predefinedColors:remove(1) or vec3(math.random(), math.random(), math.random()):normalize()
		color = {color[1], color[2], color[3], .7}
		colorForTypeTable[index] = color
	end
	return color
end

function Editor:setTileKeys()

	-- tile types
	local tileTypes = table(game.levelcfg.tileTypes)
	tileTypes[0] = {name='empty'}
	self.tileOptions = tileTypes:map(function(tileType,tileTypeIndex)
		local level = game.level
		local width, height = level.tileSize, level.tileSize
		local channels = 4
		local border = 1
		local misc
		local image = Image(width, height, channels, 'unsigned char', function(i,j)
			if i < border or j < border or i >= width-border or j >= height-border then return 0,0,0,0 end
			local plane = tileType.plane
			if plane then
				local x=(i+.5)/level.tileSize
				local y=(j+.5)/level.tileSize
				local y = x * plane[1] + y * plane[2] + plane[3]
				if y < 0 then return 255,255,255,255 end
			elseif tileType.solid
			and tileTypeIndex == 1 -- only do solid white for the default solid tile	
			then
				return 255,255,255,255
			else
				misc = true
				local color = colorForType(tileTypeIndex)
				return 
					ffi.cast('unsigned char',color[1]*255),
					ffi.cast('unsigned char',color[2]*255),
					ffi.cast('unsigned char',color[3]*255),
					255
			end
			return 0,0,0,0
		end)
		-- make solid image hollow
		if not misc then
			image = Image(image.width, image.height, image.channels, image.format, function(i,j)
				if i > border-1 and j > border-1 and i < image.width-border-1 and j < image.height-border-1 then
					if image.buffer[0+image.channels*(i+image.width*j)] > 0 
					and image.buffer[0+image.channels*(i-1+image.width*j)] > 0
					and image.buffer[0+image.channels*(i+1+image.width*j)] > 0
					and image.buffer[0+image.channels*(i+image.width*(j-1))] > 0
					and image.buffer[0+image.channels*(i+image.width*(j+1))] > 0
					then
						return 0,0,0,0
					end
				end
				return image.buffer[0+image.channels*(i+image.width*j)],
						image.buffer[1+image.channels*(i+image.width*j)],
						image.buffer[2+image.channels*(i+image.width*j)],
						image.buffer[3+image.channels*(i+image.width*j)]
			end)
		end
		local tex = Tex2D{
			image = image,
			minFilter = gl.GL_NEAREST,
			magFilter = gl.GL_NEAREST,
			internalFormat = gl.GL_RGBA,
			format = gl.GL_RGBA,
		}
		return {
			tileType = tileType,
			tex = tex,
		}
	end)

	-- backgrounds
	self.backgroundOptions = game.level.backgrounds:map(function(background)
		return {
			background = background,
		}
	end)
	self.backgroundOptions[0] = {
		background = {name='empty'},
	}

	-- spawn
	self.spawnOptions = game.levelcfg.spawnTypes:map(function(spawnType)
		return {
			spawnType = spawnType,
		}
	end)
end

function Editor:updateGUI()
	ig.igText('EDITOR')
	local level = game.level

	local function alert(str)
		-- [[
		print(str)
		--]]
		--[[
		ig.igOpenPopup('Error!')
		if ig.igBeginPopupModal('Error!', nil, ig.ImGuiWindowFlags_AlwaysAutoResize) then
			ig.igText(str)
			if ig.igButton('OK') then
				ig.igCloseCurrentPopup()
			end
			ig.igEndPopup()
		end
		--]]
	end

	self.pickTileTypeWindow:update()
	self.pickTileWindow:update()

	do --if ig.igCollapsingHeader('Display...') then
		self.viewSizePtr = self.viewSizePtr or ffi.new('float[1]')
		self.viewSizePtr[0] = game.viewSize
		ig.igSliderFloat('zoom', self.viewSizePtr, 1, math.max(level.size:unpack()), '%.3f', 3)
		game.viewSize = tonumber(self.viewSizePtr[0])
	
		checkboxTooltip('no clipping', self.noClipping)
		ig.igSameLine()
		checkboxTooltip('Show Tile Types', self.showTileTypes)
		ig.igSameLine()
		checkboxTooltip('Show Spawn Infos', self.showSpawnInfos)
		ig.igSameLine()
		checkboxTooltip('Show Objects', self.showObjects)
		ig.igSameLine()
		checkboxTooltip('Show Rooms', self.showRooms)
	end
	
	do --if ig.igCollapsingHeader('Misc...') then
		self.removeAllObjsPtr = self.removeAllObjsPtr or ffi.new('bool[1]',false)
		checkboxTooltip('remove all objs', self.removeAllObjsPtr)
		if self.removeAllObjsPtr[0] then
			for _,spawnInfo in ipairs(level.spawnInfos) do
				spawnInfo:removeObj()
			end
		end
		ig.igSameLine()
		if buttonTooltip('respawn all objs') then
			for _,spawnInfo in ipairs(level.spawnInfos) do
				spawnInfo:removeObj()
				spawnInfo:respawn()
			end
		end

		ig.igSameLine()
		self.moveWorldWindow:update()
		ig.igSameLine()
		self.tileExchangeWindow:update()
		ig.igSameLine()
		self.consoleWindow:update()
		ig.igSeparator()
	end

	-- call this before the Edit Level Init Code button so the pointer exists
	self.initFileWindow:update()
	do --if ig.igCollapsingHeader('File...') then
		if buttonTooltip('Save Map') then
			self:saveMap()
		end
		ig.igSameLine()
		if buttonTooltip('Save Backgrounds') then
			self:saveBackgrounds()
		end
		ig.igSameLine()
		if buttonTooltip('Save Texpack') then
			self:saveTexpack()
		end
		ig.igSameLine()
		if buttonTooltip('Edit Level Init Code') then
			self.initFileWindow:open()
		end
		ig.igSeparator()
	end

	radioTooltip('Paint Tiles', self.editMode, editModePaintTiles)
	ig.igSameLine()
	radioTooltip('Fill Tiles', self.editMode, editModeFillTiles)
	ig.igSameLine()
	radioTooltip('Smooth Tiles', self.editMode, editModeSmoothTiles)
	ig.igSameLine()
	radioTooltip('Edit Objects', self.editMode, editModeObjects)
	ig.igSameLine()
	radioTooltip('Edit Rooms', self.editMode, editModeRooms)
	ig.igSameLine()
	radioTooltip('Move', self.editMode, editModeMove)
	ig.igSeparator()

	if self.editMode[0] == editModePaintTiles 
	or self.editMode[0] == editModeFillTiles
	or self.editMode[0] == editModeSmoothTiles
	or self.editMode[0] == editModeMove
	then
		-- not sure if I should use brushes for painting objects or not ...
		checkboxTooltip('Tile Type', self.paintingTileType)
		ig.igSameLine()
		checkboxTooltip('Fg Tile', self.paintingFgTile)
		ig.igSameLine()
		checkboxTooltip('Bg Tile', self.paintingBgTile)
		ig.igSameLine()
		checkboxTooltip('Background', self.paintingBackground)
		if self.editMode[0] == editModeMove then
			ig.igSameLine()
			checkboxTooltip('Objects', self.paintingObjects)
		end
		ig.igSeparator()
	end

	if self.editMode[0] == editModeMove then
		self.moveToolStampPtr = self.moveToolStampPtr or ffi.new('bool[1]',false)
		checkboxTooltip('Stamp Selection', self.moveToolStampPtr)
	end

	if self.editMode[0] == editModePaintTiles
	or self.editMode[0] == editModeFillTiles
	or self.editMode[0] == editModeSmoothTiles
	then
		
		if self.paintingTileType[0]
		--and ig.igCollapsingHeader('Tile Type Options:',0)
		then
			self.pickTileTypeWindow:openButton(self.selectedTileTypeIndex[0], function(i)
				self.selectedTileTypeIndex[0] = i
			end)
		end
		
		if (self.paintingFgTile[0] or self.paintingBgTile[0])
		--and ig.igCollapsingHeader('Tile Texture:')
		then
			ig.igSameLine()	
			ig.igBeginChild('fg and bg tiles', ig.ImVec2(100, 88))
			for _,side in ipairs{'Fg', 'Bg'} do
				if _ > 1 then ig.igSameLine() end
				-- why do I have to explicitly specify this child's size?
				ig.igBeginChild('side '..side, ig.ImVec2(40, 64))
				
				ig.igPushIdStr(side)
				local lc = side:lower()	
				self.pickTileWindow:openButton(side:lower()..' tile', self['selected'..side..'TileIndex'], function(i)
					self['selected'..side..'TileIndex'] = i
				end)
				
				if ig.igButton('Clear') then
					self['selected'..side..'TileIndex'] = 0
				end
				ig.igPopId()
			
				ig.igEndChild()
			end
			if ig.igButton('Swap Fg & Bg') then
				self.selectedFgTileIndex, self.selectedBgTileIndex =
					self.selectedBgTileIndex, self.selectedFgTileIndex
			end
			ig.igEndChild()
		end		
	
		do --if ig.igCollapsingHeader('Brush Options:') then
			-- TODO fill-smoothing?  hmm, sounds dangerously contradictive
			if self.editMode[0] == editModePaintTiles
			or self.editMode[0] == editModeSmoothTiles then
				-- TODO separate sizes for paint and smooth brushes?
				ig.igSliderInt('Brush Width', self.brushTileWidth, 1, 20)
				ig.igSliderInt('Brush Height', self.brushTileHeight, 1, 20)
				if self.editMode[0] == editModePaintTiles then
					ig.igSliderInt('Stamp Width', self.brushStampWidth, 1, 20)
					ig.igSliderInt('Stamp Height', self.brushStampHeight, 1, 20)
					if self.smoothWhilePainting[0] then
						ig.igSliderInt('Smooth Border', self.smoothBorder, 0, 10)
					end
					checkboxTooltip('Smooth While Painting', self.smoothWhilePainting)
				end
				if self.editMode[0] == editModeSmoothTiles
				or (self.editMode[0] == editModePaintTiles and self.smoothWhilePainting[0])
				then
					ig.igSameLine()
					checkboxTooltip('Unsmooth', self.unsmooth)
					ig.igSameLine()
					checkboxTooltip('Smooth Aligns Patch to Anything', self.alignPatchToAnything)
					ig.igSameLine()
					radioTooltip("Smooth Tiles to 90'", self.smoothDiagLevel, 0)
					ig.igSameLine()
					radioTooltip("Smooth Tiles to 45'", self.smoothDiagLevel, 1)
					ig.igSameLine()
					radioTooltip("Smooth Tiles to 27'", self.smoothDiagLevel, 2)
				end
			end
		end
	
		if self.paintingBackground[0]
		--and ig.igCollapsingHeader('Background Options:')
		then
			for i=0,#self.backgroundOptions do
				ig.igPushIdStr('background '..i)
				local background = self.backgroundOptions[i].background
				
				local tex = background.tex
				local texIDPtr = ffi.cast('void*',ffi.cast('intptr_t',tex and tex.id or 0))
				if ig.igImageButton(
					texIDPtr,
					ig.ImVec2(32, 32), --size
					ig.ImVec2(0,0),	--uv0
					ig.ImVec2(1,1),	--uv1
					-1,	-- frame_padding
					i == self.selectedBackgroundIndex and ig.ImVec4(1,1,0,.25) or ig.ImVec4(0,0,0,0))	-- bg_col
				then
					self.selectedBackgroundIndex[0] = i
				end
				if ig.igIsItemHovered() then
					ig.igBeginTooltip()
					ig.igText(background.name)
					ig.igEndTooltip()
				end
				
				ig.igSameLine()
				ig.igPushIdStr('radio')
				ig.igRadioButton('', self.selectedBackgroundIndex, i)
				ig.igPopId()

				if i > 0 then
					ig.igSameLine()
					ig.igPushIdStr('tree')
					if ig.igTreeNode('') then
						local float = ffi.new('float[1]')
						for _,field in ipairs{'scaleX', 'scaleY', 'scrollX', 'scrollY'} do
							float[0] = background[field] or 0
							ig.igInputFloat(field, float)
							background[field] = float[0]
						end
						ig.igTreePop()
					end
					ig.igPopId()
				end
				ig.igPopId()
			end
		end
	
	elseif self.editMode[0] == editModeObjects then
		do --if ig.igCollapsingHeader('Object Type:', ig.ImGuiTreeNodeFlags_DefaultOpen) then
			for i,spawnOption in ipairs(self.spawnOptions) do
				ig.igPushIdStr('spawnOption #'..i)
				local spawnType = spawnOption.spawnType
				local spawnClass = require(spawnType.spawn)
				local sprite = spawnClass.sprite
				-- can't animate, or we'll get back dif texIDs, and imgui won't distinguish what is clicked
				local tex = sprite and animsys:getTex(sprite, 'stand', game.time)
				local texIDPtr = ffi.cast('void*',ffi.cast('intptr_t',tex and tex.id or 0))
				if ig.igImageButton(
					texIDPtr,
					ig.ImVec2(32, 32), --size
					ig.ImVec2(0, 0), --uv0
					ig.ImVec2(1, 1), --uv1
					-1,	-- frame_padding
					i == self.selectedSpawnIndex[0] and ig.ImVec4(1,1,0,.25) or ig.ImVec4(0,0,0,0))	-- bg_col
				then
					self.selectedSpawnIndex[0] = i
				end
				-- it would be nice if wrapping controls was automatic
				local tilesWide = 4
				if i % tilesWide > 0 and i < #self.spawnOptions then
					ig.igSameLine()	
				end
				if ig.igIsItemHovered() then
					ig.igBeginTooltip()
					ig.igText(spawnType.spawn)
					ig.igEndTooltip()
				end
				ig.igPopId()
			end
		end
		if self.selectedSpawnInfo then
			do --if ig.igCollapsingHeader('Object Properties:') then
				local textBufferSize = 2048
			
				local fieldTypeNames = table{'string', 'number', 'boolean', 'vec2', 'vec4', 'box2', 'tile'}
				local fieldTypeEnum = {}
				for i,fieldTypeName in ipairs(fieldTypeNames) do
					fieldTypeEnum[fieldTypeName] = i-1	-- minus one because the combo is 0-based
				end
				
				local function createProp(k,v, fieldType)
					if k == 'obj' then return end		-- obj is reserved
					
					assert(type(k) == 'string')	-- non-string keys in spawnobjects?
					-- non-string values?
					local prop = {
						k = k,
						--kstr = ffi.new('char[?]', textBufferSize),
					}
					
					--ffi.copy(prop.kstr, k, math.min(#k+1, textBufferSize-1)) 
					--infno.kstr[textBufferSize-1] = 0
			
					if not fieldType then
						-- deduce from value
						fieldType = fieldTypeEnum.string
						if type(v) == 'boolean' then
							fieldType = fieldTypeEnum.boolean
						elseif type(v) == 'table' then
							if #v == 2 then
								fieldType = fieldTypeEnum.vec2
							elseif #v == 4 then
								fieldType = fieldTypeEnum.vec4
							elseif v.min and v.max then
								fieldType = fieldTypeEnum.box2
							end
						-- fieldTypeEnum.tile is used for only specific fields
						--  so auto-detect will be difficult 
						-- for now it's predefined, based on k: fieldTypeEnum.tile
						elseif type(v) == 'number' then
							if k == 'tileIndex' then
								fieldType = fieldTypeEnum.tile
							else
								fieldType = fieldTypeEnum.number
							end
						end
					end
					prop.fieldType = ffi.new('int[1]',fieldType)
					
					if fieldType == fieldTypeEnum.string then
						prop.vptr = ffi.new('char[?]', textBufferSize)
						local vs = tostring(v)
						ffi.copy(prop.vptr, vs, math.min(#vs+1, textBufferSize-1)) 
						prop.vptr[textBufferSize-1] = 0
					elseif fieldType == fieldTypeEnum.number then
						prop.vptr = ffi.new('float[1]', v)
					elseif fieldType == fieldTypeEnum.boolean then 
						prop.vptr = ffi.new('bool[1]', v)
					elseif fieldType == fieldTypeEnum.vec2 then
						prop.vptr = ffi.new('float[2]', v[1], v[2])
					elseif fieldType == fieldTypeEnum.vec4 then
						prop.vptr = ffi.new('float[4]', v[1], v[2], v[3], v[4])
					elseif fieldType == fieldTypeEnum.box2 then
						prop.vptr = ffi.new('float[4]', v.min[1], v.min[2], v.max[1], v.max[2])
					elseif fieldType == fieldTypeEnum.tile then
						prop.vptr = ffi.new('int[1]', v)
					end

					return prop	
				end

				-- if we selected a new object
				if self.selectedSpawnInfo ~= self.lastSelectedSpawnInfo then
					self.spawnInfoProps = table()
					-- put these first and in order	
					self.spawnInfoProps:insert(createProp('spawn', self.selectedSpawnInfo.spawn))
					self.spawnInfoProps:insert(createProp('pos', self.selectedSpawnInfo.pos))
					-- and add the rest
					for k,v in pairs(self.selectedSpawnInfo) do
						if k ~= 'obj' and k ~= 'pos' and k ~= 'spawn' then
							self.spawnInfoProps:insert(createProp(k,v))
						end
					end
					self.lastSelectedSpawnInfo = self.selectedSpawnInfo
				end
					
				for i=#self.spawnInfoProps,1,-1 do
					local prop = self.spawnInfoProps[i]
					local propTitle = prop.k
					
					ig.igPushIdStr('spawnprop #'..i)
								
					if prop.fieldType[0] == fieldTypeEnum.string then
						local done
						if prop.multiLineVisible then
							ig.igPushIdStr('multiline')
							-- ctrl+enter returns by default?
							done = ig.igInputTextMultiline(propTitle, prop.vptr, textBufferSize,
								ig.ImVec2(0,0),
								ig.ImGuiInputTextFlags_EnterReturnsTrue
								+ ig.ImGuiInputTextFlags_AllowTabInput)
							done = done or ig.igButton('done editing')
							ig.igPopId()
						else
							ig.igPushIdStr('singleline')
							done = ig.igInputText(propTitle, prop.vptr, textBufferSize, ig.ImGuiInputTextFlags_EnterReturnsTrue + ig.ImGuiInputTextFlags_AllowTabInput)
							ig.igPopId()
						end
						if done then
							-- save changes
							self.selectedSpawnInfo[prop.k] = ffi.string(prop.vptr)
							prop.multiLineVisible = false
						end					
					
						ig.igSameLine()
						local bool = ffi.new('bool[1]', prop.multiLineVisible or false)
						checkboxTooltip('...', bool)
						prop.multiLineVisible = bool[0]
			
					elseif prop.fieldType[0] == fieldTypeEnum.number then
						ig.igInputFloat(propTitle, prop.vptr) 
						self.selectedSpawnInfo[prop.k] = prop.vptr[0]
					elseif prop.fieldType[0] == fieldTypeEnum.boolean then
						checkboxTooltip(propTitle, prop.vptr)
						self.selectedSpawnInfo[prop.k] = prop.vptr[0]
					elseif prop.fieldType[0] == fieldTypeEnum.vec2 then
						ig.igInputFloat2(propTitle, prop.vptr)
						self.selectedSpawnInfo[prop.k][1] = prop.vptr[0]
						self.selectedSpawnInfo[prop.k][2] = prop.vptr[1]
		
						--[[ it'd be nice to toggle fields between vector/point
						but that'd meen keeping track of that flag even after it is deselected
						and that would mean keeping track of the flag for *all* objs
						two ways to do that:
						1) make different types for vectors vs points (needlessly complex for file formats)
						2) allow the user/script to toggle/specify them for all objects at once
						in the end ... just use spawninfos for positions whenever possible
						ig.igSameLine()
						local bool = ffi.new('bool[1]', prop.isAbsolute)
						checkboxTooltip('abs', bool)
						prop.isAbsolute = bool
						--]]
					elseif prop.fieldType[0] == fieldTypeEnum.vec4 then
						ig.igInputFloat4(propTitle, prop.vptr)
						self.selectedSpawnInfo[prop.k][1] = prop.vptr[0]
						self.selectedSpawnInfo[prop.k][2] = prop.vptr[1]
						self.selectedSpawnInfo[prop.k][3] = prop.vptr[2]
						self.selectedSpawnInfo[prop.k][4] = prop.vptr[3]
					elseif prop.fieldType[0] == fieldTypeEnum.box2 then
						ig.igInputFloat4(propTitle, prop.vptr)
						self.selectedSpawnInfo[prop.k].min[1] = prop.vptr[0]
						self.selectedSpawnInfo[prop.k].min[2] = prop.vptr[1]
						self.selectedSpawnInfo[prop.k].max[1] = prop.vptr[2]
						self.selectedSpawnInfo[prop.k].max[2] = prop.vptr[3]
					elseif prop.fieldType[0] == fieldTypeEnum.tile then
						self.pickTileWindow:openButton(nil, prop.vptr[0], function(tileIndex)
							prop.vptr[0] = tileIndex
							self.selectedSpawnInfo[prop.k] = prop.vptr[0]
						end)
						ig.igSameLine()
						ig.igText(prop.vptr[0]..' -- '..propTitle)
					end
					
					if prop.k ~= 'pos' and prop.k ~= 'spawn' then
						ig.igSameLine()
						if ig.igButton('X') then
							self.spawnInfoProps:remove(i)
							self.selectedSpawnInfo[prop.k] = nil
						end
					end
					
					ig.igPopId()
				end
				
				ig.igSeparator()
	
				self.newFieldType = self.newFieldType or ffi.new('int[1]', 0)
				ig.igCombo('new field type', self.newFieldType, fieldTypeNames)

				self.newFieldStr = self.newFieldStr or ffi.new('char[?]', textBufferSize)
				if ig.igInputText('new field name', self.newFieldStr, textBufferSize, ig.ImGuiInputTextFlags_EnterReturnsTrue)
				then
					local k = ffi.string(self.newFieldStr)
					if k == 'obj' then
						alert("can't use the reserved field 'obj'")
					elseif self.selectedSpawnInfo[k] ~= nil then
						alert("the field "..k.." already exists")
					else
						local fieldType = self.newFieldType[0]
						local v
						if fieldType == fieldTypeEnum.string then
							v = ''
						elseif fieldType == fieldTypeEnum.number then
							v = 0
						elseif fieldType == fieldTypeEnum.boolean then
							v = false
						elseif fieldType == fieldTypeEnum.vec2 then
							v = vec2(0,0)
						elseif fieldType == fieldTypeEnum.vec4 then
							v = vec4(1,1,1,1)
						elseif fieldType == fieldTypeEnum.box2 then
							v = box2(-.5, 0, .5, 1)
						elseif fieldType == fieldTypeEnum.tile then
							v = 0
						end
						self.selectedSpawnInfo[k] = v
						self.spawnInfoProps:insert(createProp(k, v, fieldType))
					end
				end
			end
			if ig.igButton('spawn obj') then
				self.selectedSpawnInfo:removeObj()
				self.selectedSpawnInfo:respawn()
			end
		end
	elseif self.editMode[0] == editModeRooms then
		ig.igInputInt('Room Value', self.selectedRoomIndex)
		if ig.igButton('New Room Number') then
			local roomsUsed = table()
			for ry = 1,level.sizeInMapTiles[2] do
				for rx = 1,level.sizeInMapTiles[1] do
					local roomIndex = level.roomMap[rx-1 + level.sizeInMapTiles[1]*(ry-1)]
					roomsUsed[roomIndex] = true
				end
			end
			for i=0,#roomsUsed:keys() do
		 		if not roomsUsed[i] then
					self.selectedRoomIndex[0] = i
					break
				end
			end
		end
	end
end



--[[
return 'true' if we're processing something
--]]
function Editor:event(event)
	self.isHandlingKeyboard = ig.igGetIO()[0].WantCaptureKeyboard

	-- check for enable/disable
	if event.type == sdl.SDL_KEYDOWN
	or event.type == sdl.SDL_KEYUP
	then
		local buttonDown = event.type == sdl.SDL_KEYDOWN
		if event.key.keysym.sym == 167 then	-- ` key for editor
			if buttonDown and not self.isHandlingKeyboard then
				self.active = not self.active
				return true
			end
		elseif event.key.keysym.sym == sdl.SDLK_LSHIFT
		or event.key.keysym.sym == sdl.SDLK_RSHIFT
		then
			self.shiftDown = buttonDown
		end
	end

	if not self.active then return end

	-- active editor events here
end

function Editor:update()
	-- do tihs before checking editor.active
	-- so if the editor shuts off, the player will be able to walk again
	local player = game.players[1]
	if self.active and self.noClipping[0] then
		local dt = game.sysDeltaTime
		local noClipSpeed = 2 * game.viewSize
		player.pos[1] = player.pos[1] + dt * player.inputLeftRight * noClipSpeed
		player.pos[2] = player.pos[2] + dt * player.inputUpDown * noClipSpeed
		player.vel[1] = 0
		player.vel[2] = 0
		player.invincibleEndTime = game.time + .1
		player.isClipping = true
		player.useGravity = false
		player.collidesWithWorld = false
		player.collidesWithObjects = false
	else
		if player.isClipping then
			player.isClipping = nil
			player.useGravity = true
			player.collidesWithWorld = nil
			player.collidesWithObjects = nil
		end
	end
	
	if not self.active then
		game.viewSize = nil
		return
	end
	sdl.SDL_ShowCursor(sdl.SDL_ENABLE)

	self.isHandlingMouse = ig.igGetIO()[0].WantCaptureMouse
	if self.isHandlingMouse then return end
	
	local level = game.level
	local mouse = gui.mouse
	if mouse.leftDown then
		local xf = self.viewBBox.min[1] + (self.viewBBox.max[1] - self.viewBBox.min[1]) * mouse.pos[1]
		local yf = self.viewBBox.min[2] + (self.viewBBox.max[2] - self.viewBBox.min[2]) * mouse.pos[2]
		local x = math.floor(xf)
		local y = math.floor(yf)
		if self.editMode[0] == editModePaintTiles
		or self.editMode[0] == editModeFillTiles
		or self.editMode[0] == editModeSmoothTiles
		then
			if self.shiftDown then
				if x >= 1 and y >= 1 and x <= level.size[1] and y <= level.size[2] then
					if self.paintingTileType[0] then
						self.selectedTileTypeIndex[0] = level.tileMapOriginal[x-1+level.size[1]*(y-1)]
					end
					if self.paintingFgTile[0] then
						self.selectedFgTileIndex = level.fgTileMapOriginal[x-1+level.size[1]*(y-1)]
					end
					if self.paintingBgTile[0] then
						self.selectedBgTileIndex = level.bgTileMapOriginal[x-1+level.size[1]*(y-1)]
					end
					if self.paintingBackground[0] then
						self.selectedBackgroundIndex[0] = level.backgroundMapOriginal[x-1+level.size[1]*(y-1)]
					end
				end
			else
				if self.editMode[0] == editModePaintTiles then
					paintBrush.paint(self, x, y)
				elseif self.editMode[0] == editModeFillTiles then
					fillBrush.paint(self, x, y)
				elseif self.editMode[0] == editModeSmoothTiles then
					smoothBrush.paint(self, x, y)
				end
			end
		elseif self.editMode[0] == editModeObjects then	
			-- only on single click
			do	--if mouse.leftDown and not mouse.lastLeftDown then
				if self.shiftDown then
				-- ... hmm this is dif than tiles
				-- search through and pick out a spawn obj under the mouse
					self.selectedSpawnIndex[0] = 0
					self.selectedSpawnInfo = nil
					for _,spawnInfo in ipairs(level.spawnInfos) do
						if spawnInfo.pos[1] == x+.5 and spawnInfo.pos[2] == y then
							self.selectedSpawnIndex[0] = self.spawnOptions:find(nil, function(option)
								return option.spawnType.spawn == spawnInfo.spawn
							end) or 0
							self.selectedSpawnInfo = spawnInfo
						end
					end
				else
					-- and here ... we place a spawn obj ... exactly at mouse pos?
					-- TODO ... no overlaps?
					for i=#level.spawnInfos,1,-1 do
						local spawnInfo = level.spawnInfos[i]
						if spawnInfo.pos[1] == x+.5 and spawnInfo.pos[2] == y then
							spawnInfo:removeObj()
							if self.selectedSpawnInfo == spawnInfo then
								self.selectedSpawnInfo = nil
							end
							level.spawnInfos:remove(i)
						end
					end
					if self.selectedSpawnIndex[0] ~= 0 then
						local spawnInfo = SpawnInfo{
							pos=vec2(x+.5, y),
							spawn=self.spawnOptions[self.selectedSpawnIndex[0]].spawnType.spawn,
						}
						level.spawnInfos:insert(spawnInfo)
						self.selectedSpawnInfo = spawnInfo
						spawnInfo:removeObj()
						spawnInfo:respawn()
					end
				end
			end
		elseif self.editMode[0] == editModeRooms then
			if x >= 1 and y >= 1 and x <= level.size[1] and y <= level.size[2] then
				local rx, ry = level:getMapTilePos(x,y)
				if self.shiftDown then
					self.selectedRoomIndex[0] = level.roomMap[rx-1 + level.sizeInMapTiles[1]*(ry-1)]
				else
					level.roomMap[rx-1 + level.sizeInMapTiles[1]*(ry-1)] = self.selectedRoomIndex[0]
				end
			end
		elseif self.editMode[0] == editModeMove then
			-- mouse press
			if mouse.leftDown and not mouse.lastLeftDown then
				self.movePressPos = vec2(x,y)
				if self.moveBBox
				and x >= self.moveBBox.min[1] and x <= self.moveBBox.max[1]
				and y >= self.moveBBox.min[2] and y <= self.moveBBox.max[2]
				then
					self.isMoving = true
				else
					
					if self.moveToolStampPtr[0] 
					and self.moveBBox 
					then
						-- stamp everything from the upper-left of the move tool to the upper-left of the mouse cursor
						-- TODO (a) transparent overlay (like brush stamps) and (b) center it instead of upper-left
						for _,info in ipairs{
							{map='tileMap', flag=self.paintingTileType[0]},
							{map='fgTileMap', flag=self.paintingFgTile[0]},
							{map='bgTileMap', flag=self.paintingBgTile[0]},
							{map='backgroundMap', flag=self.paintingBackground[0]},
						} do
							if info.flag then
								for srcy=self.moveBBox.min[2],self.moveBBox.max[2] do
									for srcx=self.moveBBox.min[1],self.moveBBox.max[1] do
										if srcx >= 1
										and srcx <= level.size[1]
										and srcy >= 1
										and srcy <= level.size[2]
										then
											local brushWidth = self.moveBBox.max[1] - self.moveBBox.min[1] + 1
											local brushHeight = self.moveBBox.max[2] - self.moveBBox.min[2] + 1
											local dstx = srcx - self.moveBBox.min[1] + math.floor(x - tonumber(brushWidth-1)/2)
											local dsty = srcy - self.moveBBox.min[2] + math.floor(y - tonumber(brushHeight-1)/2)
											if dstx >= 1
											and dstx <= level.size[1]
											and dsty >= 1
											and dsty <= level.size[2]
											then
												level[info.map][(dstx-1)+level.size[1]*(dsty-1)]
													= level[info.map][(srcx-1)+level.size[1]*(srcy-1)] 
												level[info.map..'Original'][(dstx-1)+level.size[1]*(dsty-1)]
													= level[info.map..'Original'][(srcx-1)+level.size[1]*(srcy-1)] 
											end
										end
									end
								end
							end
						end
					else
						self.isMoving = false
						self.moveBBox = nil
					end
				end
			-- mouse drag
			elseif mouse.deltaPos[1] ~= 0 or mouse.deltaPos[2] ~= 0 then
				if self.isMoving then
					local dx = x - self.movePressPos[1]
					local dy = y - self.movePressPos[2]
					if dx ~= 0 or dy ~= 0 then
						-- do the move
						local x1,x2,x3 = self.moveBBox.min[1], self.moveBBox.max[1], 1
						if dx > 0 then
							x1,x2 = x2,x1
							x3 = -x3
						end
						local y1,y2,y3 = self.moveBBox.min[2], self.moveBBox.max[2], 1
						if dy > 0 then
							y1,y2 = y2,y1
							y3 = -y3
						end
						
						for _,info in ipairs{
							{map='tileMap', flag=self.paintingTileType[0]},
							{map='fgTileMap', flag=self.paintingFgTile[0]},
							{map='bgTileMap', flag=self.paintingBgTile[0]},
							{map='backgroundMap', flag=self.paintingBackground[0]},
						} do
							if info.flag then
								for y0=y1,y2,y3 do
									for x0=x1,x2,x3 do
										if math.min(x0,x0+dx) >= 1 and math.max(x0,x0+dx) <= level.size[1]
										and math.min(y0,y0+dy) >= 1 and math.max(y0,y0+dy) <= level.size[2]
										then
											level[info.map][x0+dx-1+level.size[1]*(y0+dy-1)]
												= level[info.map][x0-1+level.size[1]*(y0-1)] 
											level[info.map..'Original'][x0+dx-1+level.size[1]*(y0+dy-1)]
												= level[info.map..'Original'][x0-1+level.size[1]*(y0-1)] 
										end
									end
								end
							end
						end
					
						if self.paintingObjects[0] then
							for _,spawnInfo in ipairs(level.spawnInfos) do
								if spawnInfo.pos[1]-.5 >= self.moveBBox.min[1]
								and spawnInfo.pos[1]-.5 <= self.moveBBox.max[1]
								and spawnInfo.pos[2] >= self.moveBBox.min[2]
								and spawnInfo.pos[2] <= self.moveBBox.max[2]
								then
									spawnInfo.pos[1] = spawnInfo.pos[1] + dx
									spawnInfo.pos[2] = spawnInfo.pos[2] + dy
									-- if it moved then its ig vptr fields are invalidated
									-- so just clear it and have the user select it to regen them again
									if spawnInfo == self.selectedSpawnInfo then
										self.selectedSpawnInfo = nil
									end
								
									local obj = spawnInfo.obj
									if obj
									and obj.pos[1]-.5 >= self.moveBBox.min[1]
									and obj.pos[1]-.5 <= self.moveBBox.max[1]
									and obj.pos[2] >= self.moveBBox.min[2]
									and obj.pos[2] <= self.moveBBox.max[2]
									then
										obj:setPos(obj.pos[1]+dx, obj.pos[2]+dy)
									end
								end
							end
						end
					end
					self.movePressPos[1] = x
					self.movePressPos[2] = y
					self.moveBBox= self.moveBBox + vec2(dx,dy)
				else
					self.moveBBox = box2()	
					self.moveBBox.min[1] = math.min(x, self.movePressPos[1])
					self.moveBBox.min[2] = math.min(y, self.movePressPos[2])
					self.moveBBox.max[1] = math.max(x, self.movePressPos[1])
					self.moveBBox.max[2] = math.max(y, self.movePressPos[2])
				end
			end
		end
	-- not mouse.leftDown
	else
		if self.editMode[0] == editModeMove then
			if mouse.lastLeftDown then
				self.isMoving = false
			end
		end
	end
end

Editor.tileBackColor = {0,0,0,.5}
Editor.tileSelColor = {1,0,0,.5}
function Editor:draw(R, viewBBox)
	if not self.active then return end

	self.viewBBox = box2(viewBBox)
	local level = game.level

	-- show the rooms
	if self.showRooms[0] then
		for rx=1,level.sizeInMapTiles[1] do
			for ry=1,level.sizeInMapTiles[2] do
				local roomIndex = level.roomMap[rx-1 + level.sizeInMapTiles[1] * (ry-1)]
				gui.font:drawUnpacked(
					(rx-1) * level.mapTileSize[1]+1,
					ry * level.mapTileSize[2],
					level.mapTileSize[1]/3,
					-level.mapTileSize[2]/2,
					tostring(roomIndex),
					nil, nil,
					1, 1, 1, .6)	-- color
			
			end
		end
		gl.glEnable(gl.GL_TEXTURE_2D)
		gl.glBindTexture(gl.GL_TEXTURE_2D, 0)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_LINE)
		gl.glLineWidth(3)
		for rx=1,level.sizeInMapTiles[1] do
			for ry=1,level.sizeInMapTiles[2] do
				local roomIndex = level.roomMap[rx-1 + level.sizeInMapTiles[1] * (ry-1)]
				for side,dir in pairs(dirs) do
					local nrx = rx + dir[1]
					local nry = ry + dir[2]
					local neighborRoomIndex = -1
					if nrx >= 1 and nrx <= level.sizeInMapTiles[1]
					and nry >= 1 and nry <= level.sizeInMapTiles[2]
					then
						neighborRoomIndex = level.roomMap[nrx-1 + level.sizeInMapTiles[1] * (nry-1)]
					end
					if neighborRoomIndex ~= roomIndex then
						local x, y, w, h 
						if side == 'up' then
							x = (rx-1)*level.mapTileSize[1]+1
							y = ry*level.mapTileSize[2]+1
							w = level.mapTileSize[1]
							h = .1
						elseif side == 'down' then
							x = (rx-1)*level.mapTileSize[1]+1
							y = (ry-1)*level.mapTileSize[2]+1
							w = level.mapTileSize[1]
							h = .1
						elseif side == 'left' then
							x = (rx-1)*level.mapTileSize[1]+1
							y = (ry-1)*level.mapTileSize[2]+1
							w = .1
							h = level.mapTileSize[2]
						elseif side == 'right' then
							x = rx*level.mapTileSize[1]+1
							y = (ry-1)*level.mapTileSize[2]+1
							w = .1
							h = level.mapTileSize[2]
						end
						R:quad(
							x,y,
							w,h,
							0, 0, 1, 1, 0,
							0, 1, 0, .25)   --color
					end
				end
			end
		end
		gl.glLineWidth(1)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL)
		gl.glEnable(gl.GL_TEXTURE_2D)
	end

	-- draw spawn infos in the level
	if self.showSpawnInfos[0] then
		for _,spawnInfo in ipairs(level.spawnInfos) do
			
			local x,y = spawnInfo.pos:unpack()
			local spawnClass = require(spawnInfo.spawn)
			local sprite = spawnClass.sprite
			local bbox = spawnClass.bbox or Object.bbox
			
			-- draw sprite
			local tex = sprite and animsys:getTex(sprite, 'stand')
			if tex then
				tex:bind()
				
				local sx, sy = 1, 1
				if tex then
					sx = tex.width/level.tileSize
					sy = tex.height/level.tileSize
				end
				if spawnClass.drawScale then
					sx, sy = table.unpack(spawnClass.drawScale)
				end
				
				R:quad(
					x - sx*.5, 
					y,
					sx,
					sy,
					0,1,
					1,-1,
					0,	-- angle
					1,1,1,.4)
				
				tex:unbind()	
			end
			
			-- draw bbox
			gl.glBindTexture(gl.GL_TEXTURE_2D, 0)
			gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_LINE)
			local r,g,b,a = 1,1,1,1
			b = self.selectedSpawnInfo == spawnInfo and 0 or 1
			g = b
			R:quad(
				x + bbox.min[1],
				y + bbox.min[2],
				bbox.max[1] - bbox.min[1],
				bbox.max[2] - bbox.min[2],
				0,1,
				1,-1,
				0,
				r,g,b,a)
			gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL)
			gl.glEnable(gl.GL_TEXTURE_2D)

			-- draw text
			gui.font:drawUnpacked(x-.5,y+1,.5,-.75,spawnInfo.spawn:match('([^%.]*)$'))
			for k,v in pairs(spawnInfo) do
				if k ~= 'pos' and getmetatable(v) == vec2 then
					gl.glBegin(gl.GL_LINES)
					gl.glColor3f(0,1,0)
					gl.glVertex2f(x,y)
					gl.glVertex2f(x+v[1],y+v[2])
					gl.glEnd()
				
					gui.font:drawUnpacked(v[1]-.5,v[2]+1,.5,-.5,k)
				end
			end
			gl.glEnable(gl.GL_TEXTURE_2D)
		end
	end

	-- draw bboxes of objects
	if self.showObjects[0] then
		for _,obj in ipairs(game.objs) do
			local bbox = obj.bbox
			gl.glBindTexture(gl.GL_TEXTURE_2D, 0)
			gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_LINE)
			local r,g,b,a = 1,1,0,1
			R:quad(
				obj.pos[1] + bbox.min[1],
				obj.pos[2] + bbox.min[2],
				bbox.max[1] - bbox.min[1],
				bbox.max[2] - bbox.min[2],
				0,1,
				1,-1,
				0,
				r,g,b,a)
			gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL)
			gl.glEnable(gl.GL_TEXTURE_2D)
		end
	end

	-- clone & offset
	local tileBBox = box2(
		viewBBox.min[1] - game.level.pos[1],
		viewBBox.min[2] - game.level.pos[2],
		viewBBox.max[1] - game.level.pos[1],
		viewBBox.max[2] - game.level.pos[2])

	local itileBBox = box2(
		math.floor(tileBBox.min[1]),
		math.floor(tileBBox.min[2]),
		math.floor(tileBBox.max[1]),
		math.floor(tileBBox.max[2]))
	
	local xmin = itileBBox.min[1]
	local xmax = itileBBox.max[1]
	local ymin = itileBBox.min[2]
	local ymax = itileBBox.max[2]

	if xmin > game.level.size[1] then return end
	if xmax < 1 then return end
	if ymin > game.level.size[2] then return end
	if ymax < 1 then return end
	
	if xmin < 1 then xmin = 1 end
	if xmax > game.level.size[1] then xmax = game.level.size[1] end
	if ymin < 1 then ymin = 1 end
	if ymax > game.level.size[2] then ymax = game.level.size[2] end

	if self.showTileTypes[0] then
		for y=ymin,ymax do
			for x=xmin,xmax do
				local tiletype = game.level.tileMapOriginal[(x-1)+game.level.size[1]*(y-1)]
				if tiletype ~= 0 then
					local option = self.tileOptions[tiletype]
					local tex = option and option.tex
					if tex then tex:bind() end
					R:quad(
						x, y,
						1, 1,
						0, 0, 
						1, 1,
						0,
						1,1,1,.5)
				end
			end
		end
	end

	-- show the brush
	do
		local mouse = gui.mouse
		gl.glBindTexture(gl.GL_TEXTURE_2D, 0)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_LINE)
		gl.glLineWidth(3)
		local cx = math.floor(self.viewBBox.min[1] + (self.viewBBox.max[1] - self.viewBBox.min[1]) * mouse.pos[1])
		local cy = math.floor(self.viewBBox.min[2] + (self.viewBBox.max[2] - self.viewBBox.min[2]) * mouse.pos[2])
		local brushWidth, brushHeight = 1, 1
		if self.editMode[0] == editModePaintTiles
		or self.editMode[0] == editModeFillTiles
		or self.editMode[0] == editModeSmoothTiles
		then	-- tiles
			if self.editMode[0] == editModePaintTiles
			or self.editMode[0] == editModeSmoothTiles
			then
				brushWidth = self.brushTileWidth[0]
				brushHeight = self.brushTileHeight[0]
			end
		elseif self.editMode[0] == editModeMove and self.moveBBox and self.moveToolStampPtr[0] then
			brushWidth = self.moveBBox.max[1] - self.moveBBox.min[1] + 1
			brushHeight = self.moveBBox.max[2] - self.moveBBox.min[2] + 1
		end
		local xmin = math.floor(cx - tonumber(brushWidth-1)/2)
		local ymin = math.floor(cy - tonumber(brushHeight-1)/2)
		local xmax = xmin + brushWidth-1
		local ymax = ymin + brushHeight-1
		if self.editMode[0] == editModeRooms then
			xmin, ymin = level:getMapTilePos(xmin, ymin)
			xmax, ymax = level:getMapTilePos(xmax, ymax)
			xmin = (xmin - 1) * level.mapTileSize[1] + 1
			ymin = (ymin - 1) * level.mapTileSize[2] + 1
			xmax = xmax * level.mapTileSize[1]
			ymax = ymax * level.mapTileSize[2]
		end
		R:quad(
			xmin + .1, ymin + .1,
			xmax - xmin + .8, ymax - ymin + .8,
			0, 0, 1, 1, 0,
			1, 1, 0, 1)	--color
		if self.editMode[0] == editModePaintTiles and self.smoothWhilePainting[0] then
			xmin = xmin - self.smoothBorder[0]
			ymin = ymin - self.smoothBorder[0]
			xmax = xmax + self.smoothBorder[0]
			ymax = ymax + self.smoothBorder[0]
			R:quad(
				xmin + .1, ymin + .1,
				xmax - xmin + .8, ymax - ymin + .8,
				0, 0, 1, 1, 0,
				0, 1, 0, 1)	--color	
		end
		gl.glLineWidth(1)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL)
		gl.glEnable(gl.GL_TEXTURE_2D)
	end

	-- show move rectangle
	if self.editMode[0] == editModeMove
	and self.moveBBox
	then
		gl.glBindTexture(gl.GL_TEXTURE_2D, 0)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_LINE)
		gl.glLineWidth(3)

		R:quad(
			self.moveBBox.min[1], self.moveBBox.min[2],
			self.moveBBox.max[1]-self.moveBBox.min[1]+1,
			self.moveBBox.max[2]-self.moveBBox.min[2]+1,
			0, 0, 1, 1, 0,
			1, 0, 0, 1)	--color	

		gl.glLineWidth(1)
		gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL)
		gl.glEnable(gl.GL_TEXTURE_2D)
	end
end

function Editor:saveMap()
	local level = game.level
	local dir = modio.search[1]..'/maps/'..modio.levelcfg.path
	
	-- save tile files
	for _,info in ipairs{
		{src=level.tileMapOriginal, dst='tile.png', size=level.size},
		{src=level.fgTileMapOriginal, dst='tile-fg.png', size=level.size},
		{src=level.bgTileMapOriginal, dst='tile-bg.png', size=level.size},
		{src=level.backgroundMapOriginal, dst='background.png', size=level.size},
		{src=level.roomMap, dst='room.png', size=level.sizeInMapTiles},
	} do
		local w, h = info.size:unpack()
		local image = Image(w, h, 3, 'unsigned char')
		for j=0,h-1 do
			for i=0,w-1 do
				local color = info.src[i+w*(h-j-1)]
				image.buffer[0+3*(i+w*j)] = bit.band(0xff, bit.rshift(color, 0))
				image.buffer[1+3*(i+w*j)] = bit.band(0xff, bit.rshift(color, 8))
				image.buffer[2+3*(i+w*j)] = bit.band(0xff, bit.rshift(color, 16))
			end
		end
		local dest = dir..'/' .. info.dst
		-- backup
		if io.fileexists(dest) then
			file[dir..'/~' .. info.dst] = file[dest]
		end
		image:save(dest)
	end

	-- save spawninfos
	file[modio.search[1]..'/maps/'..modio.levelcfg.path..'/spawn.lua'] = 
		'{\n'
		..level.spawnInfos:map(function(spawnInfo)
			local t = {}
			for k,v in pairs(spawnInfo) do t[k] = v end
			-- remove objects from serialization
			t.obj = nil
			return '\t'..tolua(t)..','
		end):concat('\n')
		..'\n}'
end

function Editor:saveBackgrounds()
	local dir = modio.search[1]..'/script/'
	local dest = dir..'backgrounds.lua'
	if io.fileexists(dest) then
		file[dir..'/~backgrounds.lua'] = file[dest]
	end
	file[dest] = 
		'{\n'
		..game.level.backgrounds:map(function(background)
			local t = {}
			for k,v in pairs(background) do t[k] = v end
			t.tex = nil
			return '\t'..tolua(t)..','
		end):concat('\n')
		..'\n}'
end

function Editor:saveTexpack()
	game.level.texpackImage:save(game.level.texpackFilename)
end

return Editor
