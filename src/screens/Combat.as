package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	import system.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	
	public class Combat extends MovieClip {
		
		
		public function Combat() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the combat screen... so shit works properly.
		private function initialize(e:Event):void {
			//Default UI visibily
			attack.visible = true;
			flee.visible = true;
			magic.visible = true;
			resume.visible = false;
			skills.visible = true;
			player.visible = false;
			companion1.visible = false;
			companion2.visible = false;
			enemy1.visible = false;
			enemy2.visible = false;
			enemy3.visible = false;
			e1Target.visible = false;
			e2Target.visible = false;
			e3Target.visible = false;
			//Button labels
			attack.text.text = "Attack";
			flee.text.text = "Flee";
			magic.text.text = "Spells";
			resume.text.text = "Continue";
			skills.text.text = "Skills";
			text2.text = "";
			//Set eventlisteners to the buttons
			attack.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.attack);
			resume.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toGame);
		}
		//Load up data when an encounter is triggered.
		public function startFight():void {
			var allEntities = [].concat(BattleSys.playerTeam, BattleSys.enemyTeam);
			var allDisplays = [player, companion1, companion2, 
							  enemy1, enemy2, enemy3];
			//Push data into all displays
			for (var i:int = 0; i < allDisplays.length; i += 1) {
				// if an entity is active draw its data to thes screen
				if (allEntities[i].active) {
					allDisplays[i].visible = true;
					allDisplays[i].label.text = "" + allEntities[i].name + "";
				}
			}
			// Push all the data that changs over time to the display
			updateDisplay();
		}
		//Refresh displays whenever HP, MP, & SP change
		public function refreshDisplays():void {
			updateDisplay();
		}
		
		private function updateDisplay(): void {
			var allEntities = [].concat(BattleSys.playerTeam, BattleSys.enemyTeam),
				allDisplays = [player, companion1, companion2, 
							  enemy1, enemy2, enemy3];
			//Push data into all displays
			for (var i:int = 0; i < allDisplays.length; i += 1) {
				// if an entity is active draw its data to thes screen
				if (allEntities[i].active) {
					allDisplays[i].HP.text = "" + allEntities[i].HP + "";
					allDisplays[i].MP.text = "" + allEntities[i].MP + "";
					allDisplays[i].SP.text = "" + allEntities[i].SP + "";
				}
			}
		}
	}
	
}
