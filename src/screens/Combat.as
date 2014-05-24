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
			//Set eventlisteners to the buttons
			attack.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.attack);
			
		}
		//Load up data when an encounter is triggered.
		public function startFight():void {
			//Push data into the Player display
			player.visible = true;
			player.label.text = "" + CombatAI.pc.name + "";
			player.HP.text = "" + CombatAI.pc.HP + "";
			player.MP.text = "" + CombatAI.pc.MP + "";
			player.SP.text = "" + CombatAI.pc.SP + "";
			//Load Enemy 1 data if present... it should be for fuck's sake
			if (CombatAI.e1.active) {
				enemy1.visible = true;
				enemy1.label.text = "" + CombatAI.e1.name +"";
				enemy1.HP.text = "" + CombatAI.e1.HP + "";
				enemy1.MP.text = "" + CombatAI.e1.MP + "";
				enemy1.SP.text = "" + CombatAI.e1.SP + "";
			}
			else {
				trace("Someone dun fucked up and forgot to put data into the e1 instance of Entity");
			}
		}
		//Refresh displays whenever HP, MP, & SP change
		public function refreshDisplays():void {
			player.HP.text = "" + CombatAI.pc.HP + "";
			player.MP.text = "" + CombatAI.pc.MP + "";
			player.SP.text = "" + CombatAI.pc.SP + "";
			enemy1.HP.text = "" + CombatAI.e1.HP + "";
			enemy1.MP.text = "" + CombatAI.e1.MP + "";
			enemy1.SP.text = "" + CombatAI.e1.SP + "";
		}
	}
	
}
