package system {
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	public class Flags	{
		//ALL flag variables should be stored here... except anything related to achievements
		public var companionAI:Boolean = true; //True = Companions controlled by AI; False = Companions controlled by Player (combat only)
		
		public function Flags() {
			//constructor code
		}
		//Only call if you need to reset ALL flag data back to whatever their defaults are... this helps prevent glitches when starting a new game
		public function reset():void {
			
		}
		
	}
	
}