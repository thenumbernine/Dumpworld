local class = require 'ext.class'
local AmmoTank = require 'zeta.script.obj.ammotank'

local GrenadeItem = class(AmmoTank)
GrenadeItem.sprite = 'grenade'
GrenadeItem.ammo = 'Grenades'

--[[ for the old, shootable version:
GrenadeItem.shotSpeed = 11
GrenadeItem.shotUpSpeed = 8
GrenadeItem.shotSound = nil
GrenadeItem.drawOffsetStanding = {.625, .5}
GrenadeItem.drawOffsetDucking = {.625, .25}
--]]

return GrenadeItem
