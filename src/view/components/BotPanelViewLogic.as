package view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class BotPanelViewLogic extends ViewLogic
	{
		private var muteBtn:MovieClip;
		private var fullScreenBtn:SimpleButton;
		private var frameMuteBtn:uint = 1;
		private var lifesPic:MovieClip;
		
		public function BotPanelViewLogic()
		{
			super("BotPanel");
			botPaneLoad();
		}
		
		private function get botPanel():MovieClip
		{
			return content as MovieClip;
		}
		
		private function botPaneLoad():void
		{
			muteBtn = botPanel["muteBtn"];
			muteBtn.addEventListener(MouseEvent.CLICK, onMuteBtnClick);
			fullScreenBtn = botPanel["fullScreenBtn"];
			fullScreenBtn.addEventListener(MouseEvent.CLICK, onFullScreenBtnClick);
			lifesPic = botPanel["lifesPic"];
			lifesPic.gotoAndStop(11);
		}
		
		protected function onMuteBtnClick(event:MouseEvent):void
		{
			if (frameMuteBtn == 1)
			{
				frameMuteBtn = 2;
			}
			else 
			{
				frameMuteBtn = 1;
			}
			botPanel.muteBtn.gotoAndStop(frameMuteBtn);
			dispatchEvent(new Event(GeneralEventsConst.MUTE));
		}
		
		protected function onFullScreenBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.FULL_SCREEN));
		}
		public function lifesCounterUpdated(lifesValue:int):void
		{
			lifesPic.gotoAndStop(lifesValue + 1);
		}
	}
}