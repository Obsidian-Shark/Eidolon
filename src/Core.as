package {
	import flash.events.DataEvent;
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
	
	//EIDOLON Version 1.06
	/*UPDATE & FIXES CHANGELOG
	 * Build was rolled back two versions (to 1.05 from 1.07) because combat became horribly broken
	 * Enabling data screen pop-up window
	 * Looting items has been setup (untested)
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
			this.addChild(screen);
			
			// Add serchable items for the parser to use.
			// These define objects that the parser can acess properties of
			parser.addSearchable(pc, "pc");
		}
	}
	
}