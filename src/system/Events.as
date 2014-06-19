package system {
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	public class Events	{
		public var eventID:Number = 0;
		
		public function Events() {
			//constructor code
		}
		//This is the menu for testing various aspects of the Eidolon engine
		public function testEngine(id:Number):void {
			eventID = id;
			if (id == 001) {
				Core.text.mainText("Welcome to the Eidolon Project, an Actionscript 3 focused tool to make constructing text adventure/RPGs games a bit easier. Feel free to test out any of Ediolon's programmed functions and get a feel for how it works on a visual level.\r", true);
				Core.text.mainText("\rPlease note that much of the interface has been built in Flash CC itself and not 'designed' with the AS3 coding itself... but you are welcome to adapt this project to fit whatever purposes you need it for.\r", false);
				Core.text.mainText("*to test Combat, be sure to load the pre-set character profile... else it won't work... or at least, it shouldn't work.\r", false);
				Core.btn.button(1, "Character", 002);
				Core.btn.button(2, "Combat", 003);
				Core.btn.button(3, "Dungeon", 0);
				Core.btn.button(4, "Free-roam", 0);
				Core.btn.button(5, "Town", 4);
			}
			if (id == 002) {
				Core.text.mainText("You have loaded the pre-set character profile, Caetus.\r", true);
				loadPlayer();
				Core.screen.game.refreshUI();
			}
			if (id == 003) {
				if (Core.pc.str == 0) {
					Core.text.mainText("\rCould not load combat. No player data loaded.\r", false);
				}
				else {
					Core.screen.switchTo("Combat");
					CombatAI.loadEncounter("Eidolon");
				}
			}
			if (id == 004) {
				Core.interpreter.interpret("tyrRuins.explore");
			}
			trace("eventID = " + eventID + "");
		}
		//Load character data
		public function loadPlayer():void {
			Core.pc.name = "Ceatus";
			Core.pc.level = 99;
			Core.pc.str = 999;
			Core.pc.endr = 999;
			Core.pc.dex = 999;
			Core.pc.agi = 999;
			Core.pc.wis = 999;
			Core.pc.chrs = 999;
			Core.pc.maxHP = Core.pc.endr * 2.5;
			Core.pc.maxMP = Core.pc.wis * 2.5;
			Core.pc.maxSP = Core.pc.dex * 2.5;
			Core.pc.HP = Core.pc.maxHP;
			Core.pc.MP = Core.pc.maxMP;
			Core.pc.SP = Core.pc.maxSP;
			trace("Profile Caetus has been loaded into Player.as");
		}
		
	}
	
}