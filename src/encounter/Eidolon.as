package encounter {
	import system.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	public class Eidolon {
		
		public function Eidolon() {
			//constructor code
		}
		
		public static function loadEidolon():void {
			var EidolonEntity = BattleSys.enemyTeam[0];
			EidolonEntity.active = true;
			//Combat important stuff
			EidolonEntity.name = "Eidolon";
			EidolonEntity.maxHP = EidolonEntity.HP;
			EidolonEntity.maxMP = EidolonEntity.MP;
			EidolonEntity.maxSP = EidolonEntity.SP;
			EidolonEntity.HP = 9999;
			EidolonEntity.MP = 9999;
			EidolonEntity.SP = 9999;
			EidolonEntity.str = 999;
			EidolonEntity.endr = 999;
			EidolonEntity.dex = 999;
			EidolonEntity.agi = 999;
			EidolonEntity.wis = 999;
			//Assigned behavior
			EidolonEntity.behavior = "Aggressive";
			//Flavor text
			EidolonEntity.attackTxt = "\rEidolon swings its massive sword at {0} in an overhead arc with massive force.";
			EidolonEntity.defaultTxt = "\rEidolon towers over you, completely encased in pristine white armor and armed with a massive tower shield and an equally large sword. You can't see anything in the shadow of its visor but you can feel an intense stare focused on you.";
			EidolonEntity.dmgTxt = "\rEidolon flinches slightly against {1}'s attack, taking {0} damage.";			
		}
	}
	
}