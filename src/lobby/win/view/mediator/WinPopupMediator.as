package lobby.win.view.mediator
{
	import config.GeneralNotifications;
	
	import core.view.mediator.DialogMediator;
	
	import lobby.win.view.components.WinPopupVL;
	
	import org.puremvc.as3.interfaces.INotification;

	public class WinPopupMediator extends DialogMediator
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
			return [GeneralNotifications.VALUES_SCORE_TRUE_FALSE_MOVES];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.VALUES_SCORE_TRUE_FALSE_MOVES:
					winPopup.ScoreTrueFalseCounters(notification.getBody() as Array);
					break;
			}
		}
	}
}