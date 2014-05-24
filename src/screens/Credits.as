package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	
	public class Credits extends MovieClip {
		
		
		public function Credits() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the credits screen so everything SHOULD work properly
		private function initialize(e:Event):void {
			//Default button visibility... should be true
			menu.visible = true;
			//Deactivate all textfields
			title.mouseEnabled = false;
			credits.mouseEnabled = false;
			//Defai;t text labels
			title.text = "Credits";
			credits.text = "Insert text here";
			menu.text.text = "Main Menu";
			//Set eventlisteners to the buttons on screen
			menu.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toMain);
		}
	}
	
}
