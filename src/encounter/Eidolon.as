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
			var EidolonEntity = CombatAI.enemyTeam[0];
			EidolonEntity.active = true;
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
			EidolonEntity.behavior = "Aggressive";
		}
		//Text for the encounter, triggered based on situation
		public static function flavorText(id:Number):void {
			//Default text
			if (id == 01) {
				Core.text.fightText("Eidolon towers over you, covered in a full suit of pristine white armor. A tower shield covers its left arm while a massive sword rests on its right shoulder, right hand wrapped around the handle. Though you can't see its face, you can feel it staring at you... waiting.", true);
			}
			//Targeting text
			//Attack text
		}
	}
	
}