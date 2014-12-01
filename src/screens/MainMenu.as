package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Obsidian shark
	 */	
	
	public class MainMenu extends MovieClip {
		
		
		public function MainMenu() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Initial set-up of the main menu screen so everything SHOULD work
		private function initialize(e:Event):void {
			//Default button visibily... should be true since this is the first screen seen when booting up the game
			//gameResume & gameLoad should be defaulted to false unless the game detects save data
			credits.visible = true;
			gameLoad.visible = false;
			gameNew.visible = true;
			gameResume.visible = false;
			options.visible = true;
			//Deactivate all textfields
			title.mouseEnabled = false;
			version.mouseEnabled = false;
			//Default text labels
			title.text = "Eidolon";
			credits.text.text = "Credits";
			gameLoad.text.text = "Load";
			gameNew.text.text = "New Game";
			gameResume.text.text = "Resume";
			options.text.text = "Options";
			version.text = "Version 01.07.00";
			//Set eventlisteners to the buttons on screen
			credits.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toCredits);
			gameNew.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.newGame);
			options.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toOptions);
		}
	}
	
}
