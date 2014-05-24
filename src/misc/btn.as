package misc {
	
	import flash.display.MovieClip;
	
	
	public class btn extends MovieClip {
		
		
		public function btn() {
			// constructor code
			//This class is, seriously, JUST for this one line of code so I don't have to write it a dozen times in the Buttons.as class
			this.text.mouseEnabled = false;
			this.buttonMode = true;
		}
	}
	
}
