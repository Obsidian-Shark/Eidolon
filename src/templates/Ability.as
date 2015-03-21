package templates {
	
	 import flash.errors.IllegalOperationError;
	
	public class Ability {
		
		// All of thes are private because abilities are intended to be immutable meaning they cannot be altered after they are created
		private var name:String;
		private var targeted:Boolean;
		private var cost:int;
		private var callback:Function;
		private var targetValidator:Function;
		private var heuristic:Function;
		
		// Creates a new ability from an anonymous object containing ability data.
		public function Ability(data:Object) {
			for(var prop:String in data) {
				this[prop] = data[prop];
			}
			if (name === undefined) {
				throw new IllegalOperationError("All abilities must have names");
			}
			if (callback === undefined) {
				throw new IllegalOperationError("Error in ability " + name + " abilities must have callbacks");
			}
			if (targeted && targetValidator === undefined) {
				throw new IllegalOperationError("Error in ability " + name + " targeted Abilities must have a target validator");
			}
			if (getUtility === undefined) {
				// Abilities which don't define a getUtility funciton will never be used by the aI
				trace("Warning, ability " + name + " does not have a getUtility function. The AI will not use this ability");
				heuristic = function () {
					return -Infinity;
				}
			}
		}
		
		public function getName():String {
			return name
		}

		// Checks if an entity can afford to use this ability.
		public function isAffordable(caster:Entity) {
			return caster.MP >= this.cost;
		}
		
		// Runs the ability. If the ability is not targeted then the target will be undefined.
		public function runAbility(caster:Entity, target:Entity = undefined) {
			callback(caster, target);
		}
		
		// Checks if a target is valid.
		public function validateTarget(caster:Entity, target:Entity) {
			return targetValidator(caster, target);
		}
		
		// Returns whether this ability requires a target.
		public function isTargeted() {
			return targeted;
		}
		
		// Returns the heuristical utility of a using this ability. Used by the AI.
		public function getUtility(caster:Entity, target:Entity = undefined) {
			return getUtility(caster, target);
		}

	}
	
}
