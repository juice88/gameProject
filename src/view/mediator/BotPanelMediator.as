package view.mediator
{
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.BotPanelViewLogic;

	public class BotPanelMediator extends UIMediator
	{
		public static var NAME:String = "BotPanelMediator";
		
		public function BotPanelMediator()
		{
			super(NAME, new BotPanelViewLogic());
		}
		
		private function get botPanel():BotPanelViewLogic
		{
			return viewLogic as BotPanelViewLogic;
		}
		
		override public function onRegisterListeners():void
		{
			botPanel.addEventListener(GeneralEventsConst.MUTE, onMuteHand);
			botPanel.addEventListener(GeneralEventsConst.FULL_SCREEN, onFullScreenHand);
		}
		
		override public function onRemoveListeners():void
		{
			botPanel.removeEventListener(GeneralEventsConst.MUTE, onMuteHand);
			botPanel.removeEventListener(GeneralEventsConst.FULL_SCREEN, onFullScreenHand);
		}
		
		private function onMuteHand(event:Event):void
		{
			sendNotification(GeneralNotifications.MUTE);
		}
		
		protected function onFullScreenHand(event:Event):void
		{
			sendNotification(GeneralNotifications.FULL_SCREEN);
		}
		
		override public function listNotificationInterests():Array
		{
			return [GeneralNotifications.LIFES_COUNTER_UPDATED,
					GeneralNotifications.VALUES_MINUTE_SECOND];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case (GeneralNotifications.LIFES_COUNTER_UPDATED):
					botPanel.lifesCounterUpdated(notification.getBody() as int);
					break;
				case (GeneralNotifications.VALUES_MINUTE_SECOND):
					botPanel.timerUpdated(notification.getBody() as Array);
					break;
			}
		}
	}
}