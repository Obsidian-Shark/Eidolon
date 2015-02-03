package system {
	
	import lists.*;
	import templates.*;
	import mx.utils.StringUtil;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 */
	
	public class BattleSys	{
		public static var playerTeam = [ new Entity, new Entity, new Entity];
		public static var enemyTeam = [ new Entity, new Entity, new Entity];
		public static var turnOrder:Array = new Array();
		public static var defaultTxt:String = "You are fighting {0}.\r";
		private static var parsedString:String = "";
		
		public function BattleSys() {
			//constructor code
		}
		
		//Loads the called encounter
		public static function loadEncounter(id:String):void {
			//flushEncounterData();
			Core.pc.loadCombat();
			switch(id) {
				case "Eidolon":
					BossLibrary.eidolon();
					var parsedString = StringUtil.substitute(defaultTxt, "Eidolon"); 
					Core.text.fightText(parsedString, true);
				break;
			}
			id = "";
			setTurns();
		}
		//Pushes entity objects into turn array if there is data in them
		private static function setTurns():void {
			// Gets all the active members of the teams then adds them to the turnOrder array.
			trace (turnOrder)
			trace (getActiveMembers(playerTeam).length + " " + getActiveMembers(enemyTeam).length)
			turnOrder = turnOrder.concat(getActiveMembers(playerTeam), getActiveMembers(enemyTeam));
			trace(turnOrder.length);
		}
		
		// Returns an array containing all the members of a team which are active
		public static function getActiveMembers(team) {
			var activeMembers = [];
			for (var i:int = 0; i < team.length; i += 1) {
				if (team[i].active) {
					activeMembers.push(team[i]);
				}
			}
			return activeMembers;
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
		//Kill the target and remove them from turn order
		public static function killTarget():void {
			
		}
		//End combat... only if all enemies are killed or PC is killed
		public static function endCombat():void {
			Core.screen.combat.resume.visible = true;
			//Disable combat buttons
			Core.screen.combat.attack.mouseEnabled = false;
			Core.screen.combat.skills.mouseEnabled = false;
			Core.screen.combat.magic.mouseEnabled = false;
			Core.screen.combat.flee.mouseEnabled = false;
		}
		
	}
	
}