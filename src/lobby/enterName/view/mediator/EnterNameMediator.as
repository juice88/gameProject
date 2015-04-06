package lobby.enterName.view.mediator
{
	import core.config.GeneralEventsConst;
	import core.config.GeneralNotifications;
	import core.view.mediator.DialogMediator;
	
	import flash.events.Event;
	
	import lobby.enterName.view.components.EnterNamePopupVL;
	
	public class EnterNameMediator extends DialogMediator
	{
		public static const NAME:String = "EnterNameMediator";
		
		public function EnterNameMediator()
		{
			super(NAME, new EnterNamePopupVL());
		}
		
		private function get enterName():EnterNamePopupVL
		{
			return viewLogic as EnterNamePopupVL;
		}
		
		override public function onRegisterListeners():void
		{
			enterName.addEventListener(GeneralEventsConst.ENTER_NAME_POPUP_CLOSE, onCloseEnterNamePopupHand);
			enterName.addEventListener(GeneralEventsConst.SET_PLAYER_NAME, onSetPlayerName);
		}
		
		protected function onSetPlayerName(event:Event):void
		{
			sendNotification(GeneralNotifications.REMOVE_MEDIATOR, NAME);
		}
		
		protected function onCloseEnterNamePopupHand(event:Event):void
		{
			sendNotification(GeneralNotifications.REMOVE_MEDIATOR, NAME);
		}
	}
}