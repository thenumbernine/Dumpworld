{
	{pos={113.5,236},spawn="zeta.script.obj.terminal",text="evacuation orders given!\nplease proceed to launchpad 1 for immediate departure"},
	{pos={141.5,221},spawn="zeta.script.obj.terminal",text="team 1 left without us.\nteam 2's rocket won't start.\nI think I'm going to go activate the defense robot to help us fight these creatures off...",use="if self.hasGiven then return end\nself.hasGiven = true\ncreate\n 'zeta.script.obj.item'\n {pos = self.pos + {-1,1},\n  sprite = 'keycard'}"},
	{pos={116.5,236},spawn="zeta.script.obj.terminal",text="defense protocols initiated\nweapons storage unlocked",use="if self.hasGiven then\n\9return\nend\nself.hasGiven = true\ncreate\n 'zeta.script.obj.blaster'\n {pos=self.pos+{1,3}}\nfor i=1,5 do\n create\n  'zeta.script.obj.grenadeitem'\n  {pos=self.pos+{2,3}}\nend"},
	{pos={10.5,206},spawn="zeta.script.obj.turret"},
	{pos={23.5,206},spawn="zeta.script.obj.turret"},
	{pos={6.5,199},spawn="zeta.script.obj.turret"},
	{pos={23.5,199},spawn="zeta.script.obj.turret"},
	{pos={27.5,199},spawn="zeta.script.obj.turret"},
	{pos={41.5,199},spawn="zeta.script.obj.turret"},
	{pos={22.5,161},spawn="zeta.script.obj.turret"},
	{pos={28.5,161},spawn="zeta.script.obj.turret"},
	{pos={28.5,159},spawn="zeta.script.obj.turret"},
	{pos={22.5,159},spawn="zeta.script.obj.turret"},
	{pos={11.5,159},spawn="zeta.script.obj.terminal",text="Emergency alarm deactivated\nDefense systems disabled",use="require'zeta.script.obj.turret'.deactivated = true"},
	{pos={28.5,129},spawn="zeta.script.obj.terminal",text="Journal Entry:\nWhen mining in the crust of this planet we stumbled across a unique cave system.\nNot sure how they were formed.\nThe minerals seem to proceed through the caves.\nThe prospecting company is eager for us to follow."},
	{pos={122.5,237},spawn="zeta.script.obj.heart"},
	{pos={100.5,236},spawn="zeta.script.obj.terminal",text="proceed west to find the entrance to the mining operation."},
	{pos={123.5,237},spawn="zeta.script.obj.heart"},
	{pos={53.5,130},spawn="zeta.script.obj.geemer"},
	{pos={62.5,130},spawn="zeta.script.obj.geemer"},
	{pos={68.5,130},spawn="zeta.script.obj.geemer"},
	{pos={70.5,132},spawn="zeta.script.obj.geemer"},
	{pos={71.5,132},spawn="zeta.script.obj.geemer"},
	{pos={73.5,130},spawn="zeta.script.obj.geemer"},
	{pos={75.5,130},spawn="zeta.script.obj.geemer"},
	{pos={74.5,130},spawn="zeta.script.obj.geemer"},
	{pos={77.5,130},spawn="zeta.script.obj.geemer"},
	{pos={76.5,130},spawn="zeta.script.obj.geemer"},
	{pos={80.5,132},spawn="zeta.script.obj.geemer"},
	{pos={81.5,132},spawn="zeta.script.obj.geemer"},
	{pos={82.5,132},spawn="zeta.script.obj.geemer"},
	{pos={84.5,132},spawn="zeta.script.obj.geemer"},
	{pos={83.5,132},spawn="zeta.script.obj.geemer"},
	{pos={86.5,132},spawn="zeta.script.obj.geemer"},
	{pos={85.5,132},spawn="zeta.script.obj.geemer"},
	{pos={88.5,132},spawn="zeta.script.obj.geemer"},
	{pos={87.5,132},spawn="zeta.script.obj.geemer"},
	{pos={88.5,130},spawn="zeta.script.obj.geemer"},
	{pos={89.5,130},spawn="zeta.script.obj.geemer"},
	{pos={87.5,130},spawn="zeta.script.obj.geemer"},
	{pos={86.5,130},spawn="zeta.script.obj.geemer"},
	{pos={85.5,130},spawn="zeta.script.obj.geemer"},
	{pos={84.5,130},spawn="zeta.script.obj.geemer"},
	{pos={83.5,130},spawn="zeta.script.obj.geemer"},
	{pos={82.5,130},spawn="zeta.script.obj.geemer"},
	{pos={81.5,130},spawn="zeta.script.obj.geemer"},
	{pos={80.5,130},spawn="zeta.script.obj.geemer"},
	{pos={64.5,132},spawn="zeta.script.obj.geemer"},
	{pos={77.5,139},spawn="zeta.script.obj.geemer"},
	{pos={78.5,143},spawn="zeta.script.obj.geemer"},
	{pos={79.5,141},spawn="zeta.script.obj.geemer"},
	{pos={79.5,135},spawn="zeta.script.obj.geemer"},
	{pos={89.5,133},spawn="zeta.script.obj.geemer"},
	{pos={89.5,134},spawn="zeta.script.obj.geemer"},
	{pos={89.5,135},spawn="zeta.script.obj.geemer"},
	{pos={89.5,136},spawn="zeta.script.obj.geemer"},
	{pos={89.5,137},spawn="zeta.script.obj.geemer"},
	{pos={89.5,138},spawn="zeta.script.obj.geemer"},
	{pos={89.5,139},spawn="zeta.script.obj.geemer"},
	{pos={89.5,140},spawn="zeta.script.obj.geemer"},
	{pos={89.5,141},spawn="zeta.script.obj.geemer"},
	{pos={89.5,142},spawn="zeta.script.obj.geemer"},
	{pos={89.5,143},spawn="zeta.script.obj.geemer"},
	{pos={90.5,143},spawn="zeta.script.obj.geemer"},
	{pos={91.5,143},spawn="zeta.script.obj.geemer"},
	{pos={91.5,142},spawn="zeta.script.obj.geemer"},
	{pos={91.5,141},spawn="zeta.script.obj.geemer"},
	{pos={91.5,140},spawn="zeta.script.obj.geemer"},
	{pos={91.5,138},spawn="zeta.script.obj.geemer"},
	{pos={91.5,139},spawn="zeta.script.obj.geemer"},
	{pos={91.5,137},spawn="zeta.script.obj.geemer"},
	{pos={91.5,136},spawn="zeta.script.obj.geemer"},
	{pos={91.5,135},spawn="zeta.script.obj.geemer"},
	{pos={91.5,133},spawn="zeta.script.obj.geemer"},
	{pos={91.5,134},spawn="zeta.script.obj.geemer"},
	{pos={90.5,130},spawn="zeta.script.obj.geemer"},
	{pos={91.5,130},spawn="zeta.script.obj.geemer"},
	{pos={66.5,143},spawn="zeta.script.obj.geemer"},
	{pos={67.5,141},spawn="zeta.script.obj.geemer"},
	{pos={79.5,136},spawn="zeta.script.obj.geemer"},
	{pos={77.5,138},spawn="zeta.script.obj.geemer"},
	{pos={79.5,140},spawn="zeta.script.obj.geemer"},
	{pos={77.5,140},spawn="zeta.script.obj.geemer"},
	{pos={45.5,206},spawn="zeta.script.obj.turret"},
	{pos={39.5,181},spawn="zeta.script.obj.turret"},
	{pos={23.5,167},spawn="zeta.script.obj.turret"},
	{pos={27.5,167},spawn="zeta.script.obj.turret"},
	{pos={65.5,141},spawn="zeta.script.obj.geemer"},
	{pos={29.5,153},spawn="zeta.script.obj.turret"},
	{pos={30.5,151},spawn="zeta.script.obj.turret"},
	{pos={32.5,151},spawn="zeta.script.obj.turret"},
	{pos={28.5,135},spawn="zeta.script.obj.turret"},
	{pos={35.5,135},spawn="zeta.script.obj.turret"},
	{pos={37.5,130},spawn="zeta.script.obj.turret"},
	{pos={37.5,132},spawn="zeta.script.obj.turret"},
	{pos={11.5,187},spawn="zeta.script.obj.turret"},
	{pos={23.5,183},spawn="zeta.script.obj.turret"},
	{pos={26.5,180},spawn="zeta.script.obj.turret"},
	{pos={19.5,195},spawn="zeta.script.obj.turret"},
	{pos={28.5,194},spawn="zeta.script.obj.turret"},
	{pos={27.5,186},spawn="zeta.script.obj.turret"},
	{pos={65.5,193},spawn="zeta.script.obj.grenadeitem"},
	{pos={65.5,194},spawn="zeta.script.obj.grenadeitem"},
	{pos={65.5,192},spawn="zeta.script.obj.grenadeitem"},
	{pos={65.5,191},spawn="zeta.script.obj.grenadeitem"},
	{pos={65.5,190},spawn="zeta.script.obj.grenadeitem"},
	{pos={64.5,190},spawn="zeta.script.obj.defensebonus"},
	{pos={64.5,191},spawn="zeta.script.obj.defensebonus"},
	{pos={64.5,192},spawn="zeta.script.obj.defensebonus"},
	{pos={64.5,193},spawn="zeta.script.obj.defensebonus"},
	{pos={64.5,194},spawn="zeta.script.obj.defensebonus"},
	{pos={63.5,194},spawn="zeta.script.obj.attackbonus"},
	{pos={63.5,193},spawn="zeta.script.obj.attackbonus"},
	{pos={63.5,192},spawn="zeta.script.obj.attackbonus"},
	{pos={63.5,191},spawn="zeta.script.obj.attackbonus"},
	{pos={63.5,190},spawn="zeta.script.obj.attackbonus"},
	{pos={62.5,190},spawn="zeta.script.obj.heart"},
	{pos={62.5,191},spawn="zeta.script.obj.heart"},
	{pos={62.5,192},spawn="zeta.script.obj.heart"},
	{pos={62.5,193},spawn="zeta.script.obj.heart"},
	{pos={62.5,194},spawn="zeta.script.obj.heart"},
	{pos={107.5,133},spawn="zeta.script.obj.trigger",trigger="-- push into the room\nplayer.pos=self.pos+{2,0}\n-- make ourselves solid and blocking\nself.solid = true\nbox2 = require 'vec.box2'\nself.bbox = box2(-.5, 0, .5, 3)\n-- center view in room\ncenter={120.5, 137}\ncenterView(center)\n-- create boss\ncreate'zeta.script.obj.boss-geemer'\n{\n\9pos=center,\n\9-- upon boss death...\n\9onDie=function()\n\9\9popup('defeated boss geemer!')\n\9\9-- and maybe drop the next story item...\n\9\9stopCenterView()\n\9\9-- stop blocking the exit\n\9\9self.remove = true\n\9end,\n}"},
	{pos={120.5,238},spawn="base.script.obj.start"},
}
