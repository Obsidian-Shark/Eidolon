package lists
{
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 */
	
	import templates.Item;
	 
	public class ItemLibrary {
		//Clone of the ItemHandler.as class from Aphrosia... basically generates all the items that exist in the game
		//ACCESSORIES
		//ARMOR
		public static var LagiasKntChst:Item = new Item( { name:"Lagias Knight Chestplate", id:"armor", type:"scale", slot:"chest", defMod:2, stack:1, value:0 } );
		public static var LagiasKntGrv:Item = new Item ( { name:"Lagias Knight Greaves", id:"armor", type:"scale", slot:"feet", defMod:1.5, stack:1, value:0 } );
		public static var LagiasKntGlv:Item = new Item ( { name:"Lagias Knight Gloves", id:"armor", type:"scale", slot:"hand", defMod:1.5, stack:1, value:0 } );
		public static var LagiasKntLgs:Item = new Item ( { name:"Lagias Knight Leggings", id:"armor", type:"scale", slot:"leg", defMod:1.5, stack:1, value:0 } );
		//CONSUMABLES
		//RESOURCE... for crafting shit
		//SHIELDS
		public static var IronTwr:Item = new Item( { name:"Iron Tower", id:"shield", type:"heavy", slot:"1-hand", dmgMod:1, stack:1, value:0 } );
		//WEAPONS
		public static var Fist:Item = new Item( { name:"Bare Fist", id:"weapon", type:"melee", slot:"1-hand", dmgMod:1, stack:1, value:0 } );
		public static var LevthFang:Item = new Item( { name:"Leviathan Fang", id:"weapon", type:"spear", slot:"2-hand", dmgMod:3.5, stack:1, value:0 } );
		public static var NdhgFang:Item = new Item( { name:"Nidhogg's Fang", id:"weapon", type:"sword", slot:"1-hand", dmgMod:2.5, stack:1, value:0 } );
		
		public function ItemLibrary() {
			
		}
	}
	
}