package screens {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class Data extends MovieClip {
		
		
		public function Data() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Sets up all the proper shit for the window to work
		private function initialize(e:Event):void {
			close.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.closePopScrn);
			//slot1.addEventListener(MouseEvent.MOUSE_DOWN, );
		}
	}
	
}
