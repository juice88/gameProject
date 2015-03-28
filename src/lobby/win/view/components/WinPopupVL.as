package lobby.win.view.components
{
	import core.config.GeneralEventsConst;
	import core.utils.SoundLib;
	import core.view.components.DialogViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class WinPopupVL extends DialogViewLogic
	{
		private var totalScore:TextField;
		private var trueMoves:TextField;
		private var falseMoves:TextField;
		private var nextBtn:SimpleButton;
		
		public function WinPopupVL()
		{
			super("WinPopup");
			winPopupLoad();
		}
		
		private function get winPopup():MovieClip
		{
			return content as MovieClip;
		}
		
		private function winPopupLoad():void
		{
			winPopup.visible = false;
			winPopup.gotoAndStop(2);
		}
		
		public function ScoreTrueFalseCounters(value:Array):void
		{
			winPopup.gotoAndStop(2);
			totalScore = winPopup.totalScore.scoreTf;
			totalScore.text = value[0].toString(10);
			trueMoves = winPopup.trueMoves.movesTf;
			trueMoves.text = value[1].toString(10);
			falseMoves = winPopup.falseMoves.movesTf;
			falseMoves.text = value[2].toString(10);
			nextBtn = winPopup["nextBtn"];
			nextBtn.addEventListener(MouseEvent.CLICK, onNextBtnClickHand);
			winPopup.visible = true;
		}
		
		protected function onNextBtnClickHand(event:Event):void
		{
			SoundLib.btnClickSound();
			dispatchEvent(new Event(GeneralEventsConst.NEXT_LEVEL));
		}
	}
}