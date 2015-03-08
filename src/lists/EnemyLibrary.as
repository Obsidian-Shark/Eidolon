package lists
{
	import system.*;
	import templates.Entity;
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 */
	
	//Generate and plug data for all Boss characters of the game
	dynamic public class EnemyLibrary {
		
		// Returns an entity based of an enemy of a given name
		// Searches for the name in both the enemies and bosses list
		public static function getEnemy(enemyName:String):Entity {
			return new Entity(enemies[enemyName] || bosses[enemyName]);
		}
		
		// A list of enemy names followed by annonymous obejcts.
		// The aproch of having all the enemies in teh same file might not scale well but for now its fine
		private static var enemies = {
			
		}
				
		// Puting something in this list is exactly the same as putting it in enemies.
		// The two lists exist only for orginisational purposes
		private static var bosses = {
			Eidolon: {
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
			}
		}
		
	}
	
}