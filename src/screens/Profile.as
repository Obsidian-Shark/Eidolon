package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */	
	
	public class Profile extends MovieClip {
		
		
		public function Profile() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the profile screen... so shit works properly. Character viewer might make this a little tricky
		private function initialize(e:Event):void {
			//Default button visibility
			arousal.visible = true;
			clothes.visible = true;
			equip.visible = true;
			resume.visible = true;
			//Disable all textfields so buttons are clickable... and no highlighting nonsense
			gender.mouseEnabled = false;
			level.mouseEnabled = false;
			pcName.mouseEnabled = false;
			rank.mouseEnabled = false;
			//Default text labels
			equip.text.text = "Equip";
			resume.text.text = "Resume";
			gender.text = "None";
			level.text = "Level: 1";
			rank.text = "Commoner";
			//Set eventlisteners to the buttons on screen
			resume.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toGame);
		}
	}
	
}
