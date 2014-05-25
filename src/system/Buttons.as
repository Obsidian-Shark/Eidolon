package system {
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import system.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 * This class is, mainly, for grouping all the button functions together instead of spreading them out across all the screens... it makes bug fixing easier
	 * each function should be defined on what it does, most are only tied to one button.
	 */
	
	public class Buttons {
		//Numeric ID assignment for buttons... mainly tied to eventhandling <designed by Void Director>
		public var btnID:Array = new Array();
		
		public function Buttons() {
			//constructor code
		}
		
		//Master button assignment for Game screen... and by master, I mean it controls the array of buttons under the text display <designed by Void Director>
		public function button(btnNum:int, label:String, eventID:Number):void {
			Core.screen.game["btn" + btnNum].visible = true;
			Core.screen.game["btn" + btnNum].text.text = label;
			btnID[btnNum - 1] = eventID;
		}
		//Flush button data to prevent glitches and errors <designed by Void Director>
		public function flushBtns():void {
			for (var i:int = 0; i < 15; i += 1) {
				//Default the button visibility to false
				Core.screen.game["btn" + (i + 1)].visible = false;
				//Flush the btnID array
				btnID[i] = 0;
			}
		}
		//Initialize the button array on Game screen
		public function initBtn():void {
			for (var i:int = 0; i < 12; i ++) {
				var btnEventHandler:Function = onClick(i)
				function onClick(btnNumber:int):Function {
					return function(e:MouseEvent):void {
						if (btnID[btnNumber] == 0) {
							Core.text.mainText("No assignment.\r", false);
							return;
						}
						Core.event.eventID = btnID[btnNumber];
						Core.event.testEngine(Core.event.eventID);
					};
				}
				Core.screen.game["btn" + (i + 1)].addEventListener(MouseEvent.MOUSE_DOWN, btnEventHandler);
			}
		}
		//Start a new game... be sure to flush previous data to avoid errors (data flush should be a separate function or however you know how to do it)
		public function newGame(e:MouseEvent):void {
			Core.screen.switchTo("Game");
			Core.event.testEngine(001);
		}
		//Go to the Credits menu
		public function toCredits(e:MouseEvent):void {
			Core.screen.switchTo("Credits");
		}
		//Go to Game screen
		public function toGame(e:MouseEvent):void {
			Core.screen.switchTo("Game");
			Core.event.testEngine(001);
			trace("eventID = " +Core.event.eventID+"");
		}
		//Go to the Main menu
		public function toMain(e:MouseEvent):void {
			Core.screen.switchTo("MainMenu");
		}
		//Go to the Options menu
		public function toOptions(e:MouseEvent):void {
			Core.screen.switchTo("Options");
		}
		//Go to the Profile menu... this should only be attached to the Player's profile icon in the Game screen
		public function toProfile(e:MouseEvent):void {
			Core.screen.switchTo("Profile");
		}
		//Select a target if there are multiple enemies
		public function pickTarget(e:MouseEvent):void {
			
		}
		//Attack a target
		public function attack(e:MouseEvent):void {
			//If there are multiple targets, switch on the ability to select a target
			if (CombatAI.getActiveMembers(CombatAI.enemyTeam).length > 1) {
				Core.text.fightText("Who do wish to target?", true);
				for (var i:int =1; i < 4; i += 1) {
					Core.screen.combat["e" + i + "Target"].addEventListener(MouseEvent.MOUSE_DOWN, pickTarget);
				}
				
			}
			//if single enemy, automatically target and attack
			else {
				CombatAI.playerTeam[0].manualAttack(CombatAI.enemyTeam[0]);
			}
		}
		
	}
	
}