package system {
	import scenes.*;
	import lists.*;
	import Core;

	public class Interpreter {

		public function Interpreter() {

		}

		private var currentSource: String = undefined;
		private var allData = {
			lorem: Lorem.getData(),
			test: Events.testMenu()
		}
		
		//Tracks 'current' loaded screen in the event the Player switches from the Game screen and back.
		public static var holdScene: String = "";

		//Core function to make this work.
		//Routes sceneData to the appropriate function needed to run (I think?)
		public function interpret(sceneName) {
			var sceneData = getSceneData(sceneName);
			if (sceneData) {
				nextButtonNumber = 0;
				displayOptions(sceneData);
				displayText(sceneData);
				loadProfiles(sceneData);
				pcStats(sceneData);
				runFlags(sceneData);
				runItems(sceneData);
				runCombat(sceneData);
			} else {
				Core.text.addText("No data for scene " + sceneName);
			}
			holdScene = sceneName;
			trace(sceneName);
			trace(holdScene);
		}
		
		//Loads pre-set character profiles
		private function loadProfiles(sceneData) {
			var charName = sceneData.loadCharacter,
				charData;
			
			if (charName)  {
				charData = ProfileLibrary.getProfile(charName);
				
				for (var prop in charData) {
					Core.pc[prop] = charData[prop];
				}
			}
			Core.screen.game.refreshUI();
		}

		public static var thisScene: String;

		private function refresh() {
			interpret(thisScene);
		}

		//Works in tadem with interpret() to translate data into the correct functions
		private function getSceneData(sceneName) {
			if (sceneName.indexOf(".") >= 0) {
				var split = sceneName.split(".");
				this.currentSource = split[0];
				return allData[split[0]][split[1]];
			} else {
				return allData[currentSource][sceneName];
			}
		}
		
		//Checks for the request criteria to trigger (or lock out) a part of a scene
		private function reqsMet(requirments) {
			if (requirments) {
				// If there is only one requirment it might not be in an array
				if (typeof requirments === "string") {
					requirments = [requirments];
				}
				// Split the requirement into type and data eg flags.thisflag will be split into ["flags", "thisflag"]
				var split;
				for (var i = 0; i < requirments.length; i += 1) {
					split = requirments[i].split(".");

					if (split[0].substring(0, 1) !== "!") {
						if (Core.flags[split[1]] === false || Core.flags[split[1]] === undefined) {
							return false;
						}
						if (Core.pc[split[1]] === false || Core.pc[split[1]] === undefined) {
							return false;
						}
					} else {
						if (Core.flags[split[1]] === true) {
							return false;
						}
						if (Core.pc[split[1]] === true) {
							return false;
						}
					}
				}
			}
			return true;
		}
		
		// Checks if a variable is an array
		private function isArray(item):Boolean {
			return typeof item === "object" && item.constructor === Array;
		}
		
		// Takes a variable and wraps it in an array (of one element) if it is not already an array
		private function boxArray(item):Array {
			if (isArray(item)) {
				return item;
			}  
			return [item];
		}
		
		//Handles parsing and displaying text in the game window properly
		private function displayText(sceneData) {
			var textData = boxArray(sceneData.text || "");
			Core.text.clearText();
			for (var i: int = 0; i < textData.length; i += 1) {
				if (typeof (textData[i]) === "string") {
					Core.text.addText(Core.parser.parse(textData[i]));
				} else {
					if (reqsMet(textData[i].reqs)) {
						Core.text.addText(Core.parser.parse(textData[i].text));
					}
				}
			}
		}

		private var nextEvents: Array = [];

		private var nextButtonNumber = 0;

		// Sets the next unused button on the UI to have the given text and callback
		private function nextButton(text, callback) {
			Core.btn.setButtonEvent(nextButtonNumber, callback);
			Core.btn.setButton(nextButtonNumber + 1, text);
			nextButtonNumber += 1;
		}
		
		//Enables multi-option buttons... basically, multiple choice during scenes.
		private function displayOptions(sceneData) {
			var optionData = sceneData.options;
			Core.btn.flushBtns();
			for (var i: int = 0; i < optionData.length; i += 1) {
				if (reqsMet(optionData[i].reqs)) {
					nextButton(optionData[i].text, navigationEventFactory(optionData[i].event));
				}
			}
		}

		// Returns a navigation callback (an anonymous function used to navigate to another scene)
		private function navigationEventFactory(event): Function {
			return function (btnNumber): void {
				interpret(event);
			}
		}

		//Run combat... still needs extensive work to funciton correctly
		private function runCombat(sceneData) {
			var encounterData = sceneData.fight;
			
			if (encounterData) {
				trace("start combat");
				trace(JSON.stringify(encounterData));
				var combat = Core.screen.switchTo("Combat"),
					intepreter = this;
				BattleSys.loadEncounter(encounterData.enemies);
				BattleSys.setEnd(function () {
					intepreter.interpret(encounterData.win);
				}, function () {
					intepreter.interpret(encounterData.loss);
				});
				combat.startFight();
			}
		}
		
		// Sets the value of any flags in scene data to new values also specified in the data
		private function runFlags(sceneData) {
			var flagData = sceneData.flags;
			if (flagData) {
				for (var i: int = 0; i < flagData.length; i += 1) {
					Core.flags[flagData[i].flag] = flagData[i].newValue;
				}
			}
		}
		
		//Check Player's stats.
		private function pcStats(sceneData) {
			var pcData = sceneData.pc;
			if (pcData) {
				for (var i: int = 0; i < pcData.length; i += 1) {
					Core.pc[pcData[i].pc] = pcData[i].newValue;
				}
			}
		}
		
		//Checks for item before looting them
		private function runItems(sceneData) {
			var itemsData = sceneData.loot;
			if (itemsData) {
				for (var i: int = 0; i < itemsData.length; i += 1) {
					if (reqsMet(itemsData[i].reqs) && !Core.flags[currentSource + "_Looted_" + itemsData[i].item]) {
						nextButton(itemsData[i].text, itemEventFactory(itemsData[i]));
					}
				}
			}
		}
		//Loots item and adds to Player's inventory
		private function itemEventFactory(itemData): Function {
			return function (btnNumber): void {
				// Set a flag to remember the item was looted...
				Core.flags[currentSource + "_Looted_" + itemData.item] = true;

				// Here is where we would actually add the item to the Player bag array... need to implement this properly
				Core.pc.loot(itemData);
				
				// Display some text describing picking up the item if it exists
				if (itemData.pickupText) {
					Core.text.addText(itemData.pickupText)
				}

				// Hide the pickup button
				Core.btn.hideButton(btnNumber)
			}
		}
	}
}