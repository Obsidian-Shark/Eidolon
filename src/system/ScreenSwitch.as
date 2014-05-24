package system {
	import screens.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ObsidianShark
	 * @author Thomas Griffin (Tutorial) <http://code.tutsplus.com/tutorials/handling-screen-architecture-the-painless-way--active-4584>
	 */
	
	public class ScreenSwitch extends Sprite {
		private var currScreen:String = "";
		public var combat:Combat;
		public var credit:Credits;
		public var game:Game;
		public var main:MainMenu;
		public var option:Options;
		public var profile:Profile;
		private var screenLayer:Sprite = new Sprite();
		
		public function ScreenSwitch() {
			//constructor code
			this.addChild(screenLayer);
			main = new MainMenu();
			screenLayer.addChild(main);
			
		}
		public function switchTo(screenID:String): void {
			currScreen = screenID;
			switchScreens();
			trace("Screen switched");
		}
		private function switchScreens(): void {
			flushOldScreen();
			loadScreen();
		}
		private function flushOldScreen(): void {
			var oldScreen:MovieClip;
			oldScreen = screenLayer.getChildAt(0) as MovieClip;
			screenLayer.removeChild(oldScreen);
		}
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