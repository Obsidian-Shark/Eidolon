package system {
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 * @author Void Director...
	 * @author Totem...
	 */
	
	 import flash.net.SharedObject;
	 import flash.utils.describeType;
	 
	 import scenes.*;
	
	public class GameData {
		
		public function GameData() {
			//constructor code
		}
		
		//Developed by Void Director
		//The purpose of this object is to iterate over all the variables of a static object like Player and copy them into the property of an Object.
		//storeName is a string that defines the name of the property to store objects into.
		public static function addStaticObject(storeName:String, to:Object, from:Object):void {
			var variables:XMLList = describeType(from).descendants("variable");
			to[storeName] = { };
			for each(var item:XML in variables) {
				to[storeName] [item.attribute("name")] = from[item.attribute("name")];
			}
		}		
		//Builds or over-writes existing save data
		public static function saveData(slot:String):Boolean {
			var saveFile = SharedObject.getLocal(slot);
			saveFile.data.exists = true;
			//Save Player variables
			addStaticObject("player", saveFile.data, Core.pc);
			if (saveFile.flush()) return true;
			return false;
		}
		
		//Loads data from a save file
		public static function loadData(slot:String):Boolean {
			var saveFile = SharedObject.getLocal(slot);
			if (saveFile.data.exists) {
				//Load Player data
				loadStaticObject("player", Core.pc, saveFile.data);
				saveFile.flush();
				return true;
			}
			return false;
		}
		
		//Loads stored data into game engine
		public static function loadStaticObject(storeName:String, to:Object, from:Object): void {
			trace(from[storeName]);
			for (var prop:String in from [storeName]) {
				to[prop] = from[storeName][prop];
			}
		}
	}
	
}