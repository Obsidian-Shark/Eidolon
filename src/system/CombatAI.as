package system {
	import flash.events.ActivityEvent;
	import templates.*;
	import encounter.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 */
	
	public class CombatAI	{
		public static var pc:Entity = new Entity;
		public static var c1:Entity = new Entity;
		public static var c2:Entity = new Entity;
		public static var e1:Entity = new Entity;
		public static var e2:Entity = new Entity;
		public static var e3:Entity = new Entity;
		
		private static var turnOrder:Array = new Array();
		
		public function CombatAI() {
			//constructor code
		}
		
		public static function loadEncounter(id:String):void {
			//flushEncounterData();
			Core.pc.loadCombat();
			switch(id) {
				case "Eidolon":
					Eidolon.loadEidolon();
					Eidolon.flavorText(001);
				break;
			}
			id = "";
			Core.screen.combat.startFight();
			setTurns();
		}
		//Pushes entity objects in turn array if there is data in them
		private static function setTurns():void {
			if (e1.active) turnOrder.push(e1);
		}
		//Designed by Void Director to set turn order and cycle through turns.
		public static function runAllTurns():void {
			//Sorts turn order by agility score... though Player always goes first
			turnOrder.sortOn("agi", Array.DESCENDING | Array.NUMERIC);
			//Run each entity's turn in the set order
			for (var i:int; i < turnOrder.length; i++) {
				turnOrder[i].runTurn();
			}
			trace(turnOrder);
		}
		//Kill the target and remove them from turn order... unless PC, then end the encounter
		public static function killPC():void {
			Core.text.fightText("You fall to your knees, defeated", true);
		}
		//Remove enemy from turn array if HP has been reduced to 0
		//public static function killEnemy():void {
			//var enemy:Entity;
			//for (var i:int = 1; i < 4; i += 1) {
				//enemy = this["enemy" + i];
				//if (enemy.HP <= 0) {
					//this.turnOrder.splice(this.turnOrder.indexOf(enemy));
				//}
			//}
		//}
		//Remove companion from turn array if HP has been reduced to 0
		//private function companionKill():void {
			//var companion:Entity;
			//for (var i:int = 1; i < 4; i += 1) {
				//companion = this["companion" + i];
				//if (companion.HP <= 0) {
					//this.turnOrder.splice(this.turnOrder.indexOf(companion));
				//}
			//}
		//}
		
	}
	
}