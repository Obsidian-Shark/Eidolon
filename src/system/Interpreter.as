package system {
	import scenes.cities.*;
	import Core;
	
	public class Interpreter {

		public function Interpreter() {
			
		}
		
		private var currentSource:String = undefined;
		private var allData = {
			tyrRuins: TyrRuins.getData()
		}
		
		public function interpret(sceneName) {			
			var sceneData = getSceneData(sceneName);
			if (sceneData) {
				nextButtonNumber = 0;
				displayText(sceneData);
				runFlags(sceneData);
				displayOptions(sceneData);
				runItems(sceneData);
			} else {
				Core.text.addText("No data for scene " + sceneName);
			}
		}
		
		private var thisScene:String;
		
		private function refresh() {
			interpret(thisScene);
		}
		
		private function getSceneData(sceneName) {
			if (sceneName.indexOf(".") >= 0) {
				var split = sceneName.split(".");
				this.currentSource = split[0];
				return allData[split[0]][split[1]];
			} else {
				return allData[currentSource][sceneName];
			}
		}
		
		private function reqsMet (requirments) {
			if (requirments) {
				// If there is only one requirment it might not be in an array
				if (typeof requirments === "string") {
					requirments = [requirments];
				}
				// Split the requirment into type and data eg flags.thisflag will be split into ["flags", "thisflag"]
				var split;
				for (var i = 0; i < requirments.length; i += 1) {
					split = requirments[i].split(".");
					
					if (split[0].substring(0, 1) !== "!") {
						if (Core.flags[split[1]] === false || Core.flags[split[1]] === undefined) {
							return false;
						}
					} else {
						if (Core.flags[split[1]] === true ) {
							return false;
						}
					}
				}
			}
			return true;
		}
		
		private function displayText(sceneData) {
			var textData = sceneData.text;
			Core.text.clearText();
			for (var i:int = 0; i < textData.length; i += 1) {
				if (typeof(textData[i]) === "string") {
					Core.text.addText(textData[i]);
				} else {
					if (reqsMet(textData[i].reqs)) {
						Core.text.addText(textData[i].text);
					}
				}
			}
		}
		
		private var nextEvents:Array = [];
		
		private var nextButtonNumber = 0;

		private function nextButton (text, callback) {
			Core.btn.setButtonEvent(nextButtonNumber, callback);
			Core.btn.setButton(nextButtonNumber + 1, text);
			nextButtonNumber += 1;
		}
		
		private function displayOptions(sceneData) {
			var optionData = sceneData.options;
			Core.btn.flushBtns();
			for (var i:int = 0; i < optionData.length; i += 1) {
				if (reqsMet(optionData[i].reqs)) {
					nextButton(optionData[i].text, navigationEventFactory(optionData[i].event));
				}
			}
		}
		
		private function navigationEventFactory(event):Function {
			return function(btnNumber):void {
				interpret(event);
			}
		}
		
		private function runFlags(sceneData) {
			var flagData = sceneData.flags;
			if (flagData) {
				for (var i:int = 0; i < flagData.length; i += 1) {
					Core.flags[flagData[i].flag] = flagData[i].newValue;
				}
			}
		}
		
		private function runItems(sceneData) {
			var itemsData = sceneData.items;
			if (itemsData) {
				for (var i:int = 0; i < itemsData.length; i += 1) {
					if (reqsMet(itemsData[i].reqs) && !Core.flags[currentSource + "_Looted_" + itemsData[i].item]) {
						nextButton(itemsData[i].text, itemEventFactory(itemsData[i]));
					}
				}
			}
		}
		
		private function itemEventFactory (itemData):Function {
			return function(btnNumber):void {
				// Set a flag to remeber the item was looted.
				Core.flags[currentSource + "_Looted_" + itemData.item] = true;
				
				// Here is where we would actually add the item to the player but items
				// are not implemented in edilion yet so I will wait until they are
				
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
