package lobby.highScore.view.mediator
{
	import core.view.mediator.UIMediator;
	
	import lobby.highScore.view.components.HighScorePanelVL;
	
	public class HighScorePanelMediator extends UIMediator
	{
		public static var NAME:String = "HighScorePanelMediator";
		
		public function HighScorePanelMediator()
		{
			super(NAME, new HighScorePanelVL());
		}
		
		private function get highScoreVL():HighScorePanelVL
		{
			return viewLogic as HighScorePanelVL;
		}
	}
}