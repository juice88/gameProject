package lobby.highScore.view.components
{
	import core.view.components.ViewLogic;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class HighScorePanelVL extends ViewLogic
	{
		private var allPlayersBtn:SimpleButton;
		private var myFriendsBtn:SimpleButton;
		
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
			allPlayersBtn = highScore["allPlayersBtn"];
			allPlayersBtn.addEventListener(MouseEvent.CLICK, onAllPlayersBtnClickHand);
			myFriendsBtn = highScore["myFriendsBtn"];
			myFriendsBtn.addEventListener(MouseEvent.CLICK, onMyFriendsBtnClickHand);
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