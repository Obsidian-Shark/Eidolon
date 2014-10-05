package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	public class Game extends MovieClip {
		
		public function Game() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the game screen... so shit works properly and what not
		private function initialize(e:Event):void {
			//Default button visibility... everything but the 12 buttons under the text display s hould be visible... oh, and the compass
			btn1.visible = false;
			btn2.visible = false;
			btn3.visible = false;
			btn4.visible = false;
			btn5.visible = false;
			btn6.visible = false;
			btn7.visible = false;
			btn8.visible = false;
			btn9.visible = false;
			btn10.visible = false;
			btn11.visible = false;
			btn12.visible = false;
			camp.visible = false;
			east.visible = false;
			menu.visible = true;
			north.visible = false;
			save.visible = true;
			south.visible = false;
			west.visible = false;
			//Disable all textfields so buttons are clickable... and no highlighting randomness
			//except for the main text display... that remains enabled so that cut/paste errors and bugs will be easier
			health.mouseEnabled = false;
			level.mouseEnabled = false;
			mana.mouseEnabled = false;
			pcName.mouseEnabled = false;
			stamina.mouseEnabled = false;
			//Default text labels
			health.text = "0";
			level.text = "0";
			mana.text = "0";
			menu.text.text = "Main Menu";
			pcName.text = "Player Name";
			save.text.text = "Save";
			stamina.text = "0";
			text.text = "Main text display";
			//Set eventlisteners to the buttons on screen
			menu.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toMain);
			portrait.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toProfile);
			Core.btn.initBtn();
		}
		public function refreshUI():void {
			health.text = "" + Core.pc.HP + "";
			level.text "" + Core.pc.level + "";
			mana.text = "" + Core.pc.MP +"";
			pcName.text = "" + Core.pc.name + "";
			stamina.text = "" + Core.pc.SP + "";
		}
	}
	
}
