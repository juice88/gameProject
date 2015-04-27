package lobby.highScore.model.proxy
{
	import core.sharedObject.model.proxy.SharedObjProxy;
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
			if (usName == null)
			{
				highScoreDto.userDto.userName = "undefined"; //якщо вікно введеня імені було просто зактрито, тоді замінюємо ім"я на undefined
			}
			else
			{
				highScoreDto.userDto.userName = usName;
			}
			sendNotification(GeneralNotifications.SET_NAME_LEVEL_AND_SCORE_IN_SO, highScoreDto.userDto);
			trace ("1   SET_NAME_LEVEL_AND_SCORE_IN_SO після введеня імені Левел #", highScoreDto.userDto.numLevel);
		}
		
	public function setNumLevel(numLevel:int):void
		{
			highScoreDto.userDto.numLevel = numLevel;
			trace ("2   setNumLevel після запуска левела Левел #", numLevel);
		}
		
		public function setUserScore(usScore:uint):void
		{
			if (highScoreDto.userDto.userName == null)
			{
				highScoreDto.userDto.userName = "undefined"; //якщо вікно введеня імені було просто зактрито, тоді замінюємо ім"я на undefined
			}
			else
			{
				highScoreDto.userDto.userScore = usScore;
			}
			sendNotification(GeneralNotifications.SET_NAME_LEVEL_AND_SCORE_IN_SO, highScoreDto.userDto);
			trace ("3   SET_NAME_LEVEL_AND_SCORE_IN_SO після виграшу Левел #", highScoreDto.userDto.numLevel);
		}
	}
}