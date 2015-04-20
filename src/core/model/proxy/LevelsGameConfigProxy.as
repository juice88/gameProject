package core.model.proxy
{
	import core.config.GeneralNotifications;
	import core.model.dto.ConfigDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class LevelsGameConfigProxy extends Proxy
	{
		public static const NAME:String = "LevelsGameConfigProxy";
		
		public function LevelsGameConfigProxy()
		{
			super(NAME, new ConfigDto());
		}
		
		public function get configDto():ConfigDto
		{
			return getData() as ConfigDto;
		}
		
		override public function onRegister():void
		{
			configDto.levelNum = 1;
		}
		
		public function setLevelConfig():void
		{
			if (configDto.levelNum == 1)
			{
				configDto.elemNum = 20;
				configDto.framesBeginNum = 1;
				configDto.framesNum = 5;
				configDto.nameOfGameField = "FirstField";
				configDto.openElemLimit = 2;
				configDto.showElemDelay = 2000;
				configDto.minute = 0;
				configDto.second = 15;
				configDto.scoreOneSel = 10;
				configDto.scoreMoreSel = 30;
				configDto.numSelForScoreMoreSel = 3;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
			}
			else if (configDto.levelNum == 2)
			{
				configDto.elemNum = 24;
				configDto.framesBeginNum = 6;
				configDto.framesNum = 10;
				configDto.nameOfGameField = "SecondField";
				configDto.openElemLimit = 3;
				configDto.showElemDelay = 5000;
				configDto.minute = 1;
				configDto.second = 30;
				configDto.scoreOneSel = 20;
				configDto.scoreMoreSel = 50;
				configDto.numSelForScoreMoreSel = 2;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
			}
			else
			{
				configDto.elemNum = 20;
				configDto.framesBeginNum = 1;
				configDto.framesNum = 5;
				configDto.nameOfGameField = "FirstField";
				configDto.openElemLimit = 2;
				configDto.showElemDelay = 2000;
				configDto.minute = 0;
				configDto.second = 15;
				configDto.scoreOneSel = 10;
				configDto.scoreMoreSel = 30;
				configDto.numSelForScoreMoreSel = 3;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
				configDto.levelNum = 1;
			}
		}
		public function setLevelNum():void
		{
			configDto.levelNum++;
		}
	}
}