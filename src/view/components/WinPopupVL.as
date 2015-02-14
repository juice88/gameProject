package view.components
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.setTimeout;

	public class WinPopupVL extends ViewLogic
	{
		private var totalScore:TextField;
		private var trueMoves:TextField;
		private var falseMoves:TextField;
		
		public function WinPopupVL()
		{
			super("WinPopup");
			winPopupLoad();
		}
		
		private function get winPopup():MovieClip
		{
			return content as MovieClip;
		}
		
		private function winPopupLoad():void
		{
			winPopup.visible = false;
			winPopup.gotoAndStop(2);
			
		}
		
		public function ScoreTrueFalseCounters(value:Array):void
		{
			totalScore = winPopup.totalScore.scoreTf;
			totalScore.text = value[0].toString(10);
			trueMoves = winPopup.trueMoves.movesTf;
			trueMoves.text = value[1].toString(10);
			falseMoves = winPopup.falseMoves.movesTf;
			falseMoves.text = value[2].toString(10);
			winPopup.visible = true;
		}
	}
}