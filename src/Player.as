﻿package {
	import system.*;
	import lists.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 * @author Pako
	 */
	
	dynamic public class Player {
		//Base Stats
		public var name:String = "";
		public var level:int = 0;
		public var exp:int = 0;
		public var gender:String = "";
		//Combat stats
		public var str:int = 0; //Strength
		public var endr:int = 0; //Endurance
		public var dex:int = 0; //Dexterity
		public var agi:int = 0; //Agility
		public var wis:int = 0; //Wisdom
		public var chrs:int = 0; //Charisma
		public var HP:int = 0;
		public var maxHP:int = 0;
		public var MP:int = 0;
		public var maxMP:int = 0;
		public var SP:int = 0;
		public var maxSP:int = 0;
		//Personality stats
		public var aggression:int = 0; //Violent response
		public var discipline:int = 0; //Impulse control
		public var honesty:int = 0; //Likelihood of lying or telling the truth
		public var will:int = 0; //Submissive vs Dominate
		//Body Slots
		public var ears:Object = { };
		public var eyes:Object = { };
		public var legs:Object = { };
		public var skin:Object = { };
		public var tail:Object = { };
		//Equipment Slots
		public var accSlot:Object = { };
		public var chestSlot:Object = { };
		public var feetSlot:Object = { };
		public var handSlot:Object = { };
		public var legSlot:Object = { };
		public var ringSlot:Object= { };
		public var weapon1Slot:Object = { };
		public var weapon2Slot:Object = { };
		//Inventory
		public var bag:Object = { };
		public var sigils:int = 0;
		
		public function Player() {
			// constructor code
			
		}
		//Plug in data for combat
		public function loadCombat():void {
			var pc = BattleSys.playerTeam[0];
			pc.active = true;
			pc.name = name;
			pc.str = str;
			pc.endr = endr;
			pc.agi = agi;
			pc.dex = dex;
			pc.wis = wis;
			pc.maxHP = maxHP;
			pc.maxMP = maxMP;
			pc.maxSP = maxSP;
			pc.HP = HP;
			pc.MP = MP;
			pc.SP = SP;
			pc.weapon1 = weapon1Slot;
			pc.weapon2 = weapon2Slot;
			pc.chestArmr = chestSlot;
			pc.feetArmr = feetSlot;
			pc.handArmr = handSlot;
			pc.legArmr = legSlot;
		}
		//Player loots item
		public function loot(item:Object, num:Number):void {
			item.count = num;
			if (bag.hasOwnProperty(item.name)) {
				if (bag[item.name].count) {
					bag[item.name].count ++;
				}
				else {
					bag[item.name].count += 0;
				}
				trace("Player has " + bag[item.name].count + " " + item.name + "");
			}
			else {
				bag[item.name] = item;
				trace("Player adds " + item.name + " to bag. ("+bag[item.name].count+")");
			}
		}
		//Player drops item
		public function drop(item:Object):void {
			if (bag.hasOwnProperty(item.name)) {
				bag[item.name].count--;
				if (bag[item.name].count == 0) {
					delete(bag[item.name]);
					trace("Player discards " +item.name + "");
				}
				else {
					trace("Player has discarded a " + item.name + " and now have " + bag[item.name].count + " left");
				}
			}
		}
	}
	
}
