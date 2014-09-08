package misc
{
	import Player;
	import lists.*;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 * @author Void Director
	 */
	
	dynamic public class Profiles {
		
		public function Profiles() {
			//constructor code
		}
		
		public static var buildAll = function () {
			buildValues(Caetus);
			buildValues(Baldr);
		}
		
		// Build the values that can be calculated from stats
		private static var buildValues = function (charData) {
			charData.maxHP = Math.round((charData.endr * 10.5) * 1);
			charData.maxMP = Math.round((charData.wis * 10.5) * 1);
			charData.maxSP = Math.round((charData.endr + charData.str * 2.5) * 1);
			charData.HP = charData.maxHP;
			charData.MP = charData.maxMP;
			charData.SP = charData.maxSP;
		}
		
		//container for all pre-set profiles to test the engine out with.
		public static var Caetus = { 
			name:"Caetus",
			level:0,
			exp:0,
			gender:"Female",
			str:62,
			endr:30,
			dex:75,
			agi:130,
			wis:50,
			chrs:999,
			aggression:25,
			discipline:65,
			dsScale:50,
			honesty:50,
			trust:30,
			vile:10,
			virtuous:70,
			weapon1Slot:ItemLibrary.LevthFang,
			weapon2Slot:ItemLibrary.LevthFang,
			chestSlot:ItemLibrary.LagiasKntChst,
			feetSlot:ItemLibrary.LagiasKntGrv,
			handSlot:ItemLibrary.LagiasKntGlv,
			legSlot:ItemLibrary.LagiasKntLgs
		};
		
		public static var Baldr = {
			name:"Baldr",
			level:0,
			exp:0,
			gender:"Male",
			str:150,
			endr:80,
			dex:40,
			agi:30,
			wis:37,
			chrs:999,
			aggression:25,
			discipline:65,
			dsScale:50,
			honesty:50,
			trust:30,
			vile:10,
			virtuous:70,
			weapon1Slot:ItemLibrary.Fist,
			weapon2Slot:ItemLibrary.Fist
		};
				
	}
	
}