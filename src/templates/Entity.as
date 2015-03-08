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
	private var defeated:Boolean = false;
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
	public var defeatTxt:String = "{0} was defeated!.";
	public var dodgeTxt:String = "{0} dodges {1}'s attack!";
	public var dmgTxt:String = "{0} takes {1} points of damage.";
	public var parryTxt:String = "{0} parries {1}'s attack, taking no damage.";
	public var seduceTxt:String = "{0} increases {1}'s lust.";
	//Equipped items
	public var weapon1:Object = { };
	public var weapon2:Object = { };
	public var chestArmr:Object = { };
	public var feetArmr:Object = { };
	public var handArmr:Object = { };
	public var legArmr:Object = { };
	
	// Builds an entity from an object containing that entities data
	// If given no arguments will build a blank entity instead
	public function Entity(data:Object = undefined)
	{
		if (!data) 
			return;
		
		for (var prop in data) {
			this[prop] = data[prop]
		}
				
		maxHP = Math.round(((endr || 1) * 10.5)*1);
		maxMP = Math.round(((wis  || 1) * 10.5)*1);
		maxSP = Math.round(((endr || 1) + str * 2.5)*1);
		HP = maxHP;
		MP = maxMP;
		SP = maxSP;
		
		if (active !== false) 
			active = true;
		trace('New Entity', JSON.stringify(this));
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
		this.attack(target);
		trace("" + this.name + " attacks!");
	}
	
	//Used by Player for attacking
	public function manualAttack(target:Entity):void
	{
		Core.text.fightText("", true); // Clear previous text, placeholder for a better way to do this
		this.attack(target);
		BattleSys.runAllTurns();
	}

	public function attack(target:Entity):void 
	{
		Core.text.fightText(StringUtil.substitute(this.attackTxt, this.name, target.name) + "\r");
		if (dodgeCheck(target)) {
			trace('wepon', weapon1.dmgMod, weapon2.dmgMod);
			dealDamage(this.str * ((weapon1.dmgMod || 1) + (weapon2.dmgMod || 1)), target);
		}
	}
	
	//Dodge check
	public function dodgeCheck(target:Entity):Boolean {
		if (Math.random() < (this.agi / target.dex)) {
			trace("" + target.name + " is hit!");
			return true;
		}
		else {
			Core.text.fightText(StringUtil.substitute(this.dodgeTxt, target.name, this.name));
			trace("" + target.name + " dodged the attack");
			return false;
		}
	}
	
	//Deal damage to another entity
	// Any abilities that were to modify the amount of damage dealt on the users side would run here
	public function dealDamage(amount:int, target:Entity):void
	{
		var damageRecived = target.takeDamage(amount, this);
		trace("" +target.name + " takes " + amount + " points of damage");
	}
	
	// Recive damage from another entity
	// Eventually this will deal with damage reduction, counter attacks, ect.
	private function takeDamage(amount:int, dealer:Entity):int {
		var oldHP = this.HP;
		this.HP = Math.max(this.HP - amount, 0); // You can't take more damage than you have life
		Core.screen.combat.refreshDisplays();
		var diff = oldHP - this.HP; // store how much damage the attacker actually did
		Core.text.fightText(StringUtil.substitute(this.dmgTxt, this.name, diff) + "\r");
		this.checkDefeated();
		return diff;
	}
	
	// Checks if this entity was defeated by damage. If so sets a defeated boolean
	private function checkDefeated():Boolean {
		if (this.HP <= 0)
		{
			Core.text.fightText(StringUtil.substitute(this.defeatTxt, this.name) + "\r");
			this.active = false;
			BattleSys.checkEnd();
			return true;
		}
		return false;
	};
	
	
	//Healing... though there's no spell system right now.
	private function healDamage(amount:int, healer:Entity):void
	{
		this.HP = Math.min(this.HP + amount, this.maxHP);
	}

}

}