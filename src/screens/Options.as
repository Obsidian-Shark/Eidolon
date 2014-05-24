package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	
	public class Options extends MovieClip {
		
		
		public function Options() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the options menu screen so everything SHOULD work
		private function initialize(e:Event):void {
			//Default button visibily... should be true for all the options available to dick around with
			option1.visible = true;
			option2.visible = true;
			option3.visible = true;
			option4.visible = true;
			option5.visible = true;
			menu.visible = true;
			//Deactivate all textfields so the buttons are clickable... and no accidental and annoying highlight
			category1.mouseEnabled = false;
			title.mouseEnabled = false;
			//Default text labels
			category1.text = "Category 1";
			title.text = "Options";
			option1.text.text = "Option 1";
			option2.text.text = "Option 2";
			option3.text.text = "Option 3";
			option4.text.text = "Option 4";
			option5.text.text = "Option 5";
			menu.text.text = "Main Menu";
			//Set eventlisteners to the buttons on screen
			menu.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toMain);
		}
	}
	
}
