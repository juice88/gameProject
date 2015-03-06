package gamePlay.bonus.view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import core.view.components.ViewLogic;

	public class BonusPopupVL extends ViewLogic
	{
		private var nextBtn:SimpleButton;
		public function BonusPopupVL()
		{
			super("BonusPopup");
			bonusPopupLoad();
		}
		private function get bonusPopup():MovieClip
		{
			return content as MovieClip;
		}
		private function bonusPopupLoad():void
		{
			bonusPopup.gotoAndStop(2);
			nextBtn = bonusPopup["nextBtn"];
			nextBtn.addEventListener(MouseEvent.CLICK, onClickNextBtnHand);
		}
		
		protected function onClickNextBtnHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.START_BONUS_LEVEL));
		}
	}
}