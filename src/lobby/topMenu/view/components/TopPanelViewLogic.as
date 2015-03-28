package lobby.topMenu.view.components
{
	import core.config.GeneralEventsConst;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import core.view.components.ViewLogic;
	

	public class TopPanelViewLogic extends ViewLogic
	{
		private var menuBtn:SimpleButton;
		private var restartBtn:SimpleButton;
		private var pauseBtn:SimpleButton;
		private var movesTf:TextField;
		private var scoreTf:TextField;
		
		public function TopPanelViewLogic()
		{
			super("TopPanel");
			topPanelLoad();
		}
		
		private function get topPanel():MovieClip
		{
			return content as MovieClip;
		}
		
		private function topPanelLoad():void
		{
			menuBtn = topPanel["menuBtn"];
			menuBtn.addEventListener(MouseEvent.CLICK, onMenuBtnClick);
			restartBtn = topPanel["restartBtn"];
			restartBtn.addEventListener(MouseEvent.CLICK, onRestartBtnClick);
			pauseBtn = topPanel["pauseBtn"];
			pauseBtn.addEventListener(MouseEvent.CLICK, onPauseBtnClick);
		}
		
		protected function onMenuBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.GO_TO_MENU));
		}
		
		protected function onRestartBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.RESTART_GAME));
			resetMouseCounter();
		}
		protected function onPauseBtnClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(GeneralEventsConst.PAUSE));
			
		}
		public function movesCounterUpdate(moves:uint):void
		{
			movesTf = topPanel.movesTf.movesTf;
			movesTf.text = moves.toString(10);
			trace("ходів", moves);
		}
		
		private function resetMouseCounter():void //при рестарті обнуляємо лічильник ходів
		{
			if (movesTf!=null)
			{
				movesTf.text = String(0);
			}
		}
		
		public function scoreCounterUpdate(scoreValue:uint):void
		{
			scoreTf = topPanel.scoreTf.scoreTf;
			scoreTf.text = String(scoreValue);
		}
	}
}