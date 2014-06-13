package templates
{
	import system.*;
	import mx.utils.*;

	/**
	 * ...
	 * @author Obsidian Shark...
	 * @author Void Director...
	 */

	dynamic public class Entity {
	public var active:Boolean = false;
	public var lvl:Number
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
	//Flavor text for combat... this should be all the default text
	public var abilityTxt:String = "";
	public var attackTxt:String = "{0} attacks {1}!";
	public var blockTxt:String = "{0} blocks {1}'s attack, nullifying any potential damage.";
	public var defeatTxt:String = "{0} defeats {1}!.";
	public var dodgeTxt:String = "{0} dodges {1}'s attack!";
	public var dmgTxt:String = "{0} takes {1} points of damage.";
	public var parryTxt:String = "{0} parries {1}'s attack, taking no damage.";
	public var seduceTxt:String = "{0} increases {1}'s lust.";
	//Equipped items
	public var weapon1:Object = { };
	public var weapon2:Object = { };

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
		var targets:Array = BattleSys.getActiveMembers(BattleSys.playerTeam);
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
		var parsedString = StringUtil.substitute(this.attackTxt, this.name, target.name);
		Core.text.fightText("\r"+parsedString+"\r", false);
		dodgeCheck(target);
		trace("" + this.name + " attacks!");
	}
	//Used by Player for attacking
	public function manualAttack(target:Entity):void
	{
		var parsedString = StringUtil.substitute(this.attackTxt, this.name, target.name);
		Core.text.fightText(""+parsedString+"\r", true);
		dodgeCheck(target);
		BattleSys.runAllTurns();
	}
	//Dodge check... to be added later
	public function dodgeCheck(target:Entity):void {
		if (Math.random() < (this.agi / target.dex)) {
			dealDamage(this.str, target);
			trace("" + target.name + " is hit!");
		}
		else {
			var parsedString = StringUtil.substitute(this.dodgeTxt, target.name, this.name);
			Core.text.fightText(parsedString, false);
			trace("" + target.name + " dodged the attack");
		}
	}
	//Deal damage...duh
	public function dealDamage(dmg:Number, target:Entity):void
	{
		target.HP -=  dmg;
		var parsedString = StringUtil.substitute(this.dmgTxt, target.name, dmg);
		Core.text.fightText(""+parsedString+"\r", false);
		if (target.HP <= 0)
		{
			target.HP = 0;
			var parsedString2 = StringUtil.substitute(target.defeatTxt, this.name, target.name);
			Core.text.fightText("" + parsedString2 + "\r", false);
			BattleSys.endCombat();
		}
		Core.screen.combat.refreshDisplays();
		trace("" +target.name + " takes " + dmg + " points of damage");
	}
	//Healing... though there's no spell system right now.
	private function heal(target:Entity):void
	{

	}

}

}