local GLApp = require 'glapp'
local sdl = require 'ffi.sdl'

local NetCom = require 'netrefl.netcom'
require 'netrefl.netfield_list'

require 'base.script.util'	-- common things used by everyone

local AudioSource = require 'audio.source'
local AudioBuffer = require 'audio.buffer'


local audio = require 'base.script.singleton.audio'
local threads = require 'base.script.singleton.threads'
local game = require 'base.script.singleton.game'
local sounds = require 'base.script.singleton.sounds'
local animsys = require 'base.script.singleton.animsys'
local teamColors = require 'base.script.teamcolors'
local modio = require 'base.script.singleton.modio'
-- don't include these til after opengl init
local gui	-- ... don't include til after opengl init
local editor

local sysThisTime = 0
local sysLastTime = 0
local frameAccumTime = 0
local fixedDeltaTime = 1/50

local PlayerServerObject = class()

local PlayerClientObject = class()

function PlayerClientObject:init()
	self.effectAudioSource = AudioSource()
end

-- TODO hud here
function PlayerClientObject:drawScene(player, aspectRatio)
end

local netcom = NetCom()

netcom:addClientToServerCall{
	name='setPlayers',
	args = {
		createNetFieldList(netFieldString),
	},
	returnArgs = {
		createNetFieldList(netFieldNumber),
	},
	func = function(serverConn, playerNames)
		serverConn.server.playerServerObjs = table()
		local playerIndexes = table()
		for i=1,#playerNames do
			local playerName = playerNames[i]
			
			local playerServerObj = PlayerServerObject()
			playerServerObj.name = playerName
			playerServerObj.startIndex = playerIndex
			playerServerObj.serverConn = serverConn
			
			-- this will be the index of the playerServerObj in the server's list
			local playerIndex = #serverConn.server.playerServerObjs+1
			playerIndexes[i] = playerIndex
			
			serverConn.server.playerServerObjs:insert(playerServerObj)
		end
		serverConn.playerIndexes = playerIndexes
		return playerIndexes
	end,
	postFunc = function(clientConn, playerNames, playerIndexes)
		clientConn.playerIndexes = playerIndexes
	end,
}

local remoteGame = false
-- for remote games remoteClientConn is defined
-- for local games server is defined
-- for both game.clientConn is defined
local server, remoteClientConn


local joysticks = {}

local numPlayers = 1

local timescale = 1
local fpsTime = 0
local fpsFrames = 0



local R
local GLApp = class(GLApp) 
local ImGuiApp
	-- closest resolution:
GLApp.width = 1024
GLApp.height = 768
GLApp.title = 'Dump World'
GLApp.sdlInitFlags = bit.bor(sdl.SDL_INIT_VIDEO, sdl.SDL_INIT_JOYSTICK)

