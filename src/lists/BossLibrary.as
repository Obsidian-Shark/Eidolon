package lists
{
	
	import system.*;
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 */
	
	//Generate and plug data for all Boss characters of the game
	public class BossLibrary {
		
		public function BossLibrary() {
			//constructor code
		}
		
		//EIDOLON... test enemy for engine
		public static function eidolon():void {
			var EidolonEntity = BattleSys.enemyTeam[0];
			EidolonEntity.active = true;
			EidolonEntity.lvl = 99;
			//Combat important stuff
			EidolonEntity.name = "Eidolon";
			EidolonEntity.str = 115;
			EidolonEntity.endr = 160;
			EidolonEntity.dex = 35;
			EidolonEntity.agi = 12;
			EidolonEntity.wis = 25;
			EidolonEntity.maxHP = Math.round((EidolonEntity.endr * 10.5)*1);
			EidolonEntity.maxMP = Math.round((EidolonEntity.wis * 10.5)*1);
			EidolonEntity.maxSP = Math.round((EidolonEntity.endr + EidolonEntity.str * 2.5)*1);
			EidolonEntity.HP = EidolonEntity.maxHP;
			EidolonEntity.MP = EidolonEntity.maxMP;
			EidolonEntity.SP = EidolonEntity.maxSP;
			//Weaponize
			EidolonEntity.weapon1 = ItemLibrary.NdhgFang;
			EidolonEntity.weapon2 = ItemLibrary.IronTwr;
			//Assigned behavior
			EidolonEntity.behavior = "Aggressive";
			//Flavor text
			EidolonEntity.attackTxt = "{0} swings its massive sword in an overhead arc at {1}!";
			BattleSys.defaultTxt = "{0} towers over you, completely encased in pristine white armor and armed with a massive tower shield and an equally large sword. You can't see anything in the shadow of its visor but you can feel an intense stare focused on you.\r";
			//EidolonEntity.dmgTxt = "";
			//EidolonEntity.dodgeTxt = "";
		}
	}
	
}