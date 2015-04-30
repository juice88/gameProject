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
			switch (configDto.levelNum)
			{
				case 1:
					configDto.elemNum = 6;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 5;
					configDto.nameOfGameField = "Field3x2";
					configDto.elemName = "ElementColors";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 1000;
					configDto.minute = 0;
					configDto.second = 20;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 10;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 2:
					configDto.elemNum = 8;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 5;
					configDto.nameOfGameField = "Field4x2";
					configDto.elemName = "ElementColors";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 1500;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 3:
					configDto.elemNum = 12;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 5;
					configDto.nameOfGameField = "Field4x3";
					configDto.elemName = "ElementColors";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 2000;
					configDto.minute = 0;
					configDto.second = 40;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 25;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 4:
					configDto.elemNum = 9;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 5;
					configDto.nameOfGameField = "Field3x3";
					configDto.elemName = "ElementColors";
					configDto.openElemLimit = 3;
					configDto.showElemDelay = 1000;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 2;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				
				case 5:
					configDto.elemNum = 6;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 10;
					configDto.nameOfGameField = "Field3x2";
					configDto.elemName = "ElementNumbers";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 1000;
					configDto.minute = 0;
					configDto.second = 20;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 10;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 6:
					configDto.elemNum = 8;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 10;
					configDto.nameOfGameField = "Field4x2";
					configDto.elemName = "ElementNumbers";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 1500;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 7:
					configDto.elemNum = 12;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 10;
					configDto.nameOfGameField = "Field4x3";
					configDto.elemName = "ElementNumbers";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 2000;
					configDto.minute = 0;
					configDto.second = 40;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 25;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 8:
					configDto.elemNum = 9;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 10;
					configDto.nameOfGameField = "Field3x3";
					configDto.elemName = "ElementNumbers";
					configDto.openElemLimit = 3;
					configDto.showElemDelay = 1000;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 2;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				
				case 9:
					configDto.elemNum = 6;
					configDto.framesBeginNum = 1;
					configDto.framesNum =54;
					configDto.nameOfGameField = "Field3x2";
					configDto.elemName = "ElementMult";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 3000;
					configDto.minute = 0;
					configDto.second = 20;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 10;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 10:
					configDto.elemNum = 8;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 54;
					configDto.nameOfGameField = "Field4x2";
					configDto.elemName = "ElementMult";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 4000;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 5;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 11:
					configDto.elemNum = 12;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 54;
					configDto.nameOfGameField = "Field4x3";
					configDto.elemName = "ElementMult";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 5000;
					configDto.minute = 0;
					configDto.second = 40;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 25;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 12:
					configDto.elemNum = 9;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 54;
					configDto.nameOfGameField = "Field3x3";
					configDto.elemName = "ElementMult";
					configDto.openElemLimit = 3;
					configDto.showElemDelay = 3000;
					configDto.minute = 0;
					configDto.second = 30;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 20;
					configDto.numSelForScoreMoreSel = 2;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				
				case 13:
					configDto.elemNum = 20;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 5;
					configDto.nameOfGameField = "Field5x4";
					configDto.elemName = "ElementColors";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 2000;
					configDto.minute = 0;
					configDto.second = 40;
					configDto.scoreOneSel = 10;
					configDto.scoreMoreSel = 30;
					configDto.numSelForScoreMoreSel = 3;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				case 14:
					configDto.elemNum = 24;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 10;
					configDto.nameOfGameField = "Field6x4";
					configDto.elemName = "ElementNumbers";
					configDto.openElemLimit = 3;
					configDto.showElemDelay = 5000;
					configDto.minute = 1;
					configDto.second = 30;
					configDto.scoreOneSel = 20;
					configDto.scoreMoreSel = 50;
					configDto.numSelForScoreMoreSel = 2;
					sendNotification(GeneralNotifications.SET_LEVEL_CONFIG, configDto);
					break;
				
				default:
					configDto.elemNum = 20;
					configDto.framesBeginNum = 1;
					configDto.framesNum = 54;
					configDto.nameOfGameField = "Field5x4";
					configDto.elemName = "ElementMult";
					configDto.openElemLimit = 2;
					configDto.showElemDelay = 5000;
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