function GLApp:initGL(gl, glname)
	local Renderer = modio:require 'script.singleton.class.renderer'
	local rendererClass = Renderer.requireClasses[glname]
	if not rendererClass then error("don't have support for "..tostring(glname)) end
	R = rendererClass(gl)
	R:report('init begin')
	
	sdl.SDL_ShowCursor(sdl.SDL_DISABLE)

	for i=0,sdl.SDL_NumJoysticks()-1 do
		print('Joystick '..i..': '..ffi.string(sdl.SDL_JoystickName(i)))
		joysticks[i] = sdl.SDL_JoystickOpen(i)
	end

	--[[
	it would be great to implicitly detect sprite sequences
	as directories (containing any pngs) in the /sprites/ folder
	from there, anything in scripts/sprites.lua would be appended
	-- but the only info needed would be the sequence data
	( and - soon - any spritesheet chopping regions for frames)
	--]]
	for _,mod in ipairs(modio.search) do
		local dirobj = file[mod..'/sprites']
		if dirobj then
			for sprite in dirobj() do
				animsys:load{name=sprite, dir=sprite}
			end
		end
	end

	for _,mod in ipairs(modio.search) do
		if io.fileexists(mod..'/script/sprites.lua') then
			local spriteTable = require(mod..'.script.sprites')
			for _,sprite in ipairs(spriteTable) do
				animsys:load(sprite)
			end
		end
	end
	
	for _,mod in ipairs(modio.search) do
		if io.fileexists(mod..'/script/sounds.lua') then
			local soundTable = require(mod..'.script.sounds')
			for _,sound in ipairs(soundTable) do
				sounds:load(sound)
			end
		end
	end
	
	local clientConn, server, remoteClientConn = netcom:start{
		port=12345,
		onConnect = function(clientConn)
			local playerNames = table()
			for i=1,numPlayers do
				playerNames:insert('Player '..i)
			end
			clientConn:netcall{'setPlayers', playerNames}
		end,
		threads = threads,
	}
	game.clientConn = clientConn
	if server then
		game.server = server
	end				

	
	-- needs tob e done outside game atm because it modifies levelcfg ...
	-- ... which is passed to game
	local savefile = 'zeta/save/save.txt'
	local arrayRef = class()
	function arrayRef:init(args)
		self.index = assert(args.index)
		self.src = assert(args.src)
	end
	local save
	if io.fileexists(savefile) then
		local code = [[
local arrayRef = ...
return ]]..file[savefile]
		save = assert(load(code))(arrayRef)

		game:setSavePoint(save)
	end



	-- set load level info
		-- first get it from the modio
	local levelcfg = 
		(save and save.levelcfg)
		or modio.levelcfg
		or (io.fileexists'levelcfg.lua' and assert(load('return '..file['levelcfg.lua']))())
	assert(levelcfg, "failed to find levelcfg info in save file, modio, or levelcfg.lua file")
	
	local tileTypes = table()
	local spawnTypes = table()
	local serializeTypes = table()
	for i=#modio.search,1,-1 do	-- start with lowest (base) first, for sequence sake
		local mod = modio.search[i]
		if io.fileexists(mod..'/script/tiletypes.lua') then
			tileTypes:append(require(mod..'.script.tiletypes'))
		end
		if io.fileexists(mod..'/script/spawntypes.lua') then
			local modSpawnTypes = require(mod..'.script.spawntypes')
			spawnTypes:append(modSpawnTypes.spawn)
			serializeTypes:append(modSpawnTypes.spawn)
			serializeTypes:append(modSpawnTypes.serialize)
		end
	end
	-- now normalize all planes
	-- either here or in Game:setLevel()
	-- notice this currently modifies the original tileType objects ...
	for _,tileType in ipairs(tileTypes) do
		local p = tileType.plane
		if p then
			local len = math.sqrt(p[1]*p[1] + p[2]*p[2] + p[3]*p[3])
			p[1] = p[1] / len
			p[2] = p[2] / len
			p[3] = p[3] / len
		end
	end
	levelcfg.tileTypes = tileTypes
	levelcfg.spawnTypes = spawnTypes
	levelcfg.serializeTypes = serializeTypes

	game:setLevel(levelcfg)
	
	game:glInit(R)
	
	game.playerClientObjs = table()
	game.onReset = function()
		if server then
			for _,playerServerObj in ipairs(server.playerServerObjs) do
				local playerClass = game:getPlayerClass()
				local player = playerClass{
					name = playerName,
					pos = game:getStartPos(),
					color = teamColors[#game.players % #teamColors + 1],
				}
				game.players:insert(player)
				playerServerObj.player = player
				player.playerServerObj = playerServerObj
			end
		end
		
		-- TODO send client a command to do this			
		game.clientConn.players = table()
		for i=1,#game.clientConn.playerIndexes do
			local playerIndex = game.clientConn.playerIndexes[i]
			local player = game.players[playerIndex]
			game.playerClientObjs[i] = PlayerClientObject()
			game.playerClientObjs[i].player = player
			game.clientConn.players:insert(player)	-- TODO should be playerClientObjs[i] ... or just don't use clientConn.players
		end
	end


	game:reset()


	netcom:addObject{name='game', object=game}
	
	-- don't include this til after opengl is initialized
	gui = require 'base.script.singleton.gui'
	editor = require 'base.script.singleton.editor'()
	if editor then editor:setTileKeys(tilekeys) end

	if levelcfg.music then
		local bgMusicFileName = modio:find(levelcfg.music)
		if bgMusicFileName then
			local bgMusic = AudioBuffer(bgMusicFileName)	-- TODO specify by mod init or something
			local bgAudioSource = AudioSource()
			bgAudioSource:setBuffer(bgMusic)
			bgAudioSource:setLooping(true)
			bgAudioSource:setGain(.5)
			bgAudioSource:play()
		end
	end

	if editor then
		ImGuiApp = require 'imguiapp'
		ImGuiApp.initGL(self, gl, glname)
	end
	
	R:report('init end')
end
	
function GLApp:event(event, ...)
	if editor then
		if editor.active then
			ImGuiApp.event(self, event, ...)
		end
		if editor:event(event) then return end
	end

	if editor and editor.active and editor.isHandlingKeyboard then return end

	if #game.clientConn.players >= 2 then
		local player = game.clientConn.players[2]

		if event.type == sdl.SDL_JOYHATMOTION then
			player.inputUpDown = 0
			player.inputLeftRight = 0
			
			if bit.band(event.jhat.value, 1) ~= 0 then player.inputUpDown = player.inputUpDown + 1 end
			if bit.band(event.jhat.value, 4) ~= 0 then player.inputUpDown = player.inputUpDown - 1 end
			if bit.band(event.jhat.value, 2) ~= 0 then player.inputLeftRight = player.inputLeftRight + 1 end
			if bit.band(event.jhat.value, 8) ~= 0 then player.inputLeftRight = player.inputLeftRight - 1 end
		
		elseif event.type == sdl.SDL_JOYAXISMOTION then
			if event.jaxis.axis == 0 then
				if event.jaxis.value < -10000 then
					player.inputLeftRight = -1
				elseif event.jaxis.value > 10000 then
					player.inputLeftRight = 1
				else
					player.inputLeftRight = 0
				end
			elseif event.jaxis.axis == 1 then
				-- my 'y' is negative typical screenspace 'y'	
				-- instead it matches GL / graph space 'y'
				if event.jaxis.value < -10000 then
					player.inputUpDown = 1
				elseif event.jaxis.value > 10000 then
					player.inputUpDown = -1
				else
					player.inputUpDown = 0
				end
			end
			
		elseif event.type == sdl.SDL_JOYBUTTONDOWN or event.type == sdl.SDL_JOYBUTTONUP then
			local press = event.jbutton.state == 1
			if event.jbutton.button == 0 then player.inputShoot = press end
			if event.jbutton.button == 1 then player.inputJump = press end
			if event.jbutton.button == 2 then player.inputJumpAux = press end
			if event.jbutton.button == 3 then player.inputShootAux = press end
			if event.jbutton.button == 6 then timescale = 1 - 4/5 * event.jbutton.state end
		end
	end
	
	if #game.clientConn.players >= 1 then
		local player = game.clientConn.players[1]
		
		if event.type == sdl.SDL_KEYDOWN or event.type == sdl.SDL_KEYUP then
			local press = event.type == sdl.SDL_KEYDOWN
			if event.key.keysym.sym == sdl.SDLK_UP or event.key.keysym.sym == sdl.SDLK_DOWN then
				if event.key.keysym.sym == sdl.SDLK_UP then
					player.inputUp = press
				elseif event.key.keysym.sym == sdl.SDLK_DOWN then
					player.inputDown = press
				end
				player.inputUpDown = 0
				if player.inputUp then player.inputUpDown = player.inputUpDown + 1 end
				if player.inputDown then player.inputUpDown = player.inputUpDown - 1 end
			elseif event.key.keysym.sym == sdl.SDLK_LEFT or event.key.keysym.sym == sdl.SDLK_RIGHT then
				if event.key.keysym.sym == sdl.SDLK_LEFT then
					player.inputLeft = press
				elseif event.key.keysym.sym == sdl.SDLK_RIGHT then
					player.inputRight = press
				end
				player.inputLeftRight = 0
				if player.inputRight then player.inputLeftRight = player.inputLeftRight + 1 end
				if player.inputLeft then player.inputLeftRight = player.inputLeftRight - 1 end
			elseif event.key.keysym.sym == sdl.SDLK_s then	-- run2
				player.inputShootAux = press
			elseif event.key.keysym.sym == sdl.SDLK_x then	-- run1
				player.inputShoot = press
			elseif event.key.keysym.sym == sdl.SDLK_c then	-- jump
				player.inputJump = press
			elseif event.key.keysym.sym == sdl.SDLK_d then	-- spinjump
				player.inputJumpAux = press
			elseif event.key.keysym.sym == sdl.SDLK_a then	-- inventory up
				player.inputPageUp = press
			elseif event.key.keysym.sym == sdl.SDLK_z then	-- inventory down
				player.inputPageDown = press
			elseif event.key.keysym.sym == sdl.SDLK_RETURN then
				player.inputPause = press
		
				-- has to be done here, because game.pause keeps the player loop from updating
				if player.inputPause and not player.inputPauseLast then
					game.paused = not game.paused
				end
				player.inputPauseLast = player.inputPause
			end
		elseif event.type == sdl.SDL_MOUSEMOTION then
			local wx, wy = self:size()
			player.mouseScreenPos[1] = event.button.x / wx
			player.mouseScreenPos[2] = 1 - event.button.y / wy
		end
	end

	--[[ slowdown effect
	if event.key.keysym.sym == sdl.SDLK_BACKQUOTE then	
		timescale = 1 - 4/5 * (press and 1 or 0)
	end
	--]]
end
	
function GLApp:updateGUI(...)
	return editor:updateGUI(...)
end

local frames = 0
local lastTime = os.time()
function GLApp:update(...)
	R:report('update begin')

	-- [[ show fps
	do
		frames = frames + 1
		local thisTime = os.time() 
		if thisTime ~= lastTime then
			print('fps: '..frames/(thisTime-lastTime))
			frames = 0
			lastTime = thisTime
		end
	end
	--]]

	-- don't use these.  they're based on the sdl time.
	sysLastTime = sysThisTime
	sysThisTime = sdl.SDL_GetTicks() / 1000
	local sysDeltaTime = sysThisTime - sysLastTime

	-- use these. they're based on the game time, updated at the sdl clock rate.
	game.sysDeltaTime = sysDeltaTime
	game.sysLastTime = game.sysTime 
	game.sysTime = game.sysTime + sysDeltaTime 

	if not game.paused then
	--if sysThisTime > 5 then
	
		frameAccumTime = frameAccumTime + sysDeltaTime
		if frameAccumTime >= fixedDeltaTime then
	
			-- TODO gather input here ... or in event()
			
			-- update
			local skips = -1
			while frameAccumTime >= fixedDeltaTime do
				skips = skips + 1
				frameAccumTime = frameAccumTime - fixedDeltaTime
				
				-- and update the game!
				game:update(fixedDeltaTime * timescale)

				R:report('game:update')
			end
			--if skips > 0 then print(skips,'skips') end			
		end
	end

	--[[
	fpsFrames = fpsFrames + 1
	if sysThisTime - fpsTime > 1 then
		print(fpsFrames / (sysThisTime - fpsTime))
		fpsTime = sysThisTime
		fpsFrames = 0
	end
	--]]
	game:render()
	R:report('game:render')
	
	if editor then editor:update() end
	gui:update()
	threads:update()
	
	R:report('update end')

	if editor and editor.active then
		ImGuiApp.update(self, ...)
	end
end

function GLApp:exit()
	audio:shutdown()
	if editor then
		ImGuiApp.exit(self)
	end
end

return GLApp
