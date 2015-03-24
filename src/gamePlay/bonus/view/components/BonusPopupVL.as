package gamePlay.bonus.view.components
{
	import config.GeneralEventsConst;
	
	import core.view.components.DialogViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class BonusPopupVL extends DialogViewLogic
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
			dispatchEvent(new Event(GeneralEventsConst.BONUS_LEVEL_START));
		}
	}
}