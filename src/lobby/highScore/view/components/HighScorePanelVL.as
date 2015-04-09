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
		private var _friendsScorePanel:MyFriendsHighScorePanel;
		private var _friendsScorePanelOnScene:Boolean = false;
		
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
			_friendsScorePanel = new MyFriendsHighScorePanel();
			_allPlayersBtn = highScore["allPlayersBtn"];
			_allPlayersBtn.addEventListener(MouseEvent.CLICK, onAllPlayersBtnClickHand);
			_myFriendsBtn = highScore["myFriendsBtn"];
			_myFriendsBtn.addEventListener(MouseEvent.CLICK, onMyFriendsBtnClickHand);
		}
		
		protected function onAllPlayersBtnClickHand(event:MouseEvent):void
		{
			if (_friendsScorePanelOnScene == true)
			{
				highScore.removeChild(_friendsScorePanel.friendScore);
				_friendsScorePanelOnScene = false;
			}
		}
		
		protected function onMyFriendsBtnClickHand(event:MouseEvent):void
		{
			_friendsScorePanelOnScene = true;
			highScore.addChild(_friendsScorePanel.friendScore);
		}
	}
}