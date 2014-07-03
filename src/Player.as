package {
	import system.*;
	
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
			CombatAI.pc.name = name;
			CombatAI.pc.str = str;
			CombatAI.pc.endr = endr;
			CombatAI.pc.agi = agi;
			CombatAI.pc.dex = dex;
			CombatAI.pc.wis = wis;
			CombatAI.pc.maxHP = maxHP;
			CombatAI.pc.maxMP = maxMP;
			CombatAI.pc.maxSP = maxSP;
			CombatAI.pc.HP = HP;
			CombatAI.pc.MP = MP;
			CombatAI.pc.SP = SP;
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
		
		// For testing parser, feel free to remove this.
		public function mpDesc() {
			return "(" + MP + "/" + maxMP + ") MP "  + maxMP / MP * 100 + "%";
		}
	}
	
}
