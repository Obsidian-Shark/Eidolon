package {
	
	import misc.*;
	import screens.*;
	import system.*;
	import flash.display.MovieClip;
	import flash.display.Sprite
	
	//DEVELOPER CREDITS (in general)
	/**
	 * ...
	 * @author ObsidianShark <aphrosiadev@gmail.com>
	 * @author Void Director
	 * @author Pako
	 * help from Kongregate's developer forums
	 * various online tutorials of varying sources
	 */
	
	//EIDOLON Version 1.07
	/*UPDATE & FIXES CHANGELOG
	 * Switching between screens with an active game has a scene tracking issue. Resolving soon.
	 * Need to re-add loading preset Player profiles
	 * Work on adding & removing items from Player inventory as well as use of currency.
	 * 
	*/
	
	public class Core extends Sprite {
		public static var interpreter:Interpreter = new Interpreter();
		public static var parser:Parser = new Parser();
		public static var btn:Buttons = new Buttons();
		public static var event:Events = new Events;
		public static var flag:Flags = new Flags();
		public static var flags = {};
		public static var pc:Player = new Player();
		public static var screen:ScreenHandler = new ScreenHandler();
		public static var text:Text = new Text();
		
		public function Core() {
			//constructor code
			this.addChild(screen);
			
			// Add serchable items for the parser to use.
			// These define objects that the parser can acess properties of
			parser.addSearchable(pc, "pc");
		}
	}
	
}