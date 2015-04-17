package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	import system.*;
	import templates.Entity;
	import templates.Ability;
	
	/**
	 * ...
	 * @author Obsidian Shark
	 */
	
	
	public class Combat extends MovieClip {
		
		private var buttons:Array;
		private var buttonEffects:Array;
		private var nextButton:int;
		
		private var characters:Array;
		private var targets:Array;
		
		private var noop:Function = function () {}; // Short for no operation. A placeholder function that does nothing

		
		// Initilize the combat object. This happens each time a new Combat object is created.
		public function Combat() {
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
			characters = [player, companion1, companion2, enemy1, enemy2, enemy3 ];
			targets = [e1Target, e2Target, e3Target]
			buttons = [cmbt1, cmbt2, cmbt3, cmbt4, cmbt5, cmbt6, cmbt7, cmbt8, cmbt9, cmbt10, cmbt11, cmbt12];
			buttonEffects = [];
			
			// Function that returns a function that calls a function stored in in the buttonEffect array. Not confusing at all.
			var makeButtonEffect = function (index) {
				return function () {
					buttonEffects[index]();
				}
			}
			
			for(var i = 0; i < buttons.length; i += 1) {
				buttonEffects[i] = noop;
				buttons[i].addEventListener(MouseEvent.MOUSE_DOWN, makeButtonEffect(i));
			}
			
			resume.text.text = "Continue";
			resume.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.toGame);
		}

		// Initilize combat. This happens every time a new fight is started.
		private function initialize(e:Event):void {
			clearButtons()
			
			resume.visible = false;
			for (var i = 0; i < characters.length; i += 1) {
				characters[i].visible = false;
			}

			for (var i = 0; i < targets.length; i += 1) {
				targets[i].visible = false;
			}
			
			mainMenu();
		}

		// Opens the basic menu with attack, skills, ect
		private function mainMenu() {
			var caster = BattleSys.playerTeam[0], // Currently hard coded as player. Change this to use for an ally
				categories = getCategories(caster.abilities)
			clearButtons();
			addAbilitiesOfCategory(caster, "basic");
			for (var i = 0; i < categories.length; i += 1) {
				assignButton(categories[i], categoryMenuFactory(caster, categories[i]));
			}
		}
		
		// Creates callbacks which open menues for specific cateogiresi of abilities
		private function categoryMenuFactory(caster:Entity, category:String):Function {
			return function () {
				clearButtons();
				assignButton("Return", mainMenu);
				addAbilitiesOfCategory(caster, category);
			}
		}
		
		// Creates a list of all the unique non basic categories of abilities a character has
		private function getCategories(abilities:Array):Array {
			var categorySet = {},
				categoryList = [];
			for (var i = 0; i < abilities.length; i += 1) {
				categorySet[abilities[i].getCategory()] = true;
			}
			delete categorySet.basic;
			for (var category in categorySet) {
				categoryList.push(category);
			}
			return categoryList;
		}
		
		private function abilitiesOfCategory(abilities:Array, category:String) {
			return abilities.filter(function (abil) {
				return abil.getCategory() === category;
			});
		}
		
		// Generates a callback that runs a specific ability
		private function abilityEffectFactory(ability:Ability, caster:Entity, target:Entity = undefined) {
			return function () {
				var suffix = target ? " on " + target.name : "";
				Core.text.fightText(caster.name + " uses " + ability.getName() + suffix + "\n", true);
				ability.runAbility(caster, target);
				BattleSys.runAllTurns();
				mainMenu();
			}
		}
		
		// Generates a callback that opens the target selection menu with a secified ability and caster
		private function targetMenuFactory(ability:Ability, caster:Entity) {
			return function () {
				targetMenu(ability, caster);
			}
		}
		
		private function addAbilitiesOfCategory(caster:Entity, category:String) {
			var abilities = abilitiesOfCategory(caster.abilities, category);
			trace(abilities)
			for(var i = 0; i < abilities.length; i += 1) {
				if (abilities[i].isAffordable(caster)) {
					if (abilities[i].isTargeted()) {
						assignButton(abilities[i].getName(), targetMenuFactory(abilities[i], caster));
					} else {
						assignButton(abilities[i].getName(), abilityEffectFactory(abilities[i], caster));
					}
				}
			}
		}
		
		// Opens a menu where the player can select abilities
		private function abilityMenu() {
			var caster = BattleSys.playerTeam[0],
				abilities = caster.abilities; // get the players abilities
			clearButtons();
			assignButton("Return", mainMenu);
			for(var i = 0; i < abilities.length; i += 1) {
				if (abilities[i].isAffordable(caster)) {
					if (abilities[i].isTargeted()) {
						assignButton(abilities[i].getName(), targetMenuFactory(abilities[i], caster));
					} else {
						assignButton(abilities[i].getName(), abilityEffectFactory(abilities[i], caster));
					}
				}
			}
		}
		
		// Open a target selection menu allowing the player to select a target for an ability
		private function targetMenu(ability:Ability, caster:Entity) {
			clearButtons();
			assignButton("Cancel", abilityMenu);
			var potentialTargets = BattleSys.getActiveEntities();
			for (var i = 0; i < potentialTargets.length; i += 1) {
				trace(potentialTargets[i].name, ability.validateTarget(caster, potentialTargets[i]));
				if (ability.validateTarget(caster, potentialTargets[i])) {
					assignButton(potentialTargets[i].name, abilityEffectFactory(ability, caster, potentialTargets[i]));
				}
			}
		}
		
		// Assigns the next unused button a callback and sets it text to the given string
		public function assignButton(text:String, effect:Function) {
			buttonEffects[nextButton] = effect;
			buttons[nextButton].text.text = text;
			buttons[nextButton].visible = true;
			nextButton++;
		}
		
		// Hides all the buttons and marks them as unused.
		public function clearButtons() {
			for(var i = 0; i < buttons.length; i += 1) {
				buttons[i].visible = false;
			}
			nextButton = 0;
		}
		
		//Load up data when an encounter is triggered.
		public function startFight():void {
			var allEntities = [].concat(BattleSys.playerTeam, BattleSys.enemyTeam);
			var allDisplays = [player, companion1, companion2, 
							  enemy1, enemy2, enemy3];
			//Push data into all displays
			for (var i:int = 0; i < allDisplays.length; i += 1) {
				// if an entity is active draw its data to the screen
				if (allEntities[i].active) {
					allDisplays[i].visible = true;
					allDisplays[i].label.text = "" + allEntities[i].name + "";
				}
			}
			// Push all the data that changs over time to the display
			updateDisplay();
		}
		
		// Ends the fight
		public function endFight():void {
			clearButtons();
			resume.visible = true;
		}
				
		// Update the screen with the current values for entity hp, mp, ect
		public function updateDisplay(): void {
			var allEntities = [].concat(BattleSys.playerTeam, BattleSys.enemyTeam),
				allDisplays = [player, companion1, companion2, 
							  enemy1, enemy2, enemy3];
			//Push data into all displays
			for (var i:int = 0; i < allDisplays.length; i += 1) {
				// if an entity is active draw its data to thes screen
				if (allEntities[i].active) {
					allDisplays[i].HP.text = "" + allEntities[i].HP + "";
					allDisplays[i].MP.text = "" + allEntities[i].MP + "";
					allDisplays[i].SP.text = "" + allEntities[i].SP + "";
				}
			}
		}
	}
	
}
