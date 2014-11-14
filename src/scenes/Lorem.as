package scenes
{
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 * @author Void Director...
	 */
	public class Lorem {
		
		public function Lorem() {
			//constructor code
		}
		public static function getData() {
			return {
				explore: {
					text: [
						"This is some test data for the parser. The player's name is [pc.name] and here is the result of invoking a decription function [pc.mpDesc] \n\n",
						"System designed by Void Director",
						"\r\rYou stand in the town of Lorem, a small, quaint trading town.",
						"\r\rThere is a store with dusty windows with its door, invitingly, open. You can see stock shelves of various items inside.",
						"\r\rhere is a small tavern to your right that looks pretty quiet but you can see people inside through the windows."
					],
					options: [
						{
							text: "Shop",
							event: "shop"
						},
						{
							text: "Tavern",
							event: "tavern"
						},
					]
				},
				
				shop: {
					text: [
						"You walk inside the shop and are warmly greeted by the shopkeeper at the corner. There are several shelves neatly lined to make aisles, each neatly organized and clearly categorized.",
						"\rThere are numerous items of interest available here.",
					],
					options: [
						{
							text: "Potion",
							event: "potion"
						},
						{
							text: "Trinket",
							event: "trinket"
						},
						{
							text: "Leave",
							event: "explore"
						},
					]
				},
				
				tavern: {
					text: [
						"The tavern is fairly empty when you enter. Only a couple of peoplt sit at the tables spread out evenly across the floor and a single man tends the bar, cleaning a glass."
					],
					options: [
						{
							text: "Drink",
							event: "orderDrink"
						},
						{
							text: "Patron",
							event: "patron"
						},
						{
							text: "Leave",
							event: "explore"
						}
					]	
				}
			}
		}
		
	}
	
}