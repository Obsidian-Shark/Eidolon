package lists {

	/**
	 * ...
	 * @author Void Director
	 */

	public class ProfileLibrary {

		public static function getProfile (name: String) {
			if (profiles[name]) {
				return buildProfile(profiles[name]);
			}
		}

		public static function buildProfile (rawProfile: Object) {
			var builtProfile = {};
			
			return new Player(rawProfile);
		}


		private static var profiles = {
			male: {
				gender: "Male",
				level: 1,
				str: 12,
				endr: 12,
				dex: 10,
				agi: 10,
				wis: 10,
				chrs: 10,
				//Personality
				aggression: 10,
				discipline: 50,
				honesty: 50,
				will: 50,
				//Arm this bitch
				weapon1: ItemLibrary.Fist,
				weapon2: ItemLibrary.Fist
				//Setup Body Slots
			},

			baldr: {
				name: "Baldr",
				gender: "Male",
				abilities:["Firebolt"],
				level: 99,
				str: 150,
				endr: 80,
				dex: 40,
				agi: 40,
				wis: 37,
				chrs: 999,
				// Weapons
				weapon1: ItemLibrary.Fist,
				weapon2: ItemLibrary.Fist,
				//Personality
				aggression: 25,
				discipline: 65,
				dominate: 50,
				honesty: 50,
				submissive: 50,
				trust: 30,
				vile: 10,
				virtuous: 70
			}
		}
	}
}