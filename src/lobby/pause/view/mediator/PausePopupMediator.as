package lobby.pause.view.mediator
{
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import lobby.pause.view.components.PausePopupVL;
	import core.view.mediator.UIMediator;

	public class PausePopupMediator extends UIMediator
	{
		public static var NAME:String = "PausePopupMediator";
		public function PausePopupMediator()
		{
			super(NAME, new PausePopupVL());
		}	
		private function get pausePopup():PausePopupVL
		{
			return viewLogic as PausePopupVL;
		}
		override public function onRegisterListeners():void
		{
			pausePopup.addEventListener(GeneralEventsConst.CONTINUE_GAME, onContinueGameHand);
		}
		override public function onRemoveListeners():void
		{
			pausePopup.removeEventListener(GeneralEventsConst.CONTINUE_GAME, onContinueGameHand);
		}
		
		protected function onContinueGameHand(event:Event):void
		{
			sendNotification(GeneralNotifications.CONTINUE_GAME);			
		}
		
		override public function listNotificationInterests():Array
		{
		//	trace("ТоталСкор");
			return [GeneralNotifications.TOTAL_SCORE_UPDATED];	
			
		}
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.TOTAL_SCORE_UPDATED:
					pausePopup.totalScoreUpdated(notification.getBody() as int);
					break;
			}
		}
	}
}