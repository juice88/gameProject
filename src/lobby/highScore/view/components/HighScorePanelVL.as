package lobby.highScore.view.components
{
	import core.view.components.ViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class HighScorePanelVL extends ViewLogic
	{
		private var _allPlayersBtn:SimpleButton;
		private var _myFriendsBtn:SimpleButton;
		
		public function HighScorePanelVL()
		{
			super("HighScore");
			highScoreLoad();
		}
		
		public function get highScore():MovieClip
		{
			return content as MovieClip;
		}
		
		private function highScoreLoad():void
		{
			_allPlayersBtn = highScore["allPlayersBtn"];
			_allPlayersBtn.addEventListener(MouseEvent.CLICK, onAllPlayersBtnClickHand);
			_myFriendsBtn = highScore["myFriendsBtn"];
			_myFriendsBtn.addEventListener(MouseEvent.CLICK, onMyFriendsBtnClickHand);
		}
		
		protected function onAllPlayersBtnClickHand(event:MouseEvent):void
		{
			trace("показати скор усіх гравців, кнопка allPlayersBtn");
		}
		
		protected function onMyFriendsBtnClickHand(event:MouseEvent):void
		{
			trace("показати скор друзів, кнопка myFriendsBtn");
		}
	}
}