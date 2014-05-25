package templates
{
	import system.*;

	/**
	 * ...
	 * @author Obsidian Shark...
	 * @author Void Director...
	 */

	dynamic public class Entity{;
	public var active:Boolean = false;
	public var name:String = "";
	public var maxHP:Number = 0;
	public var maxMP:Number = 0;
	public var maxSP:Number = 0;
	public var HP:Number = 0;
	public var MP:Number = 0;
	public var SP:Number = 0;
	public var str:Number = 0;
	public var endr:Number = 0;
	public var dex:Number = 0;
	public var agi:Number = 0;
	public var wis:Number = 0;
	//This string labels what AI behavior the Entity should be running on
	public var behavior:String = "";

	public function Entity()
	{
		//constructor code
	}
	//Runs Entity's turn
	public function runTurn():void
	{
		if (behavior == "Aggressive")
		{
			aggressive();
		}
		trace("run "+this.name+"'s turn");
	}
	//AI BEHAVIORS
	//Each function should control particular behaviors depending on focus
	public function aggressive():void
	{
		//Aggressive enemies will always target the character with highest health amd focus on physical damage and abilities
		var targets:Array = CombatAI.getActiveMembers(CombatAI.playerTeam);
		trace("Array length = " + targets.length + "");
		
		//Sorts available targets in array by their current HP
		targets.sortOn("HP", Array.DESCENDING | Array.NUMERIC);
		trace(this.name + " targets " + targets[0].name);
		//Select target and attack them;
		autoAttack(targets[0]);
		trace("" + targets);
		trace(targets[0].name);
	}
	//AI uses this function for attacking;
	public function autoAttack(target:Entity):void
	{
		Core.text.fightText("\r" + this.name + " launches an attack at " + target.name + "!", false);
		dealDamage(this.str, target);
		trace("" + this.name + " attacks!");
	}
	//Used by Player for attacking
	public function manualAttack(target:Entity):void
	{
		Core.text.fightText("\r\rYou launch an attack at " + target.name + "!", false);
		dealDamage(this.str, target);
		CombatAI.runAllTurns();
	}
	//Dodge check... to be added later
	//Deal damage...duh
	public function dealDamage(amount:Number, target:Entity):void
	{
		target.HP -=  amount;
		Core.text.fightText("\r" + target.name + " takes " + amount + " points of damage", false);
		if (target.HP <= 0)
		{
			target.HP = 0;
			CombatAI.killPC();
		}
		Core.screen.combat.refreshDisplays();
		trace("" +target.name + " takes " + amount + " points of damage");
	}
	//Healing... though there's no spell system right now.
	private function heal(target:Entity):void
	{

	}

}

}