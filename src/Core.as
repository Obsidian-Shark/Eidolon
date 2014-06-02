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
	*(ver. 1.01.00)... bug-squashing, feature changes and additions, etc. should be listed under here, inlcuding date started and date finished
	* CombatAI.as renamed to BattleSys.as
	* Void Director streamlined coding for the combat system... hooray!
	* 
	*/
	public class Core extends Sprite {
		public static var btn:Buttons = new Buttons();
		public static var combat:Combat = new Combat();
		public static var credit:Credits = new Credits();
		public static var event:Events = new Events;
		public static var flag:Flags = new Flags();
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