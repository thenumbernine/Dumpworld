{
	{pos={163.5,236},spawn="zeta.script.obj.terminal",text="Evacuation orders given!\nPlease proceed to launchpad 1 for immediate departure!"},
	{pos={197.5,215},spawn="zeta.script.obj.terminal",text="Journal Entry:\nTeam 1 left without us.\nTeam 2's rocket won't start.\nI think I'm going to go activate the defense robot to help us fight these creatures off...",use="if session.cyanKeyGiven then return end\nsession.cyanKeyGiven = true\ncreate\n 'zeta.script.obj.keycard'\n {pos = self.pos + {-1,0},\n  color = {0,1,1,1}}"},
	{pos={166.5,236},spawn="zeta.script.obj.terminal",text="defense protocols initiated\nweapons storage unlocked",use="if session.colonyWeaponLockerGiven then return end\nsession.colonyWeaponLockerGiven = true\ncreate'zeta.script.obj.blaster'{pos=self.pos+{1,0}}\ncreate'zeta.script.obj.cells'{pos=self.pos+{2,0},cells=5}\nfor i=1,5 do\n\9create'zeta.script.obj.grenadeitem'{pos=self.pos+{3,0}}\nend"},
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
	{hidden=true,pos={100.5,120},spawn="zeta.script.obj.geemer"},
	{hidden=true,pos={109.5,120},spawn="zeta.script.obj.geemer"},
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
	{hidden=true,pos={111.5,122},spawn="zeta.script.obj.geemer"},
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
	{create="remove 'geemer-right-wall'\nremove 'geemer-left-wall'\nremove 'boss-geemer'\nif session.geemerBossKilled then\n\9self.remove = true\nend",pos={186.5,117},spawn="zeta.script.obj.trigger",trigger="if session.geemerBossKilled then\n\9return\nend\nrespawn 'geemer-left-wall'\nrespawn 'geemer-right-wall'\nrespawn 'boss-geemer'"},
	{bbox={max={0.5,3},min={-0.5,0}},name="geemer-right-wall",pos={206.5,123},spawn="zeta.script.obj.solid"},
	{bbox={max={0.5,3},min={-0.5,0}},name="geemer-left-wall",pos={180.5,121},spawn="zeta.script.obj.solid"},
	{name="boss-geemer",onDie="session.geemerBossKilled = true\npopup('defeated boss geemer!')\n-- drop a keycard\ncreate 'zeta.script.obj.keycard'{pos=self.pos, color={0,1,0,1}}\n-- center the view on the player\nstopCenterView()\n-- stop blocking the exit\nremove('geemer-left-wall', 'geemer-right-wall')\n",pos={193.5,125},spawn="zeta.script.obj.boss-geemer"},
	{pos={117.5,182},spawn="zeta.script.obj.attackbonus"},
	{pos={35.5,246},spawn="zeta.script.obj.energytank"},
	{color={0,1,0,1},pos={49.5,214},spawn="zeta.script.obj.door"},
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
	{cells="2",pos={36.5,159},spawn="zeta.script.obj.cells"},
	{pos={160.5,236},spawn="zeta.script.obj.savepoint"},
	{cells="2",pos={107.5,139},spawn="zeta.script.obj.cells"},
	{pos={114.5,218},spawn="zeta.script.obj.energytank"},
	{color={0,1,1,1},pos={176.5,152},spawn="zeta.script.obj.door"},
	{pos={161.5,236},spawn="zeta.script.obj.energyrefill"},
	{pos={41.5,148},spawn="zeta.script.obj.energyrefill"},
	{pos={203.5,198},spawn="zeta.script.obj.missilelauncher"},
	{pos={205.5,198},spawn="zeta.script.obj.grenadelauncher"},
	{pos={207.5,198},spawn="zeta.script.obj.plasmarifle"},
	{pos={193.5,189},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,190},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,191},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,192},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,193},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,194},spawn="zeta.script.obj.grenadeitem"},
	{pos={193.5,195},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,195},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,194},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,193},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,192},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,191},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,190},spawn="zeta.script.obj.grenadeitem"},
	{pos={194.5,189},spawn="zeta.script.obj.grenadeitem"},
	{pos={199.5,189},spawn="zeta.script.obj.cells"},
	{pos={199.5,190},spawn="zeta.script.obj.cells"},
	{pos={199.5,191},spawn="zeta.script.obj.cells"},
	{pos={199.5,192},spawn="zeta.script.obj.cells"},
	{pos={199.5,193},spawn="zeta.script.obj.cells"},
	{pos={199.5,194},spawn="zeta.script.obj.cells"},
	{pos={199.5,195},spawn="zeta.script.obj.cells"},
	{pos={200.5,195},spawn="zeta.script.obj.cells"},
	{pos={200.5,194},spawn="zeta.script.obj.cells"},
	{pos={200.5,193},spawn="zeta.script.obj.cells"},
	{pos={200.5,192},spawn="zeta.script.obj.cells"},
	{pos={200.5,191},spawn="zeta.script.obj.cells"},
	{pos={200.5,190},spawn="zeta.script.obj.cells"},
	{pos={200.5,189},spawn="zeta.script.obj.cells"},
	{pos={63.5,196},spawn="zeta.script.obj.barrier"},
	{pos={70.5,196},spawn="zeta.script.obj.barrier"},
	{pos={80.5,196},spawn="zeta.script.obj.barrier"},
	{pos={87.5,196},spawn="zeta.script.obj.barrier"},
	{pos={63.5,189},spawn="zeta.script.obj.barrier"},
	{pos={70.5,189},spawn="zeta.script.obj.barrier"},
	{pos={80.5,189},spawn="zeta.script.obj.barrier"},
	{pos={87.5,189},spawn="zeta.script.obj.barrier"},
	{pos={62.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={64.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={63.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
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
	{pos={60.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={59.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={58.5,149},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={79.5,119},spawn="zeta.script.obj.terminal",use="toggleDefenses()"},
	{pos={93.5,196},spawn="zeta.script.obj.turret"},
	{color={0,1,0,1},pos={48.5,214},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={48.5,150},spawn="zeta.script.obj.door"},
	{color={0,1,1,1},pos={177.5,152},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={96.5,149},spawn="zeta.script.obj.door"},
	{pos={153.5,120},spawn="zeta.script.obj.geemer"},
	{pos={169.5,117},spawn="zeta.script.obj.savepoint"},
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
	{pos={69.5,246},spawn="zeta.script.obj.redgeemer"},
	{pos={67.5,249},spawn="zeta.script.obj.redgeemer"},
	{pos={61.5,198},spawn="zeta.script.obj.geemer"},
	{pos={54.5,198},spawn="zeta.script.obj.geemer"},
	{pos={51.5,204},spawn="zeta.script.obj.geemer"},
	{pos={64.5,213},spawn="zeta.script.obj.geemer"},
	{pos={74.5,142},spawn="zeta.script.obj.redgeemer"},
	{pos={78.5,143},spawn="zeta.script.obj.geemer"},
	{pos={77.5,143},spawn="zeta.script.obj.geemer"},
	{pos={58.5,196},spawn="zeta.script.obj.terminal",text="Journal Entry:\nWhen mining in the crust of this planet we stumbled across a unique cave system.\nNot sure how they were formed.\nThe minerals seem to proceed through the caves.\nThe prospecting company is eager for us to follow."},
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
	{pos={51.5,155},spawn="zeta.script.obj.sawblade",timeOffset=0,travel={6,0},travelTime=2},
	{pos={51.5,154},spawn="zeta.script.obj.sawblade",timeOffset=0.10000000149012,travel={6,0},travelTime=2},
	{pos={51.5,153},spawn="zeta.script.obj.sawblade",timeOffset=0.20000000298023,travel={6,0},travelTime=2},
	{hidden=true,pos={112.5,122},spawn="zeta.script.obj.geemer"},
	{pos={121.5,120},spawn="zeta.script.obj.geemer"},
	{pos={134.5,122},spawn="zeta.script.obj.geemer"},
	{pos={135.5,122},spawn="zeta.script.obj.geemer"},
	{pos={136.5,122},spawn="zeta.script.obj.geemer"},
	{circuit="",pos={41.5,198},spawn="zeta.script.obj.turret"},
	{circuit="Red Security Level",pos={44.5,198},spawn="zeta.script.obj.turret"},
	{name="happy fun ball",pos={189.5,236},spawn="zeta.script.obj.item",sprite="blaster-shot"},
	{drawScale={1,1},name="damaged sawblade",pos={95.5,197},spawn="zeta.script.obj.item",sprite="sawblade"},
	{pos={39.5,148},spawn="zeta.script.obj.savepoint"},
	{pos={210.5,189},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,189},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,190},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,190},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,191},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,191},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,192},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,192},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,193},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,193},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,194},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,194},spawn="zeta.script.obj.missileitem"},
	{pos={210.5,195},spawn="zeta.script.obj.missileitem"},
	{pos={211.5,195},spawn="zeta.script.obj.missileitem"},
	{pos={200.5,151},spawn="zeta.script.obj.terminal",use="local sawblade = player:findItemNamed'damaged sawblade'\nif not sawblade\nthen\n\9popup[[] fabrication facilities offline...]]\nelse\n\9popup[[looks like you could put together something to defend yourself...]]\n\9player:removeItem(sawblade).remove=true\n\9create'zeta.script.obj.skillsaw'{pos=self.pos+{2,0}}\nend"},
	{color={1,0.5,0.5,1},name="special rocks",pos={252.5,138},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={0.5,1,0.5,1},name="more special rocks",pos={234.5,70},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={1,1,0.5,1},name="even more special rocks",pos={236.5,99},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={180.5,100},spawn="zeta.script.obj.terminal",sprite="gato",text="MY NAME IS GATO\nI HAVE METAL JOINTS\nBEAT ME UP\nAND EARN 15 SILVER POINTS!"},
	{color={0.5,1,1,1},name="more candy",pos={158.5,102},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={68.5,102},spawn="zeta.script.obj.terminal",text="Technical Notes:\nThe defense AI and mineral surveying AI have got their wires crossed.\nSometimes triggering a positive in the survey code will deactivate the defenses.\nThis only occurs when you overload the survey AI with several mineral detections at once."},
	{pos={77.5,98},spawn="zeta.script.obj.grenadeitem"},
	{pos={75.5,98},spawn="zeta.script.obj.grenadeitem"},
	{pos={72.5,98},spawn="zeta.script.obj.grenadeitem"},
	{pos={68.5,98},spawn="zeta.script.obj.defensebonus"},
	{circuit="Mineral Processing",pos={54.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={55.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={56.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={57.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={58.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={59.5,82},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={59.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={58.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={57.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={56.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={55.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={54.5,85},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={54.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={55.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={56.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={57.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={58.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={59.5,88},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={59.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={58.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={57.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={56.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={55.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={54.5,91},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={53.5,83},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={53.5,85},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={53.5,87},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={53.5,89},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={53.5,91},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={53.5,93},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{bbox={max={0.5,12},min={-0.5,0}},name="main mining defense wall",pos={51.5,82},spawn="zeta.script.obj.solid"},
	{pos={68.5,82},spawn="zeta.script.obj.terminal",use="popup[[mineral surveying system ... scanning for minerals ...]]\nlocal names = table{'special rocks', 'more special rocks', 'even more special rocks', 'more candy', 'best candy ever', 'super special rocks', 'meh ok rocks'}\nlocal items = names:map(function(name,_,t)\n\9return player:findItemNamed(name) or nil, #t+1\nend)\nif #items == #names then\n\9popup[[Circuit Overload!]]\n\9toggleDefenses{\n\9\9circuit='Mineral Processing',\n\9\9value=false,\n\9}\n\9remove 'main mining defense wall'\n\9for _,item in ipairs(items) do\n\9\9player:removeItem(item).remove=true\n\9end\nelse\n\9popup[[No anomalies detected...]]\nend"},
	{color={0.5,0.5,1,1},name="best candy ever",pos={173.5,103},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={1,0.5,1,1},name="super special rocks",pos={126.5,86},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={0.20000000298023,0.20000000298023,0.20000000298023,1},name="meh ok rocks",pos={153.5,66},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={239.5,62},spawn="zeta.script.obj.energytank"},
	{pos={192.5,22},spawn="zeta.script.obj.cells"},
	{color={1,0,1,1},pos={176.5,182},spawn="zeta.script.obj.door"},
	{color={1,0,1,1},pos={177.5,182},spawn="zeta.script.obj.door"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={50.5,207},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={50.5,210},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={82.5,255},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={98.5,159},spawn="zeta.script.obj.trigger"},
	{pos={250.5,37},spawn="zeta.script.obj.terminal",text="Now leaving the caves\nThat's all, folks!"},
	{pos={170.5,236},spawn="base.script.obj.start"},
	{pos={157.5,131},spawn="zeta.script.obj.terminal",use="toggleDefenses 'Mine Exit Corridor'"},
	{circuit="Mine Exit Corridor",pos={159.5,119},spawn="zeta.script.obj.sawblade",timeOffset=3,travel={-67,0}},
	{circuit="Mine Exit Corridor",pos={159.5,123},spawn="zeta.script.obj.sawblade",timeOffset=3.0999999046326,travel={-67,0}},
	{create="toggleDefenses{\n\9circuit='Mineral Processing',\n\9value=true,\n\9silent=true\n}",pos={47.5,82},spawn="zeta.script.obj.trigger"},
	{pos={43.5,148},spawn="zeta.script.obj.terminal",text="The creatures have invaded the base.\nThe escape rocket has left without us.\nWe can't make a stand here.\nSome of the crew are thinking there might be safety somewhere in the caves..."},
	{color={1,0,0,1},pos={248.5,37},spawn="zeta.script.obj.keycard"},
	{pos={77.5,249},spawn="zeta.script.obj.redgeemer"},
	{pos={173.5,182},spawn="zeta.script.obj.terminal",text="Weapon Storage Locker"},
	{pos={26.5,249},spawn="zeta.script.obj.bat"},
	{pos={32.5,249},spawn="zeta.script.obj.bat"},
	{pos={38.5,249},spawn="zeta.script.obj.bat"},
	{pos={42.5,249},spawn="zeta.script.obj.bat"},
	{pos={159.5,159},spawn="zeta.script.obj.bat"},
	{pos={164.5,158},spawn="zeta.script.obj.bat"},
	{pos={163.5,160},spawn="zeta.script.obj.bat"},
	{pos={167.5,159},spawn="zeta.script.obj.bat"},
}