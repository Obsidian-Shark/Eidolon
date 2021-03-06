﻿package system {
	
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
		public static function testMenu() {
			return {
				menu: {
					text: [
						"Welcome to the Eidolon Project, an Actionscript 3 focused tool to make constructing text adventure/RPGs games a bit easier. Feel free to test out any of Ediolon's programmed functions and get a feel for how it works on a visual level. \n\n",
						"Please note that much of the interface has been built in Flash CC itself and not 'designed' with the AS3 coding itself... but you are welcome to adapt this project to fit whatever purposes you need it for. \n\n",
						"*Currently, only Character (load a pre-set profile) and Town work.",
					],
					options: [
						{
							text: "Character",
							event: "preset"
						},
						{
							text: "Combat",
							event: "combat"
						},
						{
							text: "Dungeon",
							event: "dungeon"
						},
						{
							text: "Free-roam",
							event: "roamArea"
						},
						{
							text: "Town",
							event: "lorem.explore"
						}
					]
				},
				
				preset: {
					text: [
						"Select a profile to load."
					],
					options: [
						{
							text: "Caetus",
							event: "profileCaetus"
						},
						{
							text: "Baldr",
							event: "profileBaldr"
						},
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				
				profileCaetus: {
					loadCharacter: "caetus",
					text: [
						"Loaded profile Caetus",
					],
					options: [
						{
							text: "back",
							event: "preset"
						}
					]
				},
				
				profileBaldr: {
					loadCharacter: "baldr",
					text: [
						"Loaded profile Baldr",
					],
					options: [
						{
							text: "back",
							event: "preset"
						}
					]
				},
				
				combat: {
					text: "Combat demonstration is currently unavailable.",
					fight: {
						enemies: ["Eidolon"],
						win: "combatWin",
						loss: "combatLose"
					},
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				
				combatWin: {
					text: "You won. Cool!",
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				
				combatLose: {
					text: "You lost. Too bad.",
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				
				dungeon: {
					text: [
						"Dungeon demonstration is currently unavailable."
					],
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				roamArea: {
					text: [
						"Free-roam demonstration is currently unavailable."
					],
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				},
				town : {
					text: [
						"Lorem (text town) is currently unavailable."
					],
					options: [
						{
							text: "Return",
							event: "menu"
						},
					]
				}
			}
		}
		//Old code format
		//Kept for back-up purposes.
		public function testEngine(id:Number):void {
			Core.btn.flushBtns();
			eventID = id;
			if (id == 001) {
				Core.text.mainText("Welcome to the Eidolon Project, an Actionscript 3 focused tool to make constructing text adventure/RPGs games a bit easier. Feel free to test out any of Ediolon's programmed functions and get a feel for how it works on a visual level.\r", true);
				Core.text.mainText("\rPlease note that much of the interface has been built in Flash CC itself and not 'designed' with the AS3 coding itself... but you are welcome to adapt this project to fit whatever purposes you need it for.\r", false);
				Core.text.mainText("*to test Combat, be sure to load a pre-set character profile... else it won't work... or at least, it shouldn't work.\r", false);
				Core.btn.button(1, "Character", 002);
				Core.btn.button(2, "Combat", 003);
				Core.btn.button(3, "Dungeon", 0);
				Core.btn.button(4, "Free-roam", 0);
				Core.btn.button(5, "Town", 006);
			}
			if (id == 002) {
				Core.text.mainText("Which profile would you like to load?\r", true);
				Core.text.mainText("\rCeatus - a kind-hearted female Mer. Weak in strength but incredibly agile.", false);
				Core.text.mainText("\rBaldr - a powerful, selfish Human. High strength and endurance with moderate dodging ability.", false);
				Core.btn.button(1, "Caetus", 004);
				Core.btn.button(2, "Baldr", 005);
			}
			if (id == 003) {
				if (Core.pc.str == 0) {
					Core.text.mainText("\rCould not load combat. No player data loaded.\r", false);
				}
				else {
					eventID = 001;
					Core.screen.switchTo("Combat");
					BattleSys.loadEncounter(["Eidolon"]);
				}
			}
			if (id == 004) {
				testEngine(001);
				Core.text.mainText("\rLoaded Caetus profile.", false);
				Core.pc.loadCaetus();
				Core.screen.game.refreshUI();
			}
			if (id == 005) {
				testEngine(001);
				Core.text.mainText("\rLoaded Baldr profile.", false);
				Core.pc.loadBaldr();
				Core.screen.game.refreshUI();
			}
			//Load Void Director's interperter test
			if (id == 006) {
				Core.interpreter.interpret("lorem.explore");
			}
			trace("ID = " + id + "");
		}
		
	}
	
}