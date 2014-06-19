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
			CombatAI.e1.active = true;
			CombatAI.e1.name = "Eidolon";
			CombatAI.e1.maxHP = CombatAI.e1.HP;
			CombatAI.e1.maxMP = CombatAI.e1.MP;
			CombatAI.e1.maxSP = CombatAI.e1.SP;
			CombatAI.e1.HP = 9999;
			CombatAI.e1.MP = 9999;
			CombatAI.e1.SP = 9999;
			CombatAI.e1.str = 999;
			CombatAI.e1.endr = 999;
			CombatAI.e1.dex = 999;
			CombatAI.e1.agi = 999;
			CombatAI.e1.wis = 999;
			CombatAI.e1.behavior = "Aggressive";
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