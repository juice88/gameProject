package lobby.highScore.model.proxy
{
	import core.SharedObject.model.proxy.SharedObjProxy;
	import core.config.GeneralNotifications;
	
	import lobby.highScore.model.dto.HighScoreDto;
	import lobby.highScore.model.dto.UserDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class HighScoreProxy extends Proxy
	{
		public static const NAME:String = "HighScoreProxy";
		
		public function HighScoreProxy()
		{
			super(NAME, new HighScoreDto());
		}
		
		private function get highScoreDto():HighScoreDto
		{
			return getData() as HighScoreDto;
		}
		
		override public function onRegister():void
		{
			highScoreDto.userDtoArr = new Array();
			highScoreDto.userDto = new UserDto();
		}
		
		public function setUserName(usName:String):void
		{
			highScoreDto.userDto.userName = usName;
		}
		
		public function setUserScore(usScore:uint):void
		{
			highScoreDto.userDto.userScore = usScore;
			sendNotification(GeneralNotifications.SET_NAME_AND_SCORE_IN_SO, highScoreDto.userDto);
		}
	}
}