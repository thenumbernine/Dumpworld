local class = require 'ext.class'
local Tile = require 'base.script.tile.tile'

local ExclaimOutlineTile = class(Tile)
ExclaimOutlineTile.name = 'exclaimblock'
ExclaimOutlineTile.sprite = 'exclaimblock'
ExclaimOutlineTile.seq = 'stand'

return ExclaimOutlineTile
