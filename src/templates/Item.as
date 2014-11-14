package templates {
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	dynamic public class Item extends Object {
		public var enchant:String = ""; //Special modifier
		public var id:String = ""; //Type of item
		public var name:String = "";
		public var slot:String = ""; //Equipment slot
		public var stack:int = 0; //Amount of item carried
		public var type:String = ""; //Weapon = spear, sword, sheild, etc. | Potion = health, TF, etc
		public var value:int = 0; //Worth x amount of sigils
		//Weapon variables
		public var dmgMod:Number = 0; //Damage calculation
		//Armor variables
		public var chrsMod:Number = 0; //Bonus (+/-) to charisma
		public var defMod:Number = 0; //Damage absorption calculation
		
		public function Item(Properties:Object) {
			//constructor code
			//pass an object through and set what variables are needed
			for (var Name:String in Properties) {
				//Matching property name over-writes the defaults
				if (this.hasOwnProperty(Name)) {
					this[Name] = Properties[Name];
				}
			}
		}
	}
	
}