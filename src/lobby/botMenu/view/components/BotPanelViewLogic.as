package lobby.botMenu.view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import core.view.components.ViewLogic;

	public class BotPanelViewLogic extends ViewLogic
	{
		private var muteBtn:MovieClip;
		private var fullScreenBtn:SimpleButton;
		private var frameMuteBtn:uint = 1;
		private var lifesPic:MovieClip;
		private var minuteTf:TextField;
		private var secondTf:TextField;
		
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
			muteBtn.addEventListener(MouseEvent.CLICK, onMuteBtnClickHand);
			fullScreenBtn = botPanel["fullScreenBtn"];
			fullScreenBtn.addEventListener(MouseEvent.CLICK, onFullScreenBtnClickHand);
			lifesPic = botPanel["lifesPic"];
			lifesPic.gotoAndStop(11);
		}
		
		protected function onMuteBtnClickHand(event:MouseEvent):void
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
		
		protected function onFullScreenBtnClickHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.FULL_SCREEN));
		}
		public function lifesCounterUpdated(lifesValue:int):void
		{
			lifesPic.gotoAndStop(lifesValue + 1);
		}
		public function timerUpdated(minSec:Array):void
		{
			
			minuteTf = botPanel.minute.valueTf;
			secondTf = botPanel.second.valueTf;
			if (minSec[1]<=9)
			{
				secondTf.text = "0" + minSec[1].toString(10);
			}
			else
			{
				secondTf.text = minSec[1].toString(10);
			}
			if (minSec[0]<=9)
			{
				minuteTf.text = "0" + minSec[0].toString(10);
			}
			else
			{
				minuteTf.text = minSec[0].toString(10);
			}
		}
	}
}