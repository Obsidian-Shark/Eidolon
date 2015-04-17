package {
	import system.*;
	import lists.*;
	import templates.Entity;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 * @author Pako
	 */
	
	dynamic public class Player extends Entity {
		//Base Stats
		public var exp:int = 0;
		public var gender:String = "";
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
		
		public function Player(data = undefined) {
			trace('New player ' + this.name);
			super(data);
			trace(JSON.stringify(this));
		}
		
		//Plug in data for combat
		public function loadCombat():void {
			this.active = true;
			BattleSys.playerTeam[0] = this;
		}
		//Player loots item
		public function loot(item:Object):void {
			//item.count = num;
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
