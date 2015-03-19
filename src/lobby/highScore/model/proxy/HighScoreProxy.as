package lobby.highScore.model.proxy
{
	import lobby.highScore.model.dto.HighScoreDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class HighScoreProxy extends Proxy
	{
		public static var NAME:String = "HighScoreProxy";
		
		public function HighScoreProxy()
		{
			super(NAME, new HighScoreDto());
		}
		
		private function get highScore():HighScoreDto
		{
			return getData() as HighScoreDto;
		}
	}
}