package lobby.startScreen.view.components
{
	import config.GeneralEventsConst;
	
	import core.view.components.ViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import utils.Warehouse;
	
	public class StartViewLogic extends ViewLogic
	{
		private var newGameBtn:SimpleButton;
		private var continueGameBtn:SimpleButton;
		private var settingsBtn:SimpleButton;
		
		
		public function StartViewLogic()
		{
			super("StartScreen");
			startUpScreenLoad();
		}
		private function get startContent():Sprite{
			return content as Sprite;
		}
		
		private function startUpScreenLoad():void
		{
			newGameBtn = startContent["newGameBtn"];
			newGameBtn.addEventListener(MouseEvent.CLICK, onNewGameBtnClickHand);
			continueGameBtn = startContent["continueGameBtn"];
			continueGameBtn.addEventListener(MouseEvent.CLICK, onContinueGameBtnClicHand);
			settingsBtn = startContent["settingsBtn"];
			settingsBtn.addEventListener(MouseEvent.CLICK, onSettingsBtnClickHand);
		}
		
		protected function onNewGameBtnClickHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.START_NEW_GAME));
		}
		
		protected function onContinueGameBtnClicHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.CONTINUE_GAME));
		}
		
		protected function onSettingsBtnClickHand(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.SHOW_SETTINGS_PANEL));
		}
	}
}