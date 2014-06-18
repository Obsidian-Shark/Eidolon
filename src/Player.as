package {
	import flash.display.GraphicsPathWinding;
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
		public var dominate:int = 0; //Domination behavior
		public var honesty:int = 0; //Truth or Lies
		public var submissive:int = 0; //Submissive behavior
		public var trust:int = 0; //Trusting/Suspicious person
		public var vile:int = 0; //Evil/Rude person
		public var virtuous:int = 0; //Good/Honorable person
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
		//PRE-SET PROFILES FOR TESTING
		//Ceatus
		public function loadCeatus():void {
			Core.pc.name = "Ceatus";
			Core.pc.gender = "Female";
			Core.pc.level = 99;
			Core.pc.str = 62;
			Core.pc.endr = 30;
			Core.pc.dex = 75;
			Core.pc.agi = 130;
			Core.pc.wis = 50;
			Core.pc.chrs = 999;
			Core.pc.maxHP = Math.round((Core.pc.endr * 10.5)*1);
			Core.pc.maxMP = Math.round((Core.pc.wis *10.5)*1);
			Core.pc.maxSP = Math.round((Core.pc.endr + Core.pc.str * 2.5)*1);
			Core.pc.HP = Core.pc.maxHP;
			Core.pc.MP = Core.pc.maxMP;
			Core.pc.SP = Core.pc.maxSP;
			//Personality
			Core.pc.aggression = 25;
			Core.pc.discipline = 65;
			Core.pc.dominate = 50;
			Core.pc.honesty = 50;
			Core.pc.submissive = 50;
			Core.pc.trust = 30;
			Core.pc.vile = 10;
			Core.pc.virtuous = 70;
			trace("Profile Caetus has been loaded into Player.as");
		}
		//Baldr
		public function loadBaldr():void {
			Core.pc.name = "Baldr";
			Core.pc.gender = "Male";
			Core.pc.level = 99;
			Core.pc.str = 150;
			Core.pc.endr = 80;
			Core.pc.dex = 40;
			Core.pc.agi = 40;
			Core.pc.wis = 37;
			Core.pc.chrs = 999;
			Core.pc.maxHP = Math.round((Core.pc.endr * 10.5)*1);
			Core.pc.maxMP = Math.round((Core.pc.wis *10.5)*1);
			Core.pc.maxSP = Math.round((Core.pc.endr + Core.pc.str * 2.5)*1);
			Core.pc.HP = Core.pc.maxHP;
			Core.pc.MP = Core.pc.maxMP;
			Core.pc.SP = Core.pc.maxSP;
			//Personality
			Core.pc.aggression = 25;
			Core.pc.discipline = 65;
			Core.pc.dominate = 50;
			Core.pc.honesty = 50;
			Core.pc.submissive = 50;
			Core.pc.trust = 30;
			Core.pc.vile = 10;
			Core.pc.virtuous = 70;
			trace("Profile Caetus has been loaded into Player.as");
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
