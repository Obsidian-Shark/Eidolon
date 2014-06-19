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
	 * @author VoidDirector
	 * @author Pako
	 * help from Kongregate's developer forums
	 * various online tutorials of varying sources
	 */
	
	//EIDOLON Version 1.00
	//The code-base has a name now
	/*UPDATE & FIXES CHANGELOG
	*(ver. 1.00.00)... bug-squashing, feature changes and additions, etc. should be listed under here, inlcuding date started and date finished
	* Framework overhaul started -- 4/5/14
	* New UI design started -- 4/6/14 <concepts can be found in the image folder>
	* FLA file created -- 4/11/14
	* Added Options & Credits Screens -- 4/22/14
	* Added Flags.as -- 4/24/14
	* Added Event.as -- 4/25/14
	* Added in Combat files and screen -- 4/30/14
	* Attacking a target (for the Player) now works but needs refinement -- 5/10/14
	* Programing behavior AIs for enemys started -- 5/19/14 
	* 
	*/
	public class Core extends Sprite {
		public static var interpreter:Interpreter = new Interpreter();
		public static var btn:Buttons = new Buttons();
		public static var combat:Combat = new Combat();
		public static var credit:Credits = new Credits();
		public static var event:Events = new Events;
		public static var flag:Flags = new Flags();
		public static var flags = {};
		public static var game:Game = new Game();
		public static var main:MainMenu = new MainMenu();
		public static var option:Options = new Options();
		public static var profile:Profile = new Profile();
		public static var pc:Player = new Player();
		public static var screen:ScreenSwitch = new ScreenSwitch();
		public static var text:Text = new Text();
		
		public function Core() {
			//constructor code
			this.addChild(screen);
		}
	}
	
}