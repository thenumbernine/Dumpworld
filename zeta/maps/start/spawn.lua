{
	{pos={547.5,1004},spawn="zeta.script.obj.terminal",text="Evacuation orders given!\nPlease proceed to launchpad 1 for immediate departure!"},
	{pos={581.5,983},spawn="zeta.script.obj.terminal",text="Journal Entry:\nTeam 1 left without us.\nTeam 2's rocket won't start.\nI think I'm going to go activate the defense robot to help us fight these creatures off...",use="if session.cyanKeyGiven then return end\nsession.cyanKeyGiven = true\ncreate\n 'zeta.script.obj.keycard'\n {pos = self.pos + {-1,0},\n  color = {0,1,1,1}}"},
	{pos={550.5,1004},spawn="zeta.script.obj.terminal",text="defense protocols initiated\nweapons storage unlocked",use="if session.colonyWeaponLockerGiven then return end\nsession.colonyWeaponLockerGiven = true\ncreate'zeta.script.obj.blaster'{pos=self.pos+{1,0}}"},
	{pos={440.5,956},spawn="zeta.script.obj.turret"},
	{pos={423.5,949},spawn="zeta.script.obj.turret"},
	{pos={440.5,949},spawn="zeta.script.obj.turret"},
	{pos={444.5,949},spawn="zeta.script.obj.turret"},
	{pos={458.5,949},spawn="zeta.script.obj.turret"},
	{pos={439.5,911},spawn="zeta.script.obj.turret"},
	{pos={445.5,911},spawn="zeta.script.obj.turret"},
	{pos={445.5,909},spawn="zeta.script.obj.turret"},
	{pos={439.5,909},spawn="zeta.script.obj.turret"},
	{pos={428.5,909},spawn="zeta.script.obj.terminal",use="toggleDefenses()"},
	{pos={456.5,872},spawn="zeta.script.obj.terminal",text="Journal Entry:\nThere appear to be some creatures in the caves.\nOne of them attacked a crew worker the other morning.\nTime to set up the defense system...\n"},
	{pos={534.5,1004},spawn="zeta.script.obj.terminal",text="Proceed west to find the entrance to the mining operation."},
	{hidden=true,pos={484.5,873},spawn="zeta.script.obj.geemer"},
	{hidden=true,pos={493.5,873},spawn="zeta.script.obj.geemer"},
	{pos={506.5,873},spawn="zeta.script.obj.geemer"},
	{pos={506.5,875},spawn="zeta.script.obj.geemer"},
	{pos={507.5,875},spawn="zeta.script.obj.geemer"},
	{pos={516.5,873},spawn="zeta.script.obj.geemer"},
	{pos={518.5,873},spawn="zeta.script.obj.geemer"},
	{pos={517.5,873},spawn="zeta.script.obj.geemer"},
	{pos={520.5,873},spawn="zeta.script.obj.geemer"},
	{pos={519.5,873},spawn="zeta.script.obj.geemer"},
	{pos={526.5,875},spawn="zeta.script.obj.geemer"},
	{pos={527.5,875},spawn="zeta.script.obj.geemer"},
	{pos={528.5,875},spawn="zeta.script.obj.geemer"},
	{pos={530.5,875},spawn="zeta.script.obj.geemer"},
	{pos={529.5,875},spawn="zeta.script.obj.geemer"},
	{pos={532.5,875},spawn="zeta.script.obj.geemer"},
	{pos={531.5,875},spawn="zeta.script.obj.geemer"},
	{pos={534.5,875},spawn="zeta.script.obj.geemer"},
	{pos={533.5,875},spawn="zeta.script.obj.geemer"},
	{pos={534.5,873},spawn="zeta.script.obj.geemer"},
	{pos={535.5,873},spawn="zeta.script.obj.geemer"},
	{pos={533.5,873},spawn="zeta.script.obj.geemer"},
	{pos={532.5,873},spawn="zeta.script.obj.geemer"},
	{pos={531.5,873},spawn="zeta.script.obj.geemer"},
	{pos={530.5,873},spawn="zeta.script.obj.geemer"},
	{pos={529.5,873},spawn="zeta.script.obj.geemer"},
	{pos={528.5,873},spawn="zeta.script.obj.geemer"},
	{pos={527.5,873},spawn="zeta.script.obj.geemer"},
	{pos={526.5,873},spawn="zeta.script.obj.geemer"},
	{hidden=true,pos={495.5,875},spawn="zeta.script.obj.geemer"},
	{pos={511.5,882},spawn="zeta.script.obj.geemer"},
	{pos={512.5,886},spawn="zeta.script.obj.geemer"},
	{pos={513.5,884},spawn="zeta.script.obj.geemer"},
	{pos={513.5,878},spawn="zeta.script.obj.geemer"},
	{pos={523.5,876},spawn="zeta.script.obj.geemer"},
	{pos={523.5,877},spawn="zeta.script.obj.geemer"},
	{pos={523.5,878},spawn="zeta.script.obj.geemer"},
	{pos={523.5,879},spawn="zeta.script.obj.geemer"},
	{pos={523.5,880},spawn="zeta.script.obj.geemer"},
	{pos={523.5,881},spawn="zeta.script.obj.geemer"},
	{pos={523.5,882},spawn="zeta.script.obj.geemer"},
	{pos={523.5,883},spawn="zeta.script.obj.geemer"},
	{pos={523.5,884},spawn="zeta.script.obj.geemer"},
	{pos={523.5,885},spawn="zeta.script.obj.geemer"},
	{pos={523.5,886},spawn="zeta.script.obj.geemer"},
	{pos={524.5,886},spawn="zeta.script.obj.geemer"},
	{pos={525.5,886},spawn="zeta.script.obj.geemer"},
	{pos={525.5,885},spawn="zeta.script.obj.geemer"},
	{pos={525.5,884},spawn="zeta.script.obj.geemer"},
	{pos={525.5,883},spawn="zeta.script.obj.geemer"},
	{pos={525.5,881},spawn="zeta.script.obj.geemer"},
	{pos={525.5,882},spawn="zeta.script.obj.geemer"},
	{pos={525.5,880},spawn="zeta.script.obj.geemer"},
	{pos={525.5,879},spawn="zeta.script.obj.geemer"},
	{pos={525.5,878},spawn="zeta.script.obj.geemer"},
	{pos={525.5,876},spawn="zeta.script.obj.geemer"},
	{pos={525.5,877},spawn="zeta.script.obj.geemer"},
	{pos={536.5,873},spawn="zeta.script.obj.geemer"},
	{pos={500.5,886},spawn="zeta.script.obj.geemer"},
	{pos={501.5,884},spawn="zeta.script.obj.geemer"},
	{pos={513.5,879},spawn="zeta.script.obj.geemer"},
	{pos={511.5,881},spawn="zeta.script.obj.geemer"},
	{pos={513.5,883},spawn="zeta.script.obj.geemer"},
	{pos={511.5,883},spawn="zeta.script.obj.geemer"},
	{pos={456.5,931},spawn="zeta.script.obj.turret"},
	{pos={440.5,917},spawn="zeta.script.obj.turret"},
	{pos={444.5,917},spawn="zeta.script.obj.turret"},
	{pos={499.5,884},spawn="zeta.script.obj.geemer"},
	{pos={447.5,901},spawn="zeta.script.obj.turret"},
	{pos={456.5,878},spawn="zeta.script.obj.turret"},
	{pos={463.5,878},spawn="zeta.script.obj.turret"},
	{pos={428.5,937},spawn="zeta.script.obj.turret"},
	{pos={440.5,933},spawn="zeta.script.obj.turret"},
	{pos={443.5,930},spawn="zeta.script.obj.turret"},
	{pos={436.5,945},spawn="zeta.script.obj.turret"},
	{pos={445.5,944},spawn="zeta.script.obj.turret"},
	{pos={444.5,936},spawn="zeta.script.obj.turret"},
	{create="remove 'geemer-right-wall'\nremove 'geemer-left-wall'\nremove 'boss-geemer'\nif session.geemerBossKilled then\n\9self.remove = true\nend",pos={584.5,870},spawn="zeta.script.obj.trigger",trigger="if session.geemerBossKilled then\n\9return\nend\nrespawn 'geemer-left-wall'\nrespawn 'geemer-right-wall'\nrespawn 'boss-geemer'"},
	{bbox={max={0.5,3},min={-0.5,0}},name="geemer-right-wall",pos={604.5,876},spawn="zeta.script.obj.solid"},
	{bbox={max={0.5,3},min={-0.5,0}},name="geemer-left-wall",pos={578.5,874},spawn="zeta.script.obj.solid"},
	{name="boss-geemer",onDie="session.geemerBossKilled = true\npopup('defeated boss geemer!')\n-- drop a keycard\ncreate 'zeta.script.obj.keycard'{pos=self.pos, color={0,1,0,1}}\n-- center the view on the player\nstopCenterView()\n-- stop blocking the exit\nremove('geemer-left-wall', 'geemer-right-wall')\n",pos={591.5,878},spawn="zeta.script.obj.boss-geemer"},
	{pos={485.5,942},spawn="zeta.script.obj.attackbonus"},
	{pos={403.5,1014},spawn="zeta.script.obj.energytank"},
	{color={0,1,0,1},pos={417.5,982},spawn="zeta.script.obj.door"},
	{pos={404.5,1001},spawn="zeta.script.obj.geemer"},
	{pos={406.5,1003},spawn="zeta.script.obj.geemer"},
	{pos={407.5,1002},spawn="zeta.script.obj.geemer"},
	{pos={409.5,1007},spawn="zeta.script.obj.geemer"},
	{pos={409.5,1008},spawn="zeta.script.obj.geemer"},
	{pos={402.5,1002},spawn="zeta.script.obj.geemer"},
	{pos={400.5,1003},spawn="zeta.script.obj.geemer"},
	{pos={399.5,1004},spawn="zeta.script.obj.geemer"},
	{pos={397.5,1007},spawn="zeta.script.obj.geemer"},
	{pos={397.5,1008},spawn="zeta.script.obj.geemer"},
	{pos={397.5,1009},spawn="zeta.script.obj.geemer"},
	{pos={392.5,987},spawn="zeta.script.obj.geemer"},
	{pos={394.5,991},spawn="zeta.script.obj.geemer"},
	{pos={397.5,993},spawn="zeta.script.obj.geemer"},
	{pos={400.5,989},spawn="zeta.script.obj.geemer"},
	{pos={403.5,990},spawn="zeta.script.obj.geemer"},
	{pos={407.5,988},spawn="zeta.script.obj.geemer"},
	{pos={408.5,988},spawn="zeta.script.obj.geemer"},
	{pos={409.5,988},spawn="zeta.script.obj.geemer"},
	{pos={410.5,988},spawn="zeta.script.obj.geemer"},
	{pos={411.5,988},spawn="zeta.script.obj.geemer"},
	{pos={408.5,990},spawn="zeta.script.obj.geemer"},
	{pos={405.5,994},spawn="zeta.script.obj.geemer"},
	{pos={405.5,993},spawn="zeta.script.obj.geemer"},
	{pos={411.5,996},spawn="zeta.script.obj.geemer"},
	{pos={411.5,995},spawn="zeta.script.obj.geemer"},
	{pos={400.5,997},spawn="zeta.script.obj.geemer"},
	{pos={396.5,999},spawn="zeta.script.obj.geemer"},
	{pos={392.5,1000},spawn="zeta.script.obj.geemer"},
	{pos={391.5,1003},spawn="zeta.script.obj.geemer"},
	{pos={392.5,1007},spawn="zeta.script.obj.geemer"},
	{pos={391.5,1012},spawn="zeta.script.obj.geemer"},
	{pos={413.5,1014},spawn="zeta.script.obj.geemer"},
	{pos={496.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={495.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={494.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={493.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={492.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={491.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={490.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={489.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={488.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={487.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={486.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={485.5,909},spawn="zeta.script.obj.redgeemer"},
	{pos={485.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={486.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={487.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={488.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={489.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={490.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={491.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={492.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={493.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={494.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={495.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={496.5,911},spawn="zeta.script.obj.redgeemer"},
	{pos={396.5,984},spawn="zeta.script.obj.geemer"},
	{pos={389.5,981},spawn="zeta.script.obj.geemer"},
	{pos={394.5,979},spawn="zeta.script.obj.geemer"},
	{pos={401.5,978},spawn="zeta.script.obj.geemer"},
	{pos={403.5,985},spawn="zeta.script.obj.geemer"},
	{pos={396.5,1013},spawn="zeta.script.obj.redgeemer"},
	{pos={396.5,1012},spawn="zeta.script.obj.redgeemer"},
	{pos={396.5,1011},spawn="zeta.script.obj.redgeemer"},
	{pos={396.5,1010},spawn="zeta.script.obj.redgeemer"},
	{pos={398.5,1006},spawn="zeta.script.obj.redgeemer"},
	{pos={398.5,1005},spawn="zeta.script.obj.redgeemer"},
	{pos={401.5,1006},spawn="zeta.script.obj.redgeemer"},
	{pos={401.5,1005},spawn="zeta.script.obj.redgeemer"},
	{pos={401.5,1004},spawn="zeta.script.obj.redgeemer"},
	{pos={401.5,1003},spawn="zeta.script.obj.redgeemer"},
	{pos={403.5,1003},spawn="zeta.script.obj.redgeemer"},
	{pos={403.5,1002},spawn="zeta.script.obj.redgeemer"},
	{pos={405.5,1005},spawn="zeta.script.obj.redgeemer"},
	{pos={405.5,1004},spawn="zeta.script.obj.redgeemer"},
	{pos={405.5,1003},spawn="zeta.script.obj.redgeemer"},
	{pos={405.5,1002},spawn="zeta.script.obj.redgeemer"},
	{pos={408.5,1003},spawn="zeta.script.obj.redgeemer"},
	{pos={408.5,1004},spawn="zeta.script.obj.redgeemer"},
	{pos={408.5,1005},spawn="zeta.script.obj.redgeemer"},
	{pos={408.5,1006},spawn="zeta.script.obj.redgeemer"},
	{pos={410.5,1013},spawn="zeta.script.obj.redgeemer"},
	{pos={410.5,1012},spawn="zeta.script.obj.redgeemer"},
	{pos={410.5,1011},spawn="zeta.script.obj.redgeemer"},
	{pos={410.5,1010},spawn="zeta.script.obj.redgeemer"},
	{pos={410.5,1009},spawn="zeta.script.obj.redgeemer"},
	{color={0,1,0,1},pos={417.5,910},spawn="zeta.script.obj.door"},
	{cells="2",pos={393.5,919},spawn="zeta.script.obj.cells"},
	{pos={544.5,1004},spawn="zeta.script.obj.savepoint"},
	{cells="2",pos={491.5,892},spawn="zeta.script.obj.cells"},
	{pos={489.5,986},spawn="zeta.script.obj.energytank"},
	{color={0,1,1,1},pos={544.5,912},spawn="zeta.script.obj.door"},
	{pos={545.5,1004},spawn="zeta.script.obj.energyrefill"},
	{pos={400.5,908},spawn="zeta.script.obj.energyrefill"},
	{pos={603.5,950},spawn="zeta.script.obj.missilelauncher"},
	{pos={605.5,950},spawn="zeta.script.obj.grenadelauncher"},
	{pos={607.5,950},spawn="zeta.script.obj.plasmarifle"},
	{pos={593.5,941},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,942},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,943},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,944},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,945},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,946},spawn="zeta.script.obj.grenadeitem"},
	{pos={593.5,947},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,947},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,946},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,945},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,944},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,943},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,942},spawn="zeta.script.obj.grenadeitem"},
	{pos={594.5,941},spawn="zeta.script.obj.grenadeitem"},
	{pos={599.5,941},spawn="zeta.script.obj.cells"},
	{pos={599.5,942},spawn="zeta.script.obj.cells"},
	{pos={599.5,943},spawn="zeta.script.obj.cells"},
	{pos={599.5,944},spawn="zeta.script.obj.cells"},
	{pos={599.5,945},spawn="zeta.script.obj.cells"},
	{pos={599.5,946},spawn="zeta.script.obj.cells"},
	{pos={599.5,947},spawn="zeta.script.obj.cells"},
	{pos={600.5,947},spawn="zeta.script.obj.cells"},
	{pos={600.5,946},spawn="zeta.script.obj.cells"},
	{pos={600.5,945},spawn="zeta.script.obj.cells"},
	{pos={600.5,944},spawn="zeta.script.obj.cells"},
	{pos={600.5,943},spawn="zeta.script.obj.cells"},
	{pos={600.5,942},spawn="zeta.script.obj.cells"},
	{pos={600.5,941},spawn="zeta.script.obj.cells"},
	{pos={430.5,956},spawn="zeta.script.obj.barrier"},
	{pos={437.5,956},spawn="zeta.script.obj.barrier"},
	{pos={447.5,956},spawn="zeta.script.obj.barrier"},
	{pos={454.5,956},spawn="zeta.script.obj.barrier"},
	{pos={430.5,949},spawn="zeta.script.obj.barrier"},
	{pos={437.5,949},spawn="zeta.script.obj.barrier"},
	{pos={447.5,949},spawn="zeta.script.obj.barrier"},
	{pos={454.5,949},spawn="zeta.script.obj.barrier"},
	{pos={429.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={431.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={430.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={437.5,909},spawn="zeta.script.obj.barrier"},
	{pos={447.5,909},spawn="zeta.script.obj.barrier"},
	{pos={454.5,909},spawn="zeta.script.obj.barrier"},
	{pos={447.5,903},spawn="zeta.script.obj.turret"},
	{pos={446.5,901},spawn="zeta.script.obj.barrier"},
	{pos={445.5,901},spawn="zeta.script.obj.barrier"},
	{pos={444.5,901},spawn="zeta.script.obj.barrier"},
	{pos={443.5,901},spawn="zeta.script.obj.barrier"},
	{pos={465.5,873},spawn="zeta.script.obj.barrier"},
	{pos={464.5,876},spawn="zeta.script.obj.turret"},
	{pos={464.5,872},spawn="zeta.script.obj.turret"},
	{pos={466.5,873},spawn="zeta.script.obj.barrier"},
	{pos={467.5,873},spawn="zeta.script.obj.barrier"},
	{pos={468.5,873},spawn="zeta.script.obj.barrier"},
	{pos={469.5,873},spawn="zeta.script.obj.barrier"},
	{pos={427.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={426.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={425.5,909},spawn="zeta.script.obj.barrier",timeOff=3,timeOn=1},
	{pos={463.5,872},spawn="zeta.script.obj.terminal",use="toggleDefenses()"},
	{pos={460.5,956},spawn="zeta.script.obj.turret"},
	{color={0,1,0,1},pos={416.5,982},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={416.5,910},spawn="zeta.script.obj.door"},
	{color={0,1,1,1},pos={545.5,912},spawn="zeta.script.obj.door"},
	{pos={537.5,873},spawn="zeta.script.obj.geemer"},
	{pos={559.5,870},spawn="zeta.script.obj.savepoint"},
	{pos={452.5,903},spawn="zeta.script.obj.redgeemer"},
	{pos={441.5,907},spawn="zeta.script.obj.geemer"},
	{pos={438.5,911},spawn="zeta.script.obj.geemer"},
	{pos={435.5,909},spawn="zeta.script.obj.geemer"},
	{pos={434.5,911},spawn="zeta.script.obj.geemer"},
	{pos={450.5,909},spawn="zeta.script.obj.geemer"},
	{pos={452.5,911},spawn="zeta.script.obj.geemer"},
	{pos={460.5,936},spawn="zeta.script.obj.geemer"},
	{pos={423.5,912},spawn="zeta.script.obj.geemer"},
	{pos={421.5,910},spawn="zeta.script.obj.geemer"},
	{pos={420.5,914},spawn="zeta.script.obj.geemer"},
	{pos={420.5,919},spawn="zeta.script.obj.geemer"},
	{pos={448.5,917},spawn="zeta.script.obj.redgeemer"},
	{pos={447.5,920},spawn="zeta.script.obj.redgeemer"},
	{pos={451.5,924},spawn="zeta.script.obj.redgeemer"},
	{pos={455.5,925},spawn="zeta.script.obj.redgeemer"},
	{pos={438.5,920},spawn="zeta.script.obj.redgeemer"},
	{pos={436.5,924},spawn="zeta.script.obj.redgeemer"},
	{pos={433.5,929},spawn="zeta.script.obj.redgeemer"},
	{pos={433.5,928},spawn="zeta.script.obj.redgeemer"},
	{pos={430.5,927},spawn="zeta.script.obj.redgeemer"},
	{pos={432.5,924},spawn="zeta.script.obj.redgeemer"},
	{pos={428.5,934},spawn="zeta.script.obj.redgeemer"},
	{pos={428.5,933},spawn="zeta.script.obj.redgeemer"},
	{pos={433.5,934},spawn="zeta.script.obj.redgeemer"},
	{pos={436.5,937},spawn="zeta.script.obj.redgeemer"},
	{pos={438.5,935},spawn="zeta.script.obj.redgeemer"},
	{pos={446.5,934},spawn="zeta.script.obj.redgeemer"},
	{pos={446.5,931},spawn="zeta.script.obj.redgeemer"},
	{pos={452.5,932},spawn="zeta.script.obj.redgeemer"},
	{pos={456.5,933},spawn="zeta.script.obj.redgeemer"},
	{pos={452.5,938},spawn="zeta.script.obj.redgeemer"},
	{pos={441.5,941},spawn="zeta.script.obj.redgeemer"},
	{pos={448.5,942},spawn="zeta.script.obj.redgeemer"},
	{pos={429.5,941},spawn="zeta.script.obj.redgeemer"},
	{pos={433.5,944},spawn="zeta.script.obj.redgeemer"},
	{pos={434.5,944},spawn="zeta.script.obj.redgeemer"},
	{pos={436.5,940},spawn="zeta.script.obj.redgeemer"},
	{pos={456.5,949},spawn="zeta.script.obj.geemer"},
	{pos={449.5,949},spawn="zeta.script.obj.geemer"},
	{pos={451.5,951},spawn="zeta.script.obj.geemer"},
	{pos={435.5,951},spawn="zeta.script.obj.geemer"},
	{pos={433.5,949},spawn="zeta.script.obj.geemer"},
	{pos={428.5,949},spawn="zeta.script.obj.geemer"},
	{pos={426.5,951},spawn="zeta.script.obj.geemer"},
	{pos={445.5,956},spawn="zeta.script.obj.geemer"},
	{pos={441.5,958},spawn="zeta.script.obj.geemer"},
	{pos={443.5,958},spawn="zeta.script.obj.geemer"},
	{pos={450.5,956},spawn="zeta.script.obj.geemer"},
	{pos={457.5,958},spawn="zeta.script.obj.geemer"},
	{pos={433.5,956},spawn="zeta.script.obj.geemer"},
	{pos={434.5,958},spawn="zeta.script.obj.geemer"},
	{pos={429.5,983},spawn="zeta.script.obj.geemer"},
	{pos={434.5,981},spawn="zeta.script.obj.geemer"},
	{pos={444.5,984},spawn="zeta.script.obj.geemer"},
	{pos={444.5,991},spawn="zeta.script.obj.geemer"},
	{pos={435.5,994},spawn="zeta.script.obj.geemer"},
	{pos={437.5,991},spawn="zeta.script.obj.geemer"},
	{pos={422.5,995},spawn="zeta.script.obj.geemer"},
	{pos={429.5,995},spawn="zeta.script.obj.geemer"},
	{pos={424.5,999},spawn="zeta.script.obj.geemer"},
	{pos={423.5,1002},spawn="zeta.script.obj.geemer"},
	{pos={425.5,1009},spawn="zeta.script.obj.geemer"},
	{pos={421.5,1014},spawn="zeta.script.obj.geemer"},
	{pos={429.5,1015},spawn="zeta.script.obj.geemer"},
	{pos={420.5,1017},spawn="zeta.script.obj.geemer"},
	{pos={460.5,1011},spawn="zeta.script.obj.redgeemer"},
	{pos={453.5,1014},spawn="zeta.script.obj.redgeemer"},
	{pos={451.5,1017},spawn="zeta.script.obj.redgeemer"},
	{pos={428.5,958},spawn="zeta.script.obj.geemer"},
	{pos={421.5,958},spawn="zeta.script.obj.geemer"},
	{pos={435.5,972},spawn="zeta.script.obj.geemer"},
	{pos={431.5,981},spawn="zeta.script.obj.geemer"},
	{pos={441.5,902},spawn="zeta.script.obj.redgeemer"},
	{pos={445.5,903},spawn="zeta.script.obj.geemer"},
	{pos={444.5,903},spawn="zeta.script.obj.geemer"},
	{pos={425.5,956},spawn="zeta.script.obj.terminal",text="Journal Entry:\nWhen mining in the crust of this planet we stumbled across a unique cave system.\nNot sure how they were formed.\nThe minerals seem to proceed through the caves.\nThe prospecting company is eager for us to follow."},
	{color={1,0,0,1},pos={416.5,949},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={417.5,949},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={350.5,927},spawn="zeta.script.obj.door"},
	{color={1,0,0,1},pos={349.5,927},spawn="zeta.script.obj.door"},
	{pos={441.5,857},spawn="zeta.script.obj.door"},
	{pos={442.5,857},spawn="zeta.script.obj.door"},
	{pos={409.5,837},spawn="zeta.script.obj.door"},
	{pos={410.5,837},spawn="zeta.script.obj.door"},
	{pos={409.5,889},spawn="zeta.script.obj.door"},
	{pos={410.5,889},spawn="zeta.script.obj.door"},
	{pos={393.5,892},spawn="zeta.script.obj.door"},
	{pos={394.5,892},spawn="zeta.script.obj.door"},
	{pos={317.5,927},spawn="zeta.script.obj.door"},
	{pos={318.5,927},spawn="zeta.script.obj.door"},
	{pos={317.5,943},spawn="zeta.script.obj.door"},
	{pos={318.5,943},spawn="zeta.script.obj.door"},
	{pos={425.5,803},spawn="zeta.script.obj.door"},
	{pos={426.5,803},spawn="zeta.script.obj.door"},
	{pos={419.5,941},spawn="zeta.script.obj.sawblade",travel={4,0}},
	{pos={423.5,937},spawn="zeta.script.obj.sawblade",travel={-4,0}},
	{pos={419.5,933},spawn="zeta.script.obj.sawblade",travel={4,0}},
	{pos={418.5,923},spawn="zeta.script.obj.sawblade",travel={6,6}},
	{pos={424.5,919},spawn="zeta.script.obj.sawblade",travel={-6,6}},
	{pos={418.5,915},spawn="zeta.script.obj.sawblade",timeOffset=0,travel={6,0},travelTime=2},
	{pos={418.5,914},spawn="zeta.script.obj.sawblade",timeOffset=0.10000000149012,travel={6,0},travelTime=2},
	{pos={418.5,913},spawn="zeta.script.obj.sawblade",timeOffset=0.20000000298023,travel={6,0},travelTime=2},
	{hidden=true,pos={496.5,875},spawn="zeta.script.obj.geemer"},
	{pos={505.5,873},spawn="zeta.script.obj.geemer"},
	{pos={518.5,875},spawn="zeta.script.obj.geemer"},
	{pos={519.5,875},spawn="zeta.script.obj.geemer"},
	{pos={520.5,875},spawn="zeta.script.obj.geemer"},
	{circuit="",pos={342.5,958},spawn="zeta.script.obj.turret"},
	{circuit="Red Security Level",pos={345.5,958},spawn="zeta.script.obj.turret"},
	{name="happy fun ball",pos={573.5,1004},spawn="zeta.script.obj.item",sprite="blaster-shot"},
	{drawScale={1,1},name="damaged sawblade",pos={462.5,957},spawn="zeta.script.obj.item",sprite="sawblade"},
	{pos={398.5,908},spawn="zeta.script.obj.savepoint"},
	{pos={610.5,941},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,941},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,942},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,942},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,943},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,943},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,944},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,944},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,945},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,945},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,946},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,946},spawn="zeta.script.obj.missileitem"},
	{pos={610.5,947},spawn="zeta.script.obj.missileitem"},
	{pos={611.5,947},spawn="zeta.script.obj.missileitem"},
	{pos={568.5,911},spawn="zeta.script.obj.terminal",use="local sawblade = player:findItemNamed'damaged sawblade'\nif not sawblade\nthen\n\9popup[[] fabrication facilities offline...]]\nelse\n\9popup[[looks like you could put together something to defend yourself...]]\n\9player:removeItem(sawblade).remove=true\n\9create'zeta.script.obj.skillsaw'{pos=self.pos+{2,0}}\nend"},
	{color={1,0.5,0.5,1},name="special rocks",pos={668.5,890},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={0.5,1,0.5,1},name="more special rocks",pos={635.5,822},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={1,1,0.5,1},name="even more special rocks",pos={637.5,851},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={581.5,852},spawn="zeta.script.obj.terminal",sprite="gato",text="MY NAME IS GATO\nI HAVE METAL JOINTS\nBEAT ME UP\nAND EARN 15 SILVER POINTS!"},
	{color={0.5,1,1,1},name="more candy",pos={559.5,854},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={429.5,854},spawn="zeta.script.obj.terminal",text="Technical Notes:\nThe defense AI and mineral surveying AI have got their wires crossed.\nSometimes triggering a positive in the survey code will deactivate the defenses.\nThis only occurs when you overload the survey AI with several mineral detections at once."},
	{pos={438.5,850},spawn="zeta.script.obj.grenadeitem"},
	{pos={436.5,850},spawn="zeta.script.obj.grenadeitem"},
	{pos={433.5,850},spawn="zeta.script.obj.grenadeitem"},
	{pos={429.5,850},spawn="zeta.script.obj.defensebonus"},
	{circuit="Mineral Processing",pos={415.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={416.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={417.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={418.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={419.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={420.5,834},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={420.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={419.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={418.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={417.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={416.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={415.5,837},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={415.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={416.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={417.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={418.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={419.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={420.5,840},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={420.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={419.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={418.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={417.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={416.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={415.5,843},spawn="zeta.script.obj.barrier"},
	{circuit="Mineral Processing",pos={414.5,835},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={414.5,837},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={414.5,839},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={414.5,841},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={414.5,843},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{circuit="Mineral Processing",pos={414.5,845},spawn="zeta.script.obj.sawblade",travel={7,0}},
	{bbox={max={0.5,12},min={-0.5,0}},name="main mining defense wall",pos={412.5,834},spawn="zeta.script.obj.solid"},
	{pos={429.5,834},spawn="zeta.script.obj.terminal",use="popup[[mineral surveying system ... scanning for minerals ...]]\nlocal names = table{'special rocks', 'more special rocks', 'even more special rocks', 'more candy', 'best candy ever', 'super special rocks', 'meh ok rocks'}\nlocal items = names:map(function(name,_,t)\n\9return player:findItemNamed(name) or nil, #t+1\nend)\nif #items == #names then\n\9popup[[Circuit Overload!]]\n\9toggleDefenses{\n\9\9circuit='Mineral Processing',\n\9\9value=false,\n\9}\n\9remove 'main mining defense wall'\n\9for _,item in ipairs(items) do\n\9\9player:removeItem(item).remove=true\n\9end\nelse\n\9popup[[No anomalies detected...]]\nend"},
	{color={0.5,0.5,1,1},name="best candy ever",pos={574.5,855},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={1,0.5,1,1},name="super special rocks",pos={527.5,838},spawn="zeta.script.obj.item",sprite="crystal"},
	{color={0.20000000298023,0.20000000298023,0.20000000298023,1},name="meh ok rocks",pos={554.5,818},spawn="zeta.script.obj.item",sprite="crystal"},
	{pos={640.5,814},spawn="zeta.script.obj.energytank"},
	{pos={593.5,774},spawn="zeta.script.obj.cells"},
	{color={1,0,1,1},pos={576.5,934},spawn="zeta.script.obj.door"},
	{color={1,0,1,1},pos={577.5,934},spawn="zeta.script.obj.door"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={424.5,975},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={421.5,978},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={466.5,1023},spawn="zeta.script.obj.trigger"},
	{create="removeGeemersIfBossNotKilled()",name="remove all geemers before the boss is killed",pos={465.5,919},spawn="zeta.script.obj.trigger"},
	{pos={651.5,789},spawn="zeta.script.obj.terminal",text="Now leaving the caves\nThat's all, folks!"},
	{pos={554.5,1004},spawn="base.script.obj.start"},
	{pos={541.5,884},spawn="zeta.script.obj.terminal",use="toggleDefenses 'Mine Exit Corridor'"},
	{circuit="Mine Exit Corridor",pos={543.5,872},spawn="zeta.script.obj.sawblade",timeOffset=3,travel={-67,0}},
	{circuit="Mine Exit Corridor",pos={543.5,876},spawn="zeta.script.obj.sawblade",timeOffset=3.0999999046326,travel={-67,0}},
	{create="toggleDefenses{\n\9circuit='Mineral Processing',\n\9value=true,\n\9silent=true\n}",pos={408.5,834},spawn="zeta.script.obj.trigger"},
	{pos={402.5,908},spawn="zeta.script.obj.terminal",text="The creatures have invaded the base.\nThe escape rocket has left without us.\nWe can't make a stand here.\nSome of the crew are thinking there might be safety somewhere in the caves..."},
	{color={1,0,0,1},pos={649.5,789},spawn="zeta.script.obj.keycard"},
	{pos={461.5,1017},spawn="zeta.script.obj.redgeemer"},
	{pos={573.5,934},spawn="zeta.script.obj.terminal",text="Weapon Storage Locker"},
	{pos={394.5,1017},spawn="zeta.script.obj.bat"},
	{pos={400.5,1017},spawn="zeta.script.obj.bat"},
	{pos={406.5,1017},spawn="zeta.script.obj.bat"},
	{pos={410.5,1017},spawn="zeta.script.obj.bat"},
	{pos={527.5,919},spawn="zeta.script.obj.bat"},
	{pos={532.5,918},spawn="zeta.script.obj.bat"},
	{pos={531.5,920},spawn="zeta.script.obj.bat"},
	{pos={535.5,919},spawn="zeta.script.obj.bat"},
	{pos={498.5,920},spawn="zeta.script.obj.zoomer"},
	{pos={498.5,918},spawn="zeta.script.obj.zoomer"},
	{pos={498.5,916},spawn="zeta.script.obj.zoomer"},
	{pos={514.5,921},spawn="zeta.script.obj.zoomer"},
	{pos={515.5,919},spawn="zeta.script.obj.zoomer"},
	{pos={517.5,917},spawn="zeta.script.obj.zoomer"},
	{pos={526.5,921},spawn="zeta.script.obj.zoomer"},
	{pos={524.5,919},spawn="zeta.script.obj.zoomer"},
	{pos={524.5,917},spawn="zeta.script.obj.zoomer"},
	{pos={411.5,1004},spawn="zeta.script.obj.zoomer"},
	{pos={412.5,1008},spawn="zeta.script.obj.zoomer"},
	{pos={413.5,1012},spawn="zeta.script.obj.zoomer"},
	{pos={396.5,1003},spawn="zeta.script.obj.zoomer"},
	{pos={392.5,1008},spawn="zeta.script.obj.zoomer"},
	{pos={391.5,1016},spawn="zeta.script.obj.zoomer"},
	{pos={568.5,933},spawn="zeta.script.obj.grenadeitem"},
	{pos={568.5,932},spawn="zeta.script.obj.grenadeitem"},
	{pos={568.5,934},spawn="zeta.script.obj.grenadeitem"},
	{pos={568.5,935},spawn="zeta.script.obj.grenadeitem"},
	{pos={568.5,936},spawn="zeta.script.obj.grenadeitem"},
	{pos={657.5,879},spawn="zeta.script.obj.redgeemer"},
	{pos={654.5,875},spawn="zeta.script.obj.redgeemer"},
	{pos={656.5,872},spawn="zeta.script.obj.redgeemer"},
	{pos={653.5,868},spawn="zeta.script.obj.redgeemer"},
	{pos={660.5,870},spawn="zeta.script.obj.redgeemer"},
	{pos={664.5,869},spawn="zeta.script.obj.redgeemer"},
	{pos={666.5,872},spawn="zeta.script.obj.redgeemer"},
	{pos={668.5,881},spawn="zeta.script.obj.redgeemer"},
	{pos={662.5,882},spawn="zeta.script.obj.redgeemer"},
	{pos={654.5,884},spawn="zeta.script.obj.redgeemer"},
	{pos={648.5,894},spawn="zeta.script.obj.redgeemer"},
	{pos={649.5,894},spawn="zeta.script.obj.redgeemer"},
	{pos={647.5,894},spawn="zeta.script.obj.redgeemer"},
	{pos={646.5,894},spawn="zeta.script.obj.redgeemer"},
	{pos={645.5,882},spawn="zeta.script.obj.redgeemer"},
	{pos={646.5,882},spawn="zeta.script.obj.redgeemer"},
	{pos={505.5,813},spawn="zeta.script.obj.savepoint"},
	{pos={586.5,850},spawn="zeta.script.obj.savepoint"},
	{pos={512.5,789},spawn="zeta.script.obj.savepoint"},
	{pos={650.5,789},spawn="zeta.script.obj.savepoint"},
	{pos={632.5,823},spawn="zeta.script.obj.teeth"},
	{pos={633.5,822},spawn="zeta.script.obj.teeth"},
	{pos={634.5,822},spawn="zeta.script.obj.teeth"},
	{pos={637.5,822},spawn="zeta.script.obj.teeth"},
	{pos={638.5,822},spawn="zeta.script.obj.teeth"},
	{pos={639.5,822},spawn="zeta.script.obj.teeth"},
	{pos={640.5,822},spawn="zeta.script.obj.teeth"},
	{pos={641.5,822},spawn="zeta.script.obj.teeth"},
	{pos={642.5,823},spawn="zeta.script.obj.teeth"},
	{pos={643.5,823},spawn="zeta.script.obj.teeth"},
	{pos={644.5,823},spawn="zeta.script.obj.teeth"},
	{pos={645.5,824},spawn="zeta.script.obj.teeth"},
	{pos={600.5,857},spawn="zeta.script.obj.zoomer"},
	{pos={616.5,849},spawn="zeta.script.obj.zoomer"},
	{pos={619.5,839},spawn="zeta.script.obj.zoomer"},
	{pos={630.5,855},spawn="zeta.script.obj.zoomer"},
	{pos={644.5,855},spawn="zeta.script.obj.zoomer"},
	{color={0,1,0,1},pos={480.5,909},spawn="zeta.script.obj.door"},
	{color={0,1,0,1},pos={481.5,909},spawn="zeta.script.obj.door"},
}