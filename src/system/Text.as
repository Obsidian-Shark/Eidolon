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
		
		public function clearText ():void {
			outputText = "";
			Core.screen.game.text.htmlText = outputText;
			Core.screen.game.scrollBar1.update();
		}
		
		public function addText (text:String):void {
			outputText = outputText + text;
			Core.screen.game.text.htmlText = outputText;
			Core.screen.game.scrollBar1.update()
		}
		//This is the function for the text display on the Game screen
		public function mainText(text:String, reset:Boolean):void {
			if (reset == false) outputText = outputText + text;
			else outputText = text;
			Core.screen.game.text.htmlText = outputText;
			//update the scroll bar
			Core.screen.game.scrollBar1.update();
		}
		//Text display for combat
		public function fightText(text:String, reset:Boolean):void {
			if (reset == false) outputText = outputText + text;
			else outputText = text;
			Core.screen.combat.text.htmlText = outputText;
		}
	}
	
}