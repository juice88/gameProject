package view.components
{
	import config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;

	public class GameOverPopupVL extends ViewLogic
	{
		private var restartBtn:SimpleButton;
		public function GameOverPopupVL()
		{
			super("GameOverPopup");
			setTimeout(popupLoad, 4000); //виставляємо затримку до появи GameOverPopup, щоб можна було переглянути ще не відкриті елементи
			
		}
		private function get gameOverPopup():MovieClip
		{
			return content as MovieClip;
		}
		private function popupLoad():void
		{
			gameOverPopup.gotoAndStop(2);
			restartBtn = gameOverPopup["restartBtn"];
			restartBtn.addEventListener(MouseEvent.CLICK, onRestartBtnClick);
		}
		
		protected function onRestartBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.RESTART_GAME));
		}
	}
}