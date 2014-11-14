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
			
			// Clone the data
			for (var prop in rawProfile) {
				builtProfile[prop] = rawProfile[prop];
			}
			
			// Add in the the profile data that can be derived from other 
			// parts of the profile.
			builtProfile.maxHP = Math.round((builtProfile.endr * 10.5) * 1);
			builtProfile.maxMP = Math.round((builtProfile.wis * 10.5) * 1);
			builtProfile.maxSP = Math.round((builtProfile.endr + builtProfile.str * 2.5) * 1);
			builtProfile.HP = builtProfile.maxHP;
			builtProfile.MP = builtProfile.maxMP;
			builtProfile.SP = builtProfile.maxSP;
			return builtProfile;
		}


		private static var profiles = {
			caetus: {
				name: "Caetus",
				gender: "Female",
				level: 99,
				str: 62,
				endr: 30,
				dex: 75,
				agi: 130,
				wis: 50,
				chrs: 999,
				//Personality
				aggression: 25,
				discipline: 65,
				dominate: 50,
				honesty: 50,
				submissive: 50,
				trust: 30,
				vile: 10,
				virtuous: 70,
				//Arm this bitch
				weapon1Slot: ItemLibrary.LevthFang,
				weapon2Slot: ItemLibrary.Fist,
				chestSlot: ItemLibrary.LagiasKntChst,
				feetSlot: ItemLibrary.LagiasKntGrv,
				handSlot: ItemLibrary.LagiasKntGlv,
				legSlot: ItemLibrary.LagiasKntLgs
			},

			baldr: {
				name: "Baldr",
				gender: "Male",
				level: 99,
				str: 150,
				endr: 80,
				dex: 40,
				agi: 40,
				wis: 37,
				chrs: 999,
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