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
		public static function loadEncounter(enemies:Array):void {
			//flushEncounterData();
			Core.pc.loadCombat();
			for (var i = 0; i < enemies.length; i += 1) {
				enemyTeam[i] = EnemyLibrary.getEnemy(enemies[i]);
			}
			/*
			switch(id) {
				case "Eidolon":
					BossLibrary.eidolon();
					var parsedString = StringUtil.substitute(defaultTxt, "Eidolon"); 
					Core.text.fightText(parsedString, true);
				break;
			}
			*/
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
		
		private static var onWin:Function;
		private  static var onLoss:Function;
		public static function setEnd(win:Function, loss:Function):void {
			onWin = win;
			onLoss = loss;
		}
		

		private static function isTeamDefeated(team:Array):Boolean {
			for( var i:int = 0; i < team.length; i += 1) {
				if (team[i].active) {
					return false;
				}
			}
			return true;
		}
		
		// Check if the game is over and if so which team has won
		public static function checkEnd():void {			
			// Check if all the entities on either team have been defeated. Player loses on ties
			if (isTeamDefeated(playerTeam)) {
				endCombat(false);
			} else if (isTeamDefeated(enemyTeam)) {
				endCombat(true);
			}
		}
		
		//End combat... only if all enemies are killed or PC is killed
		public static function endCombat(playerWon:Boolean):void {
			Core.screen.combat.resume.visible = true;
			//Disable combat buttons
			Core.screen.combat.attack.mouseEnabled = false;
			Core.screen.combat.skills.mouseEnabled = false;
			Core.screen.combat.magic.mouseEnabled = false;
			Core.screen.combat.flee.mouseEnabled = false;
			if (playerWon) {
				Core.text.fightText("You won.");
				onWin();
			} else {
				Core.text.fightText("You were defeated.");
				onLoss();
			}
		}
		
	}
	
}