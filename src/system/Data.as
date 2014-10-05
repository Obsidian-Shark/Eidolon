package system {
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 * @author Void Director...
	 * @author Totem...
	 */
	
	 import flash.net.SharedObject;
	 import flash.utils.describeType;
	 
	public class Data {
		public function Data() {
			//construictor code
		}
		//Developed by Void Director
		//The purpose of this object is to iterate over all the variables of a static object like Player and copy them into the property of an Object.
		//storeName is a string that defines the name of the property to store objects in
		public static function addStaticObject(storeName:String, to:Object, from:Object):void {
			var variables:XMLList = describeType(from).descendants("variable");
			to[storeName] = { };
			for each(var item:XML in variables) {
				to[storeName][item.attribute("name")] = from[item.attribute("name")];
			}
		}
		public static function saveData(slot:String):Boolean {
			//Variables for displaying save data info in save slot
			var saveFile = SharedObject.getLocal(slot);
			saveFile.data.exists = true;
			//Player class variables
			addStaticObject("player", saveFile.data, Core.pc);
			trace("save data", saveFile.data);
			if (saveFile.flush()) return true;
			return false;
		}
		//Copies all variables stored in the Object named in storeName
		public static function loadStaticObject(storeName:String, to:Object, from:Object):void {
			trace(from[storeName]);
			for (var prop:String in from [storeName]) {
				to[prop] = from[storeName][prop];
			}
		}
		public static function loadData(slot:String):Boolean {
			var saveFile = SharedObject.getLocal(slot);
			if (saveFile.data.exists) {
				//Player class variables
				loadStaticObject("player", Core.pc, saveFile.data);
				saveFile.flush();
				return true;
			}
			return false;
		}
	}
}