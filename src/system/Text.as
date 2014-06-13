package system {
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * Adapted from function set-up in Fenoxo's UTG
	 */
	public class Text	{
		public var outputText:String = "";
		
		public function Text() {
			//constructor code
		}
		//This is the function for the text display on the Game screen
		public function mainText(text:String, reset:Boolean):void {
			if (reset == false) outputText = outputText + text;
			else outputText = text;
			Core.screen.game.text.htmlText = outputText;
			//update the scroll bar
			Core.screen.game.scrollBar1.update();
		}
		//Text display for encounter flavor whatnots
		public function flavText(text:String, reset:Boolean):void {
			if (reset == false) outputText = outputText + text;
			else outputText = text;
			Core.screen.combat.text.htmlText = outputText;
		}
		//Text display for combat
		public function fightText(text:String, reset:Boolean):void {
			if (reset == false) outputText = outputText + text;
			else outputText = text;
			Core.screen.combat.text2.htmlText = outputText;			
		}
	}
	
}