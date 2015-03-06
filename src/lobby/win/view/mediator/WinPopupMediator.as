package lobby.win.view.mediator
{
	import config.GeneralNotifications;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import lobby.win.view.components.WinPopupVL;
	import core.view.mediator.UIMediator;

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
			return [GeneralNotifications.VALUES_SCORE_TRUE_FALSE_MOVS];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.VALUES_SCORE_TRUE_FALSE_MOVS:
					winPopup.ScoreTrueFalseCounters(notification.getBody() as Array);
					break;
			}
		}
	}
}