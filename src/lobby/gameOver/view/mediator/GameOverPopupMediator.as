package lobby.gameOver.view.mediator
{
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import lobby.gameOver.view.components.GameOverPopupVL;
	import core.view.mediator.UIMediator;

	public class GameOverPopupMediator extends UIMediator
	{
		public static const NAME:String = "GameOverPopupMediator";
		public function GameOverPopupMediator()
		{
			super(NAME, new GameOverPopupVL());
		}
		private function get gameOverPopup():GameOverPopupVL
		{
			return viewLogic as GameOverPopupVL;
		}
		
		override public function onRegisterListeners():void
		{
			gameOverPopup.addEventListener(GeneralEventsConst.RESTART_GAME, onReStartGameHand);
		}
		
		override public function onRemoveListeners():void
		{
			gameOverPopup.removeEventListener(GeneralEventsConst.RESTART_GAME, onReStartGameHand);
		}
		
		protected function onReStartGameHand(event:Event):void
		{
			sendNotification(GeneralNotifications.RESTART_GAME);
		}
	}
}