package view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.sendToURL;
	import flash.text.TextField;

	public class PausePopupVL extends ViewLogic
	{
		private var continueBtn:SimpleButton;
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
			continueBtn = pausePopup["continueBtn"];
			continueBtn.addEventListener(MouseEvent.CLICK, onContinueBtnClick);
		}
		
		protected function onContinueBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.CONTINUE_GAME));
		}
		public function totalScoreUpdated(tatalScore:int):void
		{
			totalScoreTf = pausePopup.totalScoreTf.scoreTf;
			totalScoreTf.text = tatalScore.toString(10);
		}
	}
}