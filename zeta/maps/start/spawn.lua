{
	{pos={163.5,236},spawn="zeta.script.obj.terminal",text="Evacuation orders given!\nPlease proceed to launchpad 1 for immediate departure!"},
	{pos={197.5,215},spawn="zeta.script.obj.terminal",text="Journal Entry:\nTeam 1 left without us.\nTeam 2's rocket won't start.\nI think I'm going to go activate the defense robot to help us fight these creatures off...",use="if session.cyanKeyGiven then return end\nsession.cyanKeyGiven = true\ncreate\n 'zeta.script.obj.keycard'\n {pos = self.pos + {-1,0},\n  color = {0,1,1,1}}"},
	{pos={166.5,236},spawn="zeta.script.obj.terminal",text="defense protocols initiated\nweapons storage unlocked",use="if session.colonyWeaponLockerGiven then return end\nsession.colonyWeaponLockerGiven = true\ncreate'zeta.script.obj.blaster'\n\9{pos=self.pos+{1,0}}\ncreate'zeta.script.obj.cells'\n\9{pos=self.pos+{2,0},\n\9cells=5}\nfor i=1,5 do\n\9create'zeta.script.obj.grenadeitem'\n\9\9{pos=self.pos+{3,0}}\nend"},
	{pos={73.5,196},spawn="zeta.script.obj.turret"},
	{pos={56.5,189},spawn="zeta.script.obj.turret"},
	{pos={73.5,189},spawn="zeta.script.obj.turret"},
	{pos={77.5,189},spawn="zeta.script.obj.turret"},
	{pos={91.5,189},spawn="zeta.script.obj.turret"},
	{pos={72.5,151},spawn="zeta.script.obj.turret"},
	{pos={78.5,151},spawn="zeta.script.obj.turret"},
	{pos={78.5,149},spawn="zeta.script.obj.turret"},
	{pos={72.5,149},spawn="zeta.script.obj.turret"},
	{pos={61.5,149},spawn="zeta.script.obj.terminal",use="toggleDefenses()"},
	{pos={72.5,119},spawn="zeta.script.obj.terminal",text="Journal Entry:\nThere appear to be some creatures in the caves.\nOne of them attacked a crew worker the other morning.\nTime to set up the defense system...\n"},
	{pos={150.5,236},spawn="zeta.script.obj.terminal",text="Proceed west to find the entrance to the mining operation."},
	{pos={100.5,120},spawn="zeta.script.obj.geemer"},
	{pos={109.5,120},spawn="zeta.script.obj.geemer"},
	{pos={122.5,120},spawn="zeta.script.obj.geemer"},
	{pos={122.5,122},spawn="zeta.script.obj.geemer"},
	{pos={123.5,122},spawn="zeta.script.obj.geemer"},
	{pos={132.5,120},spawn="zeta.script.obj.geemer"},
	{pos={134.5,120},spawn="zeta.script.obj.geemer"},
	{pos={133.5,120},spawn="zeta.script.obj.geemer"},
	{pos={136.5,120},spawn="zeta.script.obj.geemer"},
	{pos={135.5,120},spawn="zeta.script.obj.geemer"},
	{pos={142.5,122},spawn="zeta.script.obj.geemer"},
	{pos={143.5,122},spawn="zeta.script.obj.geemer"},
	{pos={144.5,122},spawn="zeta.script.obj.geemer"},
	{pos={146.5,122},spawn="zeta.script.obj.geemer"},
	{pos={145.5,122},spawn="zeta.script.obj.geemer"},
	{pos={148.5,122},spawn="zeta.script.obj.geemer"},
	{pos={147.5,122},spawn="zeta.script.obj.geemer"},
	{pos={150.5,122},spawn="zeta.script.obj.geemer"},
	{pos={149.5,122},spawn="zeta.script.obj.geemer"},
	{pos={150.5,120},spawn="zeta.script.obj.geemer"},
	{pos={151.5,120},spawn="zeta.script.obj.geemer"},
	{pos={149.5,120},spawn="zeta.script.obj.geemer"},
	{pos={148.5,120},spawn="zeta.script.obj.geemer"},
	{pos={147.5,120},spawn="zeta.script.obj.geemer"},
	{pos={146.5,120},spawn="zeta.script.obj.geemer"},
	{pos={145.5,120},spawn="zeta.script.obj.geemer"},
	{pos={144.5,120},spawn="zeta.script.obj.geemer"},
	{pos={143.5,120},spawn="zeta.script.obj.geemer"},
	{pos={142.5,120},spawn="zeta.script.obj.geemer"},
	{pos={111.5,122},spawn="zeta.script.obj.geemer"},
	{pos={127.5,129},spawn="zeta.script.obj.geemer"},
	{pos={128.5,133},spawn="zeta.script.obj.geemer"},
	{pos={129.5,131},spawn="zeta.script.obj.geemer"},
	{pos={129.5,125},spawn="zeta.script.obj.geemer"},
	{pos={139.5,123},spawn="zeta.script.obj.geemer"},
	{pos={139.5,124},spawn="zeta.script.obj.geemer"},
	{pos={139.5,125},spawn="zeta.script.obj.geemer"},
	{pos={139.5,126},spawn="zeta.script.obj.geemer"},
	{pos={139.5,127},spawn="zeta.script.obj.geemer"},
	{pos={139.5,128},spawn="zeta.script.obj.geemer"},
	{pos={139.5,129},spawn="zeta.script.obj.geemer"},
	{pos={139.5,130},spawn="zeta.script.obj.geemer"},
	{pos={139.5,131},spawn="zeta.script.obj.geemer"},
	{pos={139.5,132},spawn="zeta.script.obj.geemer"},
	{pos={139.5,133},spawn="zeta.script.obj.geemer"},
	{pos={140.5,133},spawn="zeta.script.obj.geemer"},
	{pos={141.5,133},spawn="zeta.script.obj.geemer"},
	{pos={141.5,132},spawn="zeta.script.obj.geemer"},
	{pos={141.5,131},spawn="zeta.script.obj.geemer"},
	{pos={141.5,130},spawn="zeta.script.obj.geemer"},
	{pos={141.5,128},spawn="zeta.script.obj.geemer"},
	{pos={141.5,129},spawn="zeta.script.obj.geemer"},
	{pos={141.5,127},spawn="zeta.script.obj.geemer"},
	{pos={141.5,126},spawn="zeta.script.obj.geemer"},
	{pos={141.5,125},spawn="zeta.script.obj.geemer"},
	{pos={141.5,123},spawn="zeta.script.obj.geemer"},
	{pos={141.5,124},spawn="zeta.script.obj.geemer"},
	{pos={152.5,120},spawn="zeta.script.obj.geemer"},
	{pos={116.5,133},spawn="zeta.script.obj.geemer"},
	{pos={117.5,131},spawn="zeta.script.obj.geemer"},
	{pos={129.5,126},spawn="zeta.script.obj.geemer"},
	{pos={127.5,128},spawn="zeta.script.obj.geemer"},
	{pos={129.5,130},spawn="zeta.script.obj.geemer"},
	{pos={127.5,130},spawn="zeta.script.obj.geemer"},
	{pos={89.5,171},spawn="zeta.script.obj.turret"},
	{pos={73.5,157},spawn="zeta.script.obj.turret"},
	{pos={77.5,157},spawn="zeta.script.obj.turret"},
	{pos={115.5,131},spawn="zeta.script.obj.geemer"},
	{pos={80.5,141},spawn="zeta.script.obj.turret"},
	{pos={72.5,125},spawn="zeta.script.obj.turret"},
	{pos={79.5,125},spawn="zeta.script.obj.turret"},
	{pos={61.5,177},spawn="zeta.script.obj.turret"},
	{pos={73.5,173},spawn="zeta.script.obj.turret"},
	{pos={76.5,170},spawn="zeta.script.obj.turret"},
	{pos={69.5,185},spawn="zeta.script.obj.turret"},
	{pos={78.5,184},spawn="zeta.script.obj.turret"},
	{pos={77.5,176},spawn="zeta.script.obj.turret"},
	{create="-- re-spawn the geemers if the boss isn't dead yet\nif session.geemerBossKilled then return end\n-- don't run immediately\nfor _,spawnInfo in ipairs(level.spawnInfos) do\n\9if spawnInfo.spawn == 'zeta.script.obj.geemer'\n\9and level:getRoom(spawnInfo.pos:unpack())\n\9\9== level:getRoom(self.pos:unpack())\n\9then\n\9\9spawnInfo:removeObj()\9-- ... should already be removed\n\9\9spawnInfo:respawn(true)\n\9end\nend",pos={157.5,121},spawn="zeta.script.obj.trigger",trigger="-- find the right wall\nlocal rightWall = findName 'geemer-right-wall'\nif session.geemerBossKilled then\n\9self.remove = true\n\9if rightWall then rightWall.remove = true end\n\9return\nend\n-- push into the room\nplayer.pos=self.pos+{2,0}\n-- TODO 'base.script.obj.solid'\nif rightWall then\n\9rightWall.bbox = box2(-.5, 0, .5, 3)\n\9rightWall.solid = true\nend\nrightWall.pushPriority = math.huge\n-- make ourselves solid and blocking\nself.solid = true\nself.bbox = box2(-.5, 0, .5, 3)\n-- center view in room\nlocal center = self.pos+{13,4}\ncenterView(center)\n-- create boss\nlocal BossGeemer = create 'zeta.script.obj.boss-geemer'\nBossGeemer({\n\9pos=center,\n\9-- upon boss death...\n\9onDie=function(geemer)\n\9\9session.geemerBossKilled = true\n\9\9popup('defeated boss geemer!')\n\9\9-- drop a keycard\n\9\9create 'zeta.script.obj.keycard'{pos=geemer.pos, color={0,1,0,1}}\n\9\9-- center the view on the player\n\9\9stopCenterView()\n\9\9-- stop blocking the exit\n\9\9self.remove = true\n\9\9if rightWall then rightWall.remove = true end\n\9end\n},\ntrue)\9-- don't kill\n"},
	{name="geemer-right-wall",pos={183.5,124},spawn="base.script.obj.object"},
	{pos={117.5,182},spawn="zeta.script.obj.attackbonus"},
	{pos={35.5,246},spawn="zeta.script.obj.energytank"},
	{color={0,1,0,1},pos={49.5,214},spawn="zeta.script.obj.door"},
	{pos={170.5,236},spawn="base.script.obj.start"},
	{pos={36.5,233},spawn="zeta.script.obj.geemer"},
	{pos={38.5,235},spawn="zeta.script.obj.geemer"},
	{pos={39.5,234},spawn="zeta.script.obj.geemer"},
	{pos={41.5,239},spawn="zeta.script.obj.geemer"},
	{pos={41.5,240},spawn="zeta.script.obj.geemer"},
	{pos={34.5,234},spawn="zeta.script.obj.geemer"},
	{pos={32.5,235},spawn="zeta.script.obj.geemer"},
	{pos={31.5,236},spawn="zeta.script.obj.geemer"},
	{pos={29.5,239},spawn="zeta.script.obj.geemer"},
	{pos={29.5,240},spawn="zeta.script.obj.geemer"},
	{pos={29.5,241},spawn="zeta.script.obj.geemer"},
	{pos={24.5,219},spawn="zeta.script.obj.geemer"},
	{pos={26.5,223},spawn="zeta.script.obj.geemer"},
	{pos={29.5,225},spawn="zeta.script.obj.geemer"},
	{pos={32.5,221},spawn="zeta.script.obj.geemer"},
	{pos={35.5,222},spawn="zeta.script.obj.geemer"},
	{pos={39.5,220},spawn="zeta.script.obj.geemer"},
	{pos={40.5,220},spawn="zeta.script.obj.geemer"},
	{pos={41.5,220},spawn="zeta.script.obj.geemer"},
	{pos={42.5,220},spawn="zeta.script.obj.geemer"},
	{pos={43.5,220},spawn="zeta.script.obj.geemer"},
	{pos={40.5,222},spawn="zeta.script.obj.geemer"},
	{pos={37.5,226},spawn="zeta.script.obj.geemer"},
	{pos={37.5,225},spawn="zeta.script.obj.geemer"},
	{pos={43.5,228},spawn="zeta.script.obj.geemer"},
	{pos={43.5,227},spawn="zeta.script.obj.geemer"},
	{pos={32.5,229},spawn="zeta.script.obj.geemer"},
	{pos={28.5,231},spawn="zeta.script.obj.geemer"},
	{pos={24.5,232},spawn="zeta.script.obj.geemer"},
	{pos={23.5,235},spawn="zeta.script.obj.geemer"},
	{pos={24.5,239},spawn="zeta.script.obj.geemer"},
	{pos={23.5,244},spawn="zeta.script.obj.geemer"},
	{pos={45.5,246},spawn="zeta.script.obj.geemer"},
	{color={0,1,0,1},pos={97.5,149},spawn="zeta.script.obj.door"},
	{pos={128.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={127.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={126.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={125.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={124.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={123.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={122.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={121.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={120.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={119.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={118.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={117.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={116.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={115.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={114.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={113.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={112.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={111.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={110.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={109.5,150},spawn="zeta.script.obj.redgeemer"},
	{pos={109.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={110.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={111.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={112.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={113.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={114.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={115.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={116.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={117.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={118.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={119.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={120.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={121.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={122.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={123.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={124.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={125.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={126.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={127.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={128.5,152},spawn="zeta.script.obj.redgeemer"},
	{pos={28.5,216},spawn="zeta.script.obj.geemer"},
	{pos={21.5,213},spawn="zeta.script.obj.geemer"},
	{pos={26.5,211},spawn="zeta.script.obj.geemer"},
	{pos={33.5,210},spawn="zeta.script.obj.geemer"},
	{pos={35.5,217},spawn="zeta.script.obj.geemer"},
	{pos={28.5,245},spawn="zeta.script.obj.redgeemer"},
	{pos={28.5,244},spawn="zeta.script.obj.redgeemer"},
	{pos={28.5,243},spawn="zeta.script.obj.redgeemer"},
	{pos={28.5,242},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,238},spawn="zeta.script.obj.redgeemer"},
	{pos={30.5,237},spawn="zeta.script.obj.redgeemer"},
	{pos={33.5,238},spawn="zeta.script.obj.redgeemer"},
	{pos={33.5,237},spawn="zeta.script.obj.redgeemer"},
	{pos={33.5,236},spawn="zeta.script.obj.redgeemer"},
	{pos={33.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={35.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,237},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,236},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={37.5,234},spawn="zeta.script.obj.redgeemer"},
	{pos={40.5,235},spawn="zeta.script.obj.redgeemer"},
	{pos={40.5,236},spawn="zeta.script.obj.redgeemer"},
	{pos={40.5,237},spawn="zeta.script.obj.redgeemer"},
	{pos={40.5,238},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,245},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,244},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,243},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,242},spawn="zeta.script.obj.redgeemer"},
	{pos={42.5,241},spawn="zeta.script.obj.redgeemer"},
	{color={0,1,0,1},pos={49.5,150},spawn="zeta.script.obj.door"},
	{cells="2",pos={37.5,159},spawn="zeta.script.obj.cells"},
	{pos={160.5,236},spawn="zeta.script.obj.savepoint"},
	{cells="2",pos={107.5,132},spawn="zeta.script.obj.cells"},
	{pos={114.5,218},spawn="zeta.script.obj.energytank"},
	{color={0,1,1,1},pos={176.5,153},spawn="zeta.script.obj.door"},
	{pos={161.5,236},spawn="zeta.script.obj.energyrefill"},
	{pos={41.5,148},spawn="zeta.script.obj.energyrefill"},
	{pos={197.5,240},spawn="zeta.script.obj.breakblock",tileIndex=321},
	{pos={187.5,152},spawn="zeta.script.obj.missilelauncher"},
	{pos={189.5,152},spawn="zeta.script.obj.grenadelauncher"},
	{pos={191.5,152},spawn="zeta.script.obj.plasmarifle"},
	{pos={193.5,151},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,152},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,153},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,154},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,155},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,156},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,157},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,157},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,156},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,155},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,154},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,153},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,152},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,151},spawn="zeta.script.obj.grenadeitem"},
	{pos={199.5,151},spawn="zeta.script.obj.cells"},
	{pos={199.5,152},spawn="zeta.script.obj.cells"},
	{pos={199.5,153},spawn="zeta.script.obj.cells"},
	{pos={199.5,154},spawn="zeta.script.obj.cells"},
	{pos={199.5,155},spawn="zeta.script.obj.cells"},
	{pos={199.5,156},spawn="zeta.script.obj.cells"},
	{pos={199.5,157},spawn="zeta.script.obj.cells"},
	{pos={200.5,157},spawn="zeta.script.obj.cells"},
	{pos={200.5,156},spawn="zeta.script.obj.cells"},
	{pos={200.5,155},spawn="zeta.script.obj.cells"},
	{pos={200.5,154},spawn="zeta.script.obj.cells"},
	{pos={200.5,153},spawn="zeta.script.obj.cells"},
	{pos={200.5,152},spawn="zeta.script.obj.cells"},
	{pos={200.5,151},spawn="zeta.script.obj.cells"},
	{pos={37.5,157},spawn="zeta.script.obj.breakblock",tileIndex=5},
	{pos={63.5,196},spawn="zeta.script.obj.barrier"},
	{pos={70.5,196},spawn="zeta.script.obj.barrier"},
	{pos={80.5,196},spawn="zeta.script.obj.barrier"},
	{pos={87.5,196},spawn="zeta.script.obj.barrier"},
	{pos={63.5,189},spawn="zeta.script.obj.barrier"},
	{pos={70.5,189},spawn="zeta.script.obj.barrier"},
	{pos={80.5,189},spawn="zeta.script.obj.barrier"},
	{pos={87.5,189},spawn="zeta.script.obj.barrier"},
	{pos={62.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={64.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={63.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={70.5,149},spawn="zeta.script.obj.barrier"},
	{pos={80.5,149},spawn="zeta.script.obj.barrier"},
	{pos={87.5,149},spawn="zeta.script.obj.barrier"},
	{pos={80.5,143},spawn="zeta.script.obj.turret"},
	{pos={79.5,141},spawn="zeta.script.obj.barrier"},
	{pos={78.5,141},spawn="zeta.script.obj.barrier"},
	{pos={77.5,141},spawn="zeta.script.obj.barrier"},
	{pos={76.5,141},spawn="zeta.script.obj.barrier"},
	{pos={81.5,120},spawn="zeta.script.obj.barrier"},
	{pos={80.5,123},spawn="zeta.script.obj.turret"},
	{pos={80.5,119},spawn="zeta.script.obj.turret"},
	{pos={82.5,120},spawn="zeta.script.obj.barrier"},
	{pos={83.5,120},spawn="zeta.script.obj.barrier"},
	{pos={84.5,120},spawn="zeta.script.obj.barrier"},
	{pos={85.5,120},spawn="zeta.script.obj.barrier"},
	{pos={60.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={59.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={58.5,149},spawn="zeta.script.obj.barrier",timeOff="3",timeOn="1"},
	{pos={79.5,119},spawn="zeta.script.obj.terminal",use="toggleDefenses()"},
	{pos={172.5,236},spawn="zeta.script.obj.heart"},
	{pos={173.5,236},spawn="zeta.script.obj.heart"},
	{pos={93.5,196},spawn="zeta.script.obj.turret"},
	{color={0,1,0,1},pos={48.5,214},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={48.5,150},spawn="zeta.script.obj.door"},
	{pos={197.5,247},spawn="zeta.script.obj.breakblock",tileIndex=321},
	{pos={197.5,254},spawn="zeta.script.obj.breakblock",tileIndex=321},
	{color={0,1,1,1},pos={177.5,153},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={96.5,149},spawn="zeta.script.obj.door"},
	{pos={153.5,120},spawn="zeta.script.obj.geemer"},
	{pos={155.5,121},spawn="zeta.script.obj.savepoint"},
	{pos={83.5,142},spawn="zeta.script.obj.redgeemer"},
	{pos={74.5,147},spawn="zeta.script.obj.geemer"},
	{pos={71.5,151},spawn="zeta.script.obj.geemer"},
	{pos={68.5,149},spawn="zeta.script.obj.geemer"},
	{pos={67.5,151},spawn="zeta.script.obj.geemer"},
	{pos={83.5,149},spawn="zeta.script.obj.geemer"},
	{pos={85.5,151},spawn="zeta.script.obj.geemer"},
	{pos={93.5,176},spawn="zeta.script.obj.geemer"},
	{pos={56.5,152},spawn="zeta.script.obj.geemer"},
	{pos={54.5,150},spawn="zeta.script.obj.geemer"},
	{pos={53.5,154},spawn="zeta.script.obj.geemer"},
	{pos={53.5,159},spawn="zeta.script.obj.geemer"},
	{pos={81.5,157},spawn="zeta.script.obj.redgeemer"},
	{pos={80.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={84.5,164},spawn="zeta.script.obj.redgeemer"},
	{pos={88.5,165},spawn="zeta.script.obj.redgeemer"},
	{pos={71.5,160},spawn="zeta.script.obj.redgeemer"},
	{pos={69.5,164},spawn="zeta.script.obj.redgeemer"},
	{pos={66.5,169},spawn="zeta.script.obj.redgeemer"},
	{pos={66.5,168},spawn="zeta.script.obj.redgeemer"},
	{pos={63.5,167},spawn="zeta.script.obj.redgeemer"},
	{pos={65.5,164},spawn="zeta.script.obj.redgeemer"},
	{pos={61.5,174},spawn="zeta.script.obj.redgeemer"},
	{pos={61.5,173},spawn="zeta.script.obj.redgeemer"},
	{pos={66.5,174},spawn="zeta.script.obj.redgeemer"},
	{pos={69.5,177},spawn="zeta.script.obj.redgeemer"},
	{pos={71.5,175},spawn="zeta.script.obj.redgeemer"},
	{pos={79.5,174},spawn="zeta.script.obj.redgeemer"},
	{pos={79.5,171},spawn="zeta.script.obj.redgeemer"},
	{pos={85.5,172},spawn="zeta.script.obj.redgeemer"},
	{pos={89.5,173},spawn="zeta.script.obj.redgeemer"},
	{pos={85.5,178},spawn="zeta.script.obj.redgeemer"},
	{pos={74.5,181},spawn="zeta.script.obj.redgeemer"},
	{pos={81.5,182},spawn="zeta.script.obj.redgeemer"},
	{pos={62.5,181},spawn="zeta.script.obj.redgeemer"},
	{pos={66.5,184},spawn="zeta.script.obj.redgeemer"},
	{pos={67.5,184},spawn="zeta.script.obj.redgeemer"},
	{pos={69.5,180},spawn="zeta.script.obj.redgeemer"},
	{pos={89.5,189},spawn="zeta.script.obj.geemer"},
	{pos={82.5,189},spawn="zeta.script.obj.geemer"},
	{pos={84.5,191},spawn="zeta.script.obj.geemer"},
	{pos={68.5,191},spawn="zeta.script.obj.geemer"},
	{pos={66.5,189},spawn="zeta.script.obj.geemer"},
	{pos={61.5,189},spawn="zeta.script.obj.geemer"},
	{pos={59.5,191},spawn="zeta.script.obj.geemer"},
	{pos={78.5,196},spawn="zeta.script.obj.geemer"},
	{pos={74.5,198},spawn="zeta.script.obj.geemer"},
	{pos={76.5,198},spawn="zeta.script.obj.geemer"},
	{pos={83.5,196},spawn="zeta.script.obj.geemer"},
	{pos={90.5,198},spawn="zeta.script.obj.geemer"},
	{pos={66.5,196},spawn="zeta.script.obj.geemer"},
	{pos={67.5,198},spawn="zeta.script.obj.geemer"},
	{pos={62.5,215},spawn="zeta.script.obj.geemer"},
	{pos={67.5,213},spawn="zeta.script.obj.geemer"},
	{pos={77.5,216},spawn="zeta.script.obj.geemer"},
	{pos={77.5,223},spawn="zeta.script.obj.geemer"},
	{pos={68.5,226},spawn="zeta.script.obj.geemer"},
	{pos={70.5,223},spawn="zeta.script.obj.geemer"},
	{pos={55.5,227},spawn="zeta.script.obj.geemer"},
	{pos={62.5,227},spawn="zeta.script.obj.geemer"},
	{pos={57.5,231},spawn="zeta.script.obj.geemer"},
	{pos={56.5,234},spawn="zeta.script.obj.geemer"},
	{pos={58.5,241},spawn="zeta.script.obj.geemer"},
	{pos={54.5,246},spawn="zeta.script.obj.geemer"},
	{pos={62.5,247},spawn="zeta.script.obj.geemer"},
	{pos={53.5,249},spawn="zeta.script.obj.geemer"},
	{pos={76.5,243},spawn="zeta.script.obj.redgeemer"},
	{pos={77.5,248},spawn="zeta.script.obj.redgeemer"},
	{pos={69.5,246},spawn="zeta.script.obj.redgeemer"},
	{pos={67.5,249},spawn="zeta.script.obj.redgeemer"},
	{pos={61.5,198},spawn="zeta.script.obj.geemer"},
	{pos={54.5,198},spawn="zeta.script.obj.geemer"},
	{pos={51.5,204},spawn="zeta.script.obj.geemer"},
	{pos={64.5,213},spawn="zeta.script.obj.geemer"},
	{pos={74.5,142},spawn="zeta.script.obj.redgeemer"},
	{pos={78.5,143},spawn="zeta.script.obj.geemer"},
	{pos={77.5,143},spawn="zeta.script.obj.geemer"},
	{pos={90.5,196},spawn="zeta.script.obj.terminal",text="Journal Entry:\nWhen mining in the crust of this planet we stumbled across a unique cave system.\nNot sure how they were formed.\nThe minerals seem to proceed through the caves.\nThe prospecting company is eager for us to follow."},
	{color={1,0,0,1},pos={48.5,189},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={49.5,189},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={49.5,167},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={48.5,167},spawn="zeta.script.obj.door"},
	{pos={80.5,105},spawn="zeta.script.obj.door"},
	{pos={81.5,105},spawn="zeta.script.obj.door"},
	{pos={48.5,85},spawn="zeta.script.obj.door"},
	{pos={49.5,85},spawn="zeta.script.obj.door"},
	{pos={48.5,121},spawn="zeta.script.obj.door"},
	{pos={49.5,121},spawn="zeta.script.obj.door"},
	{pos={32.5,124},spawn="zeta.script.obj.door"},
	{pos={33.5,124},spawn="zeta.script.obj.door"},
	{pos={16.5,167},spawn="zeta.script.obj.door"},
	{pos={17.5,167},spawn="zeta.script.obj.door"},
	{pos={16.5,183},spawn="zeta.script.obj.door"},
	{pos={17.5,183},spawn="zeta.script.obj.door"},
	{pos={64.5,51},spawn="zeta.script.obj.door"},
	{pos={65.5,51},spawn="zeta.script.obj.door"},
	{pos={52.5,181},spawn="zeta.script.obj.sawblade",travel={4,0}},
	{pos={56.5,177},spawn="zeta.script.obj.sawblade",travel={-4,0}},
	{pos={52.5,173},spawn="zeta.script.obj.sawblade",travel={4,0}},
	{pos={51.5,163},spawn="zeta.script.obj.sawblade",travel={6,6}},
	{pos={57.5,159},spawn="zeta.script.obj.sawblade",travel={-6,6}},
	{pos={51.5,155},spawn="zeta.script.obj.sawblade",timeOffset="0",travel={6,0},travelTime="2"},
	{pos={51.5,154},spawn="zeta.script.obj.sawblade",timeOffset=".1",travel={6,0},travelTime="2"},
	{pos={51.5,153},spawn="zeta.script.obj.sawblade",timeOffset=".2",travel={6,0},travelTime="2"},
	{pos={112.5,122},spawn="zeta.script.obj.geemer"},
	{pos={121.5,120},spawn="zeta.script.obj.geemer"},
	{pos={134.5,122},spawn="zeta.script.obj.geemer"},
	{pos={135.5,122},spawn="zeta.script.obj.geemer"},
	{pos={136.5,122},spawn="zeta.script.obj.geemer"},
}