package lists
{
	import system.*;
	import templates.Ability;
	import templates.Entity;
	
	/**
	 * ...
	 * @author Obsidian Shark...
	 */
	
	dynamic public class AbilityLibrary {
		
		// Returns an entity based of an enemy of a given name
		// Searches for the name in both the enemies and bosses list
		public static function getAbility(name:String):Ability {
			
			var source = abilities[name.toLowerCase()];
			trace(name);
			trace(JSON.stringify(source));
			source.name = name;
			return new Ability(source);
		}
		
		
		// A common target validator
		static function isEnemy(caster:Entity, target:Entity) {
			trace("IE c:" + caster.team + " t:" + target.team);
			return caster.team != target.team;
		}
		
		static function any(caster:Entity, target:Entity) {
			return true;
		}
		
		/*
		* Abilities can have the following
		* targeted        - True if the ability has a single target.
		* cost            - mana cost.
		* targetValidator - If targeted this should return true on valid targets and false on invalid ones.
		* callback        - Required, effect of the ability.
		* getUtility      - used by AI to estimate how useful an ability is.
		*/
		
		// A list of abilitiy data.
		private static var abilities = {
			attack: {
				targeted: true,
				category: 'basic',
				cost: 0,
				targetValidator: isEnemy,
				callback: function (caster, target) {
					caster.attack(target);
				},
				heuristic: function(caster, target) {
					return caster.wis * 10 - this.cost * 2;
				}
			},
			firebolt: {
				targeted: true,
				category: 'magic',
				cost: 10,
				targetValidator: isEnemy,
				callback: function (caster, target) {
					caster.dealDamage(50 + caster.wis * 20, target);
				},
				heuristic: function(caster, target) {
					return caster.wis * 10 - this.cost * 2;
				}
			}
		}
	}
	
}