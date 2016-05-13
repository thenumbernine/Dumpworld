{
	{pos={163.5,236},spawn="zeta.script.obj.terminal",text="evacuation orders given!\nplease proceed to launchpad 1 for immediate departure"},
	{pos={191.5,221},spawn="zeta.script.obj.terminal",text="team 1 left without us.\nteam 2's rocket won't start.\nI think I'm going to go activate the defense robot to help us fight these creatures off...",use="if self.hasGiven then return end\nself.hasGiven = true\ncreate\n 'zeta.script.obj.keycard'\n {pos = self.pos + {-1,0},\n  color = {0,1,1,1}}"},
	{pos={166.5,236},spawn="zeta.script.obj.terminal",text="defense protocols initiated\nweapons storage unlocked",use="if self.hasGiven then\n return\nend\nself.hasGiven = true\ncreate\n 'zeta.script.obj.blaster'\n {pos=self.pos+{1,0}}\nfor i=1,5 do\n create\n  'zeta.script.obj.grenadeitem'\n  {pos=self.pos+{2,0}}\nend"},
	{pos={60.5,206},spawn="zeta.script.obj.turret"},
	{pos={73.5,206},spawn="zeta.script.obj.turret"},
	{pos={56.5,199},spawn="zeta.script.obj.turret"},
	{pos={73.5,199},spawn="zeta.script.obj.turret"},
	{pos={77.5,199},spawn="zeta.script.obj.turret"},
	{pos={91.5,199},spawn="zeta.script.obj.turret"},
	{pos={72.5,161},spawn="zeta.script.obj.turret"},
	{pos={78.5,161},spawn="zeta.script.obj.turret"},
	{pos={78.5,159},spawn="zeta.script.obj.turret"},
	{pos={72.5,159},spawn="zeta.script.obj.turret"},
	{pos={61.5,159},spawn="zeta.script.obj.terminal",use="local Turret = require 'zeta.script.obj.turret'\nTurret.deactivated = not Turret.deactivated\nif not Turret.deactivated then\npopup(Turret.deactivated\nand [[\nEmergency alarm activated.\nDefense systems enabled.]]\nor [[\nEmergency alarm deactivated.\nDefense systems disabled.]])"},
	{pos={78.5,129},spawn="zeta.script.obj.terminal",text="Journal Entry:\nWhen mining in the crust of this planet we stumbled across a unique cave system.\nNot sure how they were formed.\nThe minerals seem to proceed through the caves.\nThe prospecting company is eager for us to follow."},
	{pos={172.5,237},spawn="zeta.script.obj.heart"},
	{pos={150.5,236},spawn="zeta.script.obj.terminal",text="proceed west to find the entrance to the mining operation."},
	{pos={173.5,237},spawn="zeta.script.obj.heart"},
	{pos={103.5,130},spawn="zeta.script.obj.geemer"},
	{pos={112.5,130},spawn="zeta.script.obj.geemer"},
	{pos={118.5,130},spawn="zeta.script.obj.geemer"},
	{pos={120.5,132},spawn="zeta.script.obj.geemer"},
	{pos={121.5,132},spawn="zeta.script.obj.geemer"},
	{pos={123.5,130},spawn="zeta.script.obj.geemer"},
	{pos={125.5,130},spawn="zeta.script.obj.geemer"},
	{pos={124.5,130},spawn="zeta.script.obj.geemer"},
	{pos={127.5,130},spawn="zeta.script.obj.geemer"},
	{pos={126.5,130},spawn="zeta.script.obj.geemer"},
	{pos={130.5,132},spawn="zeta.script.obj.geemer"},
	{pos={131.5,132},spawn="zeta.script.obj.geemer"},
	{pos={132.5,132},spawn="zeta.script.obj.geemer"},
	{pos={134.5,132},spawn="zeta.script.obj.geemer"},
	{pos={133.5,132},spawn="zeta.script.obj.geemer"},
	{pos={136.5,132},spawn="zeta.script.obj.geemer"},
	{pos={135.5,132},spawn="zeta.script.obj.geemer"},
	{pos={138.5,132},spawn="zeta.script.obj.geemer"},
	{pos={137.5,132},spawn="zeta.script.obj.geemer"},
	{pos={138.5,130},spawn="zeta.script.obj.geemer"},
	{pos={139.5,130},spawn="zeta.script.obj.geemer"},
	{pos={137.5,130},spawn="zeta.script.obj.geemer"},
	{pos={136.5,130},spawn="zeta.script.obj.geemer"},
	{pos={135.5,130},spawn="zeta.script.obj.geemer"},
	{pos={134.5,130},spawn="zeta.script.obj.geemer"},
	{pos={133.5,130},spawn="zeta.script.obj.geemer"},
	{pos={132.5,130},spawn="zeta.script.obj.geemer"},
	{pos={131.5,130},spawn="zeta.script.obj.geemer"},
	{pos={130.5,130},spawn="zeta.script.obj.geemer"},
	{pos={114.5,132},spawn="zeta.script.obj.geemer"},
	{pos={127.5,139},spawn="zeta.script.obj.geemer"},
	{pos={128.5,143},spawn="zeta.script.obj.geemer"},
	{pos={129.5,141},spawn="zeta.script.obj.geemer"},
	{pos={129.5,135},spawn="zeta.script.obj.geemer"},
	{pos={139.5,133},spawn="zeta.script.obj.geemer"},
	{pos={139.5,134},spawn="zeta.script.obj.geemer"},
	{pos={139.5,135},spawn="zeta.script.obj.geemer"},
	{pos={139.5,136},spawn="zeta.script.obj.geemer"},
	{pos={139.5,137},spawn="zeta.script.obj.geemer"},
	{pos={139.5,138},spawn="zeta.script.obj.geemer"},
	{pos={139.5,139},spawn="zeta.script.obj.geemer"},
	{pos={139.5,140},spawn="zeta.script.obj.geemer"},
	{pos={139.5,141},spawn="zeta.script.obj.geemer"},
	{pos={139.5,142},spawn="zeta.script.obj.geemer"},
	{pos={139.5,143},spawn="zeta.script.obj.geemer"},
	{pos={140.5,143},spawn="zeta.script.obj.geemer"},
	{pos={141.5,143},spawn="zeta.script.obj.geemer"},
	{pos={141.5,142},spawn="zeta.script.obj.geemer"},
	{pos={141.5,141},spawn="zeta.script.obj.geemer"},
	{pos={141.5,140},spawn="zeta.script.obj.geemer"},
	{pos={141.5,138},spawn="zeta.script.obj.geemer"},
	{pos={141.5,139},spawn="zeta.script.obj.geemer"},
	{pos={141.5,137},spawn="zeta.script.obj.geemer"},
	{pos={141.5,136},spawn="zeta.script.obj.geemer"},
	{pos={141.5,135},spawn="zeta.script.obj.geemer"},
	{pos={141.5,133},spawn="zeta.script.obj.geemer"},
	{pos={141.5,134},spawn="zeta.script.obj.geemer"},
	{pos={140.5,130},spawn="zeta.script.obj.geemer"},
	{pos={141.5,130},spawn="zeta.script.obj.geemer"},
	{pos={116.5,143},spawn="zeta.script.obj.geemer"},
	{pos={117.5,141},spawn="zeta.script.obj.geemer"},
	{pos={129.5,136},spawn="zeta.script.obj.geemer"},
	{pos={127.5,138},spawn="zeta.script.obj.geemer"},
	{pos={129.5,140},spawn="zeta.script.obj.geemer"},
	{pos={127.5,140},spawn="zeta.script.obj.geemer"},
	{pos={95.5,206},spawn="zeta.script.obj.turret"},
	{pos={89.5,181},spawn="zeta.script.obj.turret"},
	{pos={73.5,167},spawn="zeta.script.obj.turret"},
	{pos={77.5,167},spawn="zeta.script.obj.turret"},
	{pos={115.5,141},spawn="zeta.script.obj.geemer"},
	{pos={79.5,153},spawn="zeta.script.obj.turret"},
	{pos={80.5,151},spawn="zeta.script.obj.turret"},
	{pos={82.5,151},spawn="zeta.script.obj.turret"},
	{pos={78.5,135},spawn="zeta.script.obj.turret"},
	{pos={85.5,135},spawn="zeta.script.obj.turret"},
	{pos={87.5,130},spawn="zeta.script.obj.turret"},
	{pos={87.5,132},spawn="zeta.script.obj.turret"},
	{pos={61.5,187},spawn="zeta.script.obj.turret"},
	{pos={73.5,183},spawn="zeta.script.obj.turret"},
	{pos={76.5,180},spawn="zeta.script.obj.turret"},
	{pos={69.5,195},spawn="zeta.script.obj.turret"},
	{pos={78.5,194},spawn="zeta.script.obj.turret"},
	{pos={77.5,186},spawn="zeta.script.obj.turret"},
	{pos={157.5,133},spawn="zeta.script.obj.trigger",trigger="-- push into the room\nplayer.pos=self.pos+{2,0}\n-- find the right wall\nrightWall = findName 'geemer-right-wall'\n-- TODO 'base.script.obj.solid'\nrightWall.bbox = box2(-.5, 0, .5, 3)\nrightWall.solid = true\nrightWall.pushPriority = math.huge\n-- make ourselves solid and blocking\nself.solid = true\nself.bbox = box2(-.5, 0, .5, 3)\n-- center view in room\ncenter=self.pos+{13,4}\ncenterView(center)\n-- create boss\ncreate'zeta.script.obj.boss-geemer'\n{\n\9pos=center,\n\9-- upon boss death...\n\9onDie=function(geemer)\n\9\9popup('defeated boss geemer!')\n\9\9-- drop a keycard\n\9\9create 'zeta.script.obj.keycard'{pos=geemer.pos, color={0,1,0,1}}\n\9\9-- center the view on the player\n\9\9stopCenterView()\n\9\9-- stop blocking the exit\n\9\9self.remove = true\n\9\9rightWall.remove = true\n\9end,\n}"},
	{name="geemer-right-wall",pos={183.5,136},spawn="base.script.obj.object"},
	{pos={113.5,192},spawn="zeta.script.obj.energytank"},
	{pos={37.5,243},spawn="zeta.script.obj.energytank"},
	{color={0,1,0,1},pos={50.5,211},spawn="zeta.script.obj.door"},
	{pos={170.5,236},spawn="base.script.obj.start"},
	{pos={38.5,230},spawn="zeta.script.obj.geemer"},
	{pos={40.5,232},spawn="zeta.script.obj.geemer"},
	{pos={41.5,231},spawn="zeta.script.obj.geemer"},
	{pos={43.5,236},spawn="zeta.script.obj.geemer"},
	{pos={43.5,237},spawn="zeta.script.obj.geemer"},
	{pos={36.5,231},spawn="zeta.script.obj.geemer"},
	{pos={34.5,232},spawn="zeta.script.obj.geemer"},
	{pos={33.5,233},spawn="zeta.script.obj.geemer"},
	{pos={31.5,236},spawn="zeta.script.obj.geemer"},
	{pos={31.5,237},spawn="zeta.script.obj.geemer"},
	{pos={31.5,238},spawn="zeta.script.obj.geemer"},
	{pos={26.5,216},spawn="zeta.script.obj.geemer"},
	{pos={28.5,220},spawn="zeta.script.obj.geemer"},
	{pos={31.5,222},spawn="zeta.script.obj.geemer"},
	{pos={34.5,218},spawn="zeta.script.obj.geemer"},
	{pos={37.5,219},spawn="zeta.script.obj.geemer"},
	{pos={41.5,217},spawn="zeta.script.obj.geemer"},
	{pos={42.5,217},spawn="zeta.script.obj.geemer"},
	{pos={43.5,217},spawn="zeta.script.obj.geemer"},
	{pos={44.5,217},spawn="zeta.script.obj.geemer"},
	{pos={45.5,217},spawn="zeta.script.obj.geemer"},
	{pos={42.5,219},spawn="zeta.script.obj.geemer"},
	{pos={39.5,223},spawn="zeta.script.obj.geemer"},
	{pos={39.5,222},spawn="zeta.script.obj.geemer"},
	{pos={45.5,225},spawn="zeta.script.obj.geemer"},
	{pos={45.5,224},spawn="zeta.script.obj.geemer"},
	{pos={34.5,226},spawn="zeta.script.obj.geemer"},
	{pos={30.5,228},spawn="zeta.script.obj.geemer"},
	{pos={26.5,229},spawn="zeta.script.obj.geemer"},
	{pos={25.5,232},spawn="zeta.script.obj.geemer"},
	{pos={26.5,236},spawn="zeta.script.obj.geemer"},
	{pos={25.5,241},spawn="zeta.script.obj.geemer"},
	{pos={47.5,243},spawn="zeta.script.obj.geemer"},
	{color={0,1,0,1},pos={97.5,159},spawn="zeta.script.obj.door"},
	{pos={128.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={127.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={126.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={125.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={124.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={123.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={122.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={121.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={120.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={119.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={118.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={117.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={116.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={115.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={114.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={113.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={112.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={111.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={110.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={109.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={109.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={110.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={111.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={112.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={113.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={114.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={115.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={116.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={117.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={118.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={119.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={120.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={121.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={122.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={123.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={124.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={125.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={126.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={127.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={128.5,162},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,213},spawn="zeta.script.obj.geemer"},
	{pos={23.5,210},spawn="zeta.script.obj.geemer"},
	{pos={28.5,208},spawn="zeta.script.obj.geemer"},
	{pos={35.5,207},spawn="zeta.script.obj.geemer"},
	{pos={37.5,214},spawn="zeta.script.obj.geemer"},
	{pos={30.5,242},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,241},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,240},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,239},spawn="zeta.script.obj.redgeemer"},
	{pos={32.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={32.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,233},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,232},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,232},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,231},spawn="zeta.script.obj.redgeemer"},
	{pos={39.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={39.5,233},spawn="zeta.script.obj.redgeemer"},
	{pos={39.5,232},spawn="zeta.script.obj.redgeemer"},
	{pos={39.5,231},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,232},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,233},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={44.5,242},spawn="zeta.script.obj.redgeemer"},
	{pos={44.5,241},spawn="zeta.script.obj.redgeemer"},
	{pos={44.5,240},spawn="zeta.script.obj.redgeemer"},
	{pos={44.5,239},spawn="zeta.script.obj.redgeemer"},
	{pos={44.5,238},spawn="zeta.script.obj.redgeemer"},
	{color={0,1,0,1},pos={50.5,160},spawn="zeta.script.obj.door"},
	{pos={41.5,158},spawn="zeta.script.obj.savepoint"},
	{pos={160.5,236},spawn="zeta.script.obj.savepoint"},
	{pos={118.5,148},spawn="zeta.script.obj.attackbonus"},
	{pos={151.5,130},spawn="zeta.script.obj.savepoint"},
	{pos={114.5,218},spawn="zeta.script.obj.attackbonus"},
	{color={0,1,1,1},pos={175.5,163},spawn="zeta.script.obj.door"},
}
