package lobby.settings.view.mediator
{
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	
	import core.view.mediator.UIMediator;
	
	import flash.events.Event;
	
	import lobby.settings.view.components.SettingsPanelVL;
	
	public class SettingsPanelMediator extends UIMediator
	{
		public static var NAME:String = "SettingsPanelMediator";
		
		public function SettingsPanelMediator()
		{
			super(NAME, new SettingsPanelVL());
		}
		
		private function get settingsPanel():SettingsPanelVL
		{
			return viewLogic as SettingsPanelVL;
		}
		override public function onRegisterListeners():void
		{
			settingsPanel.addEventListener(GeneralEventsConst.CLOSE_SETTINGS_PANEL, onCloseSettingPanelHand);
			settingsPanel.addEventListener(GeneralEventsConst.MUTE, onMuteHand); //дубль кода... порешать
			settingsPanel.addEventListener(GeneralEventsConst.FULL_SCREEN, onFullScreenHand); ////дубль кода... порешать
		}
		override public function onRemoveListeners():void
		{
			settingsPanel.removeEventListener(GeneralEventsConst.CLOSE_SETTINGS_PANEL, onCloseSettingPanelHand);
			settingsPanel.removeEventListener(GeneralEventsConst.MUTE, onMuteHand); //дубль кода... порешать
			settingsPanel.removeEventListener(GeneralEventsConst.FULL_SCREEN, onFullScreenHand); //дубль кода... порешать
		}
		
		protected function onCloseSettingPanelHand(event:Event):void
		{
			sendNotification(GeneralNotifications.CLOSE_SETTINGS_PANEL);
		}
		
		private function onMuteHand(event:Event):void //дубль кода... порешать
		{
			sendNotification(GeneralNotifications.MUTE);
		}
		
		protected function onFullScreenHand(event:Event):void //дубль кода... порешать
		{
			sendNotification(GeneralNotifications.FULL_SCREEN);
		}
	}
}