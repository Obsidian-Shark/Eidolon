package screens {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	
	
	public class Data extends MovieClip {
		
		
		public function Data() {
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, initialize);
		}
		//Sets up all the proper shit for the window to work
		private function initialize(e:Event):void {
			//Hide unused buttons
			slot2.visible = false;
			slot3.visible = false;
			slot4.visible = false;
			//Set text fields
			slot1.text.text = "Save";
			slot1Descript.text = "Empty";
			slot2Descript.text = "Unavailable";
			slot3Descript.text = "Unavailable";
			slot4Descript.text = "Unavailable";
			//Deactivate textfields
			slot1Descript.mouseEnabled = false;
			close.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.closePopScrn);
			slot1.addEventListener(MouseEvent.MOUSE_DOWN, Core.btn.slot1Save);
		}
		
		//Display save slot data
		public function displaySlotInfo(slot:String):void {
			var saveFile = SharedObject.getLocal(slot);
			saveFile = SharedObject.getLocal("one");
			if (saveFile.data.exists) {
				slot1Descript.text = "" + saveFile.data.player.name +", Level:" + saveFile.data.player.lvl + "";
			}
		}
	}
	
}
