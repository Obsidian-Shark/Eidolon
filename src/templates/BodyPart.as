package templates {
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	dynamic public class BodyPart extends Object {
		public var color:String = ""; //Color of part
		public var girth:Number = 0; //Thickness, in inches
		public var length:Number = 0; //In inches
		public var type:String = ""; //Hair, skin, etc.
		
		public function BodyPart(Properties:Object) {
			//constructor code
			//pas an object through and set what variables are needed
			for (var Name:String in Properties) {
				//Matching property name over-writes the defaults
				if (this.hasOwnProperty(Name)) {
					this[Name] = Properties[Name];
				}
			}
		}
		
	}
	
}