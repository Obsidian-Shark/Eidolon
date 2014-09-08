package screens {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Data extends MovieClip {
		
		
		public function Data() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		private function initialize(e:Event):void {
			
		}
	}
	
}
