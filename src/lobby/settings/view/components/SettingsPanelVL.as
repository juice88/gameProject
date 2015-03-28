package lobby.settings.view.components
{
	import core.config.GeneralEventsConst;
	import core.utils.SoundLib;
	import core.view.components.DialogViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class SettingsPanelVL extends DialogViewLogic
	{
		private var closeBtn:SimpleButton;
		private var muteBtn:MovieClip;
		private var fullScreenBtn:SimpleButton;
		private var frameMuteBtn:uint = 1;
		
		public function SettingsPanelVL()
		{
			super("SettingsPanel");
			loadSettingsPanel();
		}
		
		private function get setPanelVL():MovieClip
		{
			return content as MovieClip;
		}
		
		public function loadSettingsPanel():void
		{
			closeBtn = setPanelVL["closeBtn"];
			closeBtn.addEventListener(MouseEvent.CLICK, onCloseBtnClickHand);
			muteBtn = setPanelVL["muteBtn"];
			muteBtn.addEventListener(MouseEvent.CLICK, onMuteBtnClickHand);
			fullScreenBtn = setPanelVL["fullScreenBtn"];
			fullScreenBtn.addEventListener(MouseEvent.CLICK, onFullScreenBtnClickHand);
		}
		
		protected function onCloseBtnClickHand(event:MouseEvent):void
		{
			SoundLib.btnClickSound();
			dispatchEvent(new Event(GeneralEventsConst.CLOSE_SETTINGS_PANEL));
		}
		protected function onMuteBtnClickHand(event:MouseEvent):void
		{
			SoundLib.btnClickSound();
			if (frameMuteBtn == 1)
			{
				frameMuteBtn = 2;
			}
			else 
			{
				frameMuteBtn = 1;
			}
			setPanelVL.muteBtn.gotoAndStop(frameMuteBtn);
			dispatchEvent(new Event(GeneralEventsConst.MUTE));
		}
		
		protected function onFullScreenBtnClickHand(event:MouseEvent):void
		{
			SoundLib.btnClickSound();
			dispatchEvent(new Event(GeneralEventsConst.FULL_SCREEN));
		}
	}
}