package lobby.pause.view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.sendToURL;
	import flash.text.TextField;
	import core.view.components.ViewLogic;

	public class PausePopupVL extends ViewLogic
	{
		private var pauseContinueBtn:SimpleButton;
		private var totalScoreTf:TextField;
		
		public function PausePopupVL()
		{
			super("PausePopup");
			popupLoad();
		}
		private function get pausePopup():MovieClip
		{
			return content as MovieClip;
		}
		public function popupLoad():void
		{
			pauseContinueBtn = pausePopup["pauseContinueBtn"];
			pauseContinueBtn.addEventListener(MouseEvent.CLICK, onPauseContinueBtnClickHand);
		}
		
		protected function onPauseContinueBtnClickHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.PAUSE_CONTINUE_GAME));
		}
		public function totalScoreUpdated(tatalScore:int):void
		{
			totalScoreTf = pausePopup.totalScoreTf.scoreTf;
			totalScoreTf.text = tatalScore.toString(10);
		}
	}
}