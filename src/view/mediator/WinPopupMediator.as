package view.mediator
{
	import config.GeneralNotifications;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.WinPopupVL;

	public class WinPopupMediator extends UIMediator
	{
		public static const NAME:String = "WinPopupMediator";
		
		public function WinPopupMediator()
		{
			super(NAME, new WinPopupVL());
		}
		
		private function get winPopup():WinPopupVL 
		{
			return viewLogic as WinPopupVL;
		}
		override public function listNotificationInterests():Array
		{
			return [GeneralNotifications.SEND_VALUE_TO_WINPOPUP];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.SEND_VALUE_TO_WINPOPUP:
					winPopup.ScoreTrueFalseCounters(notification.getBody() as Array);
					break;
			}
		}
	}
}