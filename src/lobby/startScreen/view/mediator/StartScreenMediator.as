package lobby.startScreen.view.mediator
{
	
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import lobby.startScreen.view.components.StartViewLogic;
	import core.view.mediator.UIMediator;
	
	public class StartScreenMediator extends UIMediator
	{
		public static var NAME:String = "StartMediaor";
		public function StartScreenMediator()
		{
			super(NAME, new StartViewLogic());
			//(viewLogic as StartViewLogic).addEventListener(GeneralEventsConst.START_GAME, onStartGameEvent);
		}
		
		private function get startScreen():StartViewLogic
		{
			return viewLogic as StartViewLogic;
		}
		override public function onRegisterListeners():void
		{
			startScreen.addEventListener(GeneralEventsConst.START_GAME, onStartGameHand);
		}
		override public function onRemoveListeners():void
		{
			startScreen.removeEventListener(GeneralEventsConst.START_GAME, onStartGameHand);
		}
		
		protected function onStartGameHand(event:Event):void
		{
			trace ("нажата кнопка Start");
			sendNotification(GeneralNotifications.START_GAME);
		}
	}
}