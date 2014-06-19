package  scenes.cities {
	
	public class TyrRuins {
		public function TyrRuins() {
			// constructor code
		}
		
		public static function  getData() {
			return {
				explore: {
					text: [
						"Tyr is in absolute ruins. Most of the shops and buildings have been ransacked and burned down. Carts lay broken in the street amongst the corpses of horses, cattle, livestock, and people… some of which you recognize as villagers you’ve known all your life.", 
						"\r\rArgo’s shop looks like it has been completely ransacked and trashed, but untouched by fire.",
						"\r\rThe tavern storage room sits open to you. Surprisingly, the interior is intact but the heat of the flames have spoiled the contents of the room. Despite the low light, you check around for anything salvageable to take with you.",
						"\r\rThere’s an overturned cart with some smashed boxes around it that look like they haven’t been completely ransacked yet."
					], 
					options: [
						{
							text: "Smithy",
							event: "smithy"
						},
						{
							text: "Tavern",
							event: "tavern"
						},
						{
							text: "Cart",
							event: "cart"
						},
						{
							text: "Leave",
							event: "leave"
						},
					]
				},
				
				smithy: {
					text: [
						"You approach Argo’s blacksmith shop, hopes low as you see the state of the place. Most of the minotaur’s tools and crafts are either gone, broken, or scattered about the floor. The furnace has been damaged and the anvil tipped over. However… you notice the corpses you see scattered about are all soldiers, some with their armor caved in by the blow of something heavy. You search around but there is no trace of Argo at all. Perhaps he escaped or was taken prisoner but you find small relief in the fact that he might still be alive.", 
						"\r\rYou leave the blacksmith shop and return to the center of town to continue searching.",
					],
					options: [
						{
							text: "Next",
							event: "explore"
						}
					]
				},
				
				tavern: {
					text: [
						"The charred floorboards creak and crack under your weight as you wander into the remains of the Iron Sickle. Part of the roof has collapsed and the place is a complete mess. The bar is relatively intact and you can see the door to the storage room in the back. There also appears to be several corpses burned beyond recognition and you don’t want to think about who they might be.",
					],
					options: [
						{
							text: "Bar",
							event: "tavernBar"
						},
						{
							text: "Storage",
							event: "tavernStorage"
						},
						{
							text: "Corpse",
							event: "investigateCorpse"
						},
						{
							text: "Leave",
							event: "explore"
						}
					]
				},
				
				investigateCorpse: {
					text: [
						"You walk over to the far side of the tavern where part of the roof has collapsed. There’s a charred corpse caught underneath the fallen support beam, burned beyond all recognition. Whoever it was looked as if they had tried to escape.",
						{
							reqs:"items.sword", 
							text:"\r\rAmongst the ash and debris, you recognize the hilt of the sword Jorgen had hanging up on the wall. Now that you look, the sword is missing from the mount."
						},
						{
							reqs:"items.key", 
							text:"\r\rHanging from a piece of broken wood is a key made of hammered iron, the leather thong it is tied to barely holding together."
						}
					],
					items: [
						{
							text:"Sword",
							item: "oldSword",
							pickupType: "button",
							pickupText: "\r\rYou grab the hilt and pull the sword out from under the ash and debris. Just as you thought, it is the sword Jorgen had on display, a remnant of his days as a mercenary in his youth. The blade is dull, pitted, and covered in rust. You slip it through your belt, since you don’t have a sheath for it."
						},
						{
							text:"Key",
							item: "storageKey",
							pickupType: "button",
							pickupText: "\r\rYou snap the key off the leather strip. It has no distinguishing marks on it but it’s likely that it goes to something in the tavern."
						}
					],
					options: [						
						{
							text:"Leave",
							event:"tavern"
						},
					]
				},
				
				tavernStorage: {
					text: 
					[
						"You decide to investigate the storage room in the back of the tavern. You know from past visits that it was used to store food and supplies. This area of the tavern seems in good shape in comparison to the rest of the place.", 
						{
							reqs: ["!flags.tyrRuins_StorageDoorUnlocked"], 
							text:"\r\rDespite the apparent scorch damage done to the door, you find that the lock is intact and working when you try opening the door. It seems the damage might be enough to break the door in, with some effort, but the key might still be around the tavern somewhere as well."
						},	
						{
							reqs: ["flags.tyrRuins_StorageDoorUnlocked"],
							text:"\r\rThe tavern storage room sits open to you. Surprisingly, the interior is intact but the heat of the flames have spoiled the contents of the room. Despite the low light, you check around for anything salvageable to take with you."
						}
					],
					items: [
						{
							reqs: ["flags.tyrRuins_StorageDoorUnlocked"], 
							text: "Whiskey",
							item: "drgblmWhiskey",
							pickupText: "\r\rYou grab the bottle of whiskey. Oddly enough, the glass of the bottle feels soothingly warm to the touch. You place it in your bag."							
						},
						{
							reqs: ["flags.tyrRuins_StorageDoorUnlocked"], 
							text: "Vial",
							item: "smHPVial",
							pickupText: "\r\rYou pick up the small health potion and stick it in your bag."							
						},
					],
					options: [
						{
							reqs: ["!flags.tyrRuins_StorageDoorUnlocked"], 
							text: "Kick",
							event: "kickDoor"
						},
						{
							reqs: ["!flags.tyrRuins_StorageDoorUnlocked", "flags.tyrRuins_Looted_storageKey"],
							text: "Use Key",
							event: "useStorageRoomKey"
						},
						{
							text: "Leave",
							event: "tavern"
						}
					]
				},
				
				useStorageRoomKey:  {
					text: [
						"Since you found a key, you might as well see if it goes to the lock. Luckily for you, the lock turns as soon as you insert the key and twist. The bolt makes a loud ‘clank’ as it slides open and the door swings open easily enough. Since you no longer need the key, you toss it."
					],
					flags: [
						{
							flag: "tyrRuins_StorageDoorUnlocked",
							newValue: true
						}
					],
					options: [
						{
							text: "Next",
							event: "tavernStorage"
						}
					]
				}
			}
		}

	}
	
}
