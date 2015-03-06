package lobby.startScreen.view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.Warehouse;
	import core.view.components.ViewLogic;
	
	public class StartViewLogic extends ViewLogic
	{
		private var startBtn:SimpleButton;
		
		
		public function StartViewLogic()
		{
			super("StartScreen");
			startUpScreenLoad();
		}
		private function get startContent():Sprite{
			return content as Sprite;
		}
		
		private function startUpScreenLoad():void
		{
			startBtn = startContent["startBtn"];
			startBtn.addEventListener(MouseEvent.CLICK, onStartBtnClick);
		}
		
		protected function onStartBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.START_GAME));
		}
	}
}