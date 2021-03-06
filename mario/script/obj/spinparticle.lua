local class = require 'ext.class'
local GameObject = require 'base.script.obj.object'
local game = require 'base.script.singleton.game'


local SpinParticle = class(GameObject)
SpinParticle.sprite = 'spinblock'
SpinParticle.seq = 'particle'

function SpinParticle:init(args)
	SpinParticle.super.init(self, args)
	self.removeTime = game.time + 2
end

SpinParticle.solidFlags = 0
SpinParticle.touchFlags = 0
SpinParticle.blockFlags = 0

-- static function
function SpinParticle.breakAt(i,j)
	SpinParticle{pos={i,j}, vel={-10 + (math.random() * 10 - 5), (math.random() * 10 - 5)}}
	SpinParticle{pos={i,j}, vel={10 + (math.random() * 10 - 5), (math.random() * 10 - 5)}}
	SpinParticle{pos={i,j}, vel={-10 + (math.random() * 10 - 5), 30 + (math.random() * 10 - 5)}}
	SpinParticle{pos={i,j}, vel={10 + (math.random() * 10 - 5), 30 + (math.random() * 10 - 5)}}
end

return SpinParticle
