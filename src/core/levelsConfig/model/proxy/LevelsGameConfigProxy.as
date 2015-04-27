package core.levelsConfig.model.proxy
{
	import core.config.GeneralNotifications;
	import core.levelsConfig.model.dto.ConfigDto;
	import core.sharedObject.model.dto.ContinGameConfDto;
	
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
		
		public function newGame():void
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
				configDto.elemName = "Element";
				configDto.openElemLimit = 2;
				configDto.showElemDelay = 2000;
				configDto.minute = 0;
				configDto.second = 40;
				configDto.scoreOneSel = 10;
				configDto.scoreMoreSel = 30;
				configDto.numSelForScoreMoreSel = 3;
			//	configDto.levelNum--;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
			}
			else if (configDto.levelNum == 2)
			{
				configDto.elemNum = 24;
				configDto.framesBeginNum = 6;
				configDto.framesNum = 10;
				configDto.nameOfGameField = "SecondField";
				configDto.elemName = "Element";
				configDto.openElemLimit = 3;
				configDto.showElemDelay = 5000;
				configDto.minute = 1;
				configDto.second = 30;
				configDto.scoreOneSel = 20;
				configDto.scoreMoreSel = 50;
				configDto.numSelForScoreMoreSel = 2;
				//configDto.levelNum--;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
			}
			else
			{
				configDto.elemNum = 20;
				configDto.framesBeginNum = 1;
				configDto.framesNum = 54;
				configDto.nameOfGameField = "FirstField";
				configDto.elemName = "ElementMult";
				configDto.openElemLimit = 2;
				configDto.showElemDelay = 10000;
				configDto.minute = 0;
				configDto.second = 40;
				configDto.scoreOneSel = 10;
				configDto.scoreMoreSel = 30;
				configDto.numSelForScoreMoreSel = 3;
				configDto.levelNum = 0;
				sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
			}
			sendNotification(GeneralNotifications.SET_NUM_LEVEL, configDto.levelNum);
		}
		
		public function addLevelNum():void
		{
			configDto.levelNum++;
		}
		
		public function setLevelNum(contGameDto:ContinGameConfDto):void
		{
			configDto.levelNum = contGameDto.numLvl + 1; // додається на 1 левел більше, адже numLevel це поточний левел, який пройшов гравець
		}
	}
}