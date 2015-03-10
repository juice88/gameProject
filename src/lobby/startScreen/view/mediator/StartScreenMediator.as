package lobby.startScreen.view.mediator
{
	
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import core.view.mediator.UIMediator;
	
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import lobby.startScreen.view.components.StartViewLogic;
	
	import org.puremvc.as3.interfaces.INotification;
	
	public class StartScreenMediator extends UIMediator
	{
		public static var NAME:String = "StartMediaor";
		
		public function StartScreenMediator()
		{
			super(NAME, new StartViewLogic());
		}
		
		private function get startScreen():StartViewLogic
		{
			return viewLogic as StartViewLogic;
		}
		override public function onRegisterListeners():void
		{
			startScreen.addEventListener(GeneralEventsConst.START_NEW_GAME, onStartGameHand);
			startScreen.addEventListener(GeneralEventsConst.CONTINUE_GAME, onContinueGameHand);
			startScreen.addEventListener(GeneralEventsConst.SHOW_SETTINGS_PANEL, onShowSettingsPanelHand);
		}
		
		override public function onRemoveListeners():void
		{
			startScreen.removeEventListener(GeneralEventsConst.START_NEW_GAME, onStartGameHand);
			startScreen.removeEventListener(GeneralEventsConst.CONTINUE_GAME, onContinueGameHand);
			startScreen.removeEventListener(GeneralEventsConst.SHOW_SETTINGS_PANEL, onShowSettingsPanelHand);
		}
		
		protected function onStartGameHand(event:Event):void
		{
			trace ("нажата кнопка New Game");
			sendNotification(GeneralNotifications.START_NEW_GAME);
		}
		
		protected function onContinueGameHand(event:Event):void
		{
			trace ("нажата кнопка Continue game");
		}
		
		protected function onShowSettingsPanelHand(event:Event):void
		{
			trace ("нажата кнопка settings");
			sendNotification(GeneralNotifications.SHOW_SETTINGS_PANEL);
		}		
		
	}
}