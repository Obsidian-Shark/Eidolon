package lists
{
	import system.*;
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 */
	
	//Generate and plug data for all Boss characters of the game
	dynamic public class EnemyLibrary {
				
		public function EnemyLibrary() {
			//constructor code
		}		
		//containers for encounter data
		public static var Eidolon = {
			name:"Eidolon",
			lvl:99,
			active:true,
			str:115,
			endr:160,
			dex:35,
			agi:12,
			wis:25,
			weapon1:ItemLibrary.NdhgFang,
			weapon2:ItemLibrary.IronTwr,
			behavior:"Aggressive",
			attackTxt:"{0} swings its massive sword in an overhead arc at {1}!",
			defaultTxt:"{0} towers over you, completely encased in pristine white armor and armed with a massive tower shield and an equally large sword. You can't see anything in the shadow of its visor but you can feel an intense stare focused on you.\r"
			//dmgTxt:"";
			//dodgeTxt:"";
		};
		
	}
	
}