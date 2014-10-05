package system {
	import screens.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ObsidianShark
	 * @author Thomas Griffin (Tutorial) <http://code.tutsplus.com/tutorials/handling-screen-architecture-the-painless-way--active-4584>
	 */
	
	public class ScreenHandler extends Sprite {
		private var currScreen:String = "";
		private var popScreen:String = "";
		public var combat:Combat;
		public var credit:Credits;
		public var data:Data;
		public var game:Game;
		public var main:MainMenu;
		public var option:Options;
		public var profile:Profile;
		private var screenLayer:Sprite = new Sprite();
		private var screenOverlay:Sprite = new Sprite();
		
		public function ScreenHandler() {
			//constructor code
			this.addChild(screenLayer);
			main = new MainMenu();
			screenLayer.addChild(main);
			
		}
		//Switches to the called screen
		public function switchTo(screenID:String): void {
			currScreen = screenID;
			switchScreens();
			trace("Screen switched");
		}
		//Loads the called pop-up screen
		public function toPopScreen(screenID:String):void {
			popScreen = screenID;
			loadPopScreen();
			trace("Load pop screen");
		}
		//Bridge between the command function and the screen switch list (excluding pop-up screens)
		//also triggers the function to delete the current screen from the display list
		private function switchScreens(): void {
			flushOldScreen();
			loadScreen();
		}
		//Bridge between command function and the pop screen switch list
		private function loadPopScreen():void {
			popScrn();
		}
		//Removes the previous screen from the display list
		private function flushOldScreen(): void {
			var oldScreen:MovieClip;
			oldScreen = screenLayer.getChildAt(0) as MovieClip;
			screenLayer.removeChild(oldScreen);
		}
		//Removes the pop-up screen from the display list... the pop screen SHOULD be at 1 in the display list in the array. If not... something dun goofed.
		public function closePopScreen(): void {
			var oldScreen:MovieClip;
			oldScreen = screenLayer.getChildAt(1) as MovieClip;
			screenLayer.removeChild(oldScreen);
		}
		//Switch list for pop-up screens
		//Be sure to add coordinates so they don't appear in stupid places
		private function popScrn(): void {
			switch(popScreen) {
				case "Data":
					data = new Data();
					screenLayer.addChild(data);
					data.x = 150;
					data.y = 75;
				break;
			}
			popScreen = "";
		}
		//Switch list for normal game screens
		private function loadScreen(): void {
			switch(currScreen) {
				case "Combat":
					combat = new Combat();
					screenLayer.addChild(combat);
				break;
				case "Credits":
					credit = new Credits();
					screenLayer.addChild(credit);
				break;
				case "Game":
					game = new Game();
					screenLayer.addChild(game);
				break;
				case "MainMenu":
					main = new MainMenu();
					screenLayer.addChild(main);
				break;
				case "Options":
					option = new Options();
					screenLayer.addChild(option);
				break;
				case "Profile":
					profile = new Profile();
					screenLayer.addChild(profile);
				break;
				default:
					main = new MainMenu();
					screenLayer.addChild(main);
				break;
			}
			currScreen = "";
		}
	}
	
}