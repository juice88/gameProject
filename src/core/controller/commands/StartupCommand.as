package core.controller.commands
{
	import config.GeneralNotifications;
	
	import core.view.mediator.RootMediator;
	
	import flash.display.Sprite;
	
	import gamePlay.bonus.controller.commands.BonusCommand;
	import gamePlay.counters.controller.commands.NumberOfMovesSendCommand;
	import gamePlay.level1.controller.commands.EndTurnCommand;
	import gamePlay.level1.controller.commands.OpenedElementCommand;
	import gamePlay.level1.controller.commands.SelectIsFalseCommand;
	import gamePlay.level1.controller.commands.SelectIsTrueCommand;
	
	import lobby.gameOver.controller.commands.GameOverCommand;
	import lobby.pause.controller.commands.ContinueGameCommand;
	import lobby.pause.controller.commands.PauseCommand;
	import lobby.pause.controller.commands.StartTimerCommand;
	import lobby.settings.controller.commands.CloseSettingsPanelCommand;
	import lobby.startScreen.controller.commands.ShowSettingsPanelCommand;
	import lobby.startScreen.controller.commands.StartGameCommand;
	import lobby.startScreen.view.mediator.StartScreenMediator;
	import lobby.topMenu.controller.commands.BackToMenuCommand;
	import lobby.topMenu.controller.commands.RestartCommand;
	import lobby.win.controller.commands.WinCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			
			registerCommand();
			sendNotification(GeneralNotifications.LOAD_FLASH);
			var rootSprite:Sprite = notification.getBody() as Sprite;
			facade.registerMediator(new RootMediator(rootSprite));
		}
		private function registerCommand():void
		{
			facade.registerCommand(GeneralNotifications.LOAD_FLASH, LoadFlashCommand);
			facade.registerCommand(GeneralNotifications.START_NEW_GAME, StartGameCommand);
			facade.registerCommand(GeneralNotifications.BACK_TO_MENU, BackToMenuCommand);
			facade.registerCommand(GeneralNotifications.NUMBER_OF_MOVES, NumberOfMovesSendCommand);
			facade.registerCommand(GeneralNotifications.ON_OPEN_ELEMENT, OpenedElementCommand);
			facade.registerCommand(GeneralNotifications.END_TURN, EndTurnCommand);
			facade.registerCommand(GeneralNotifications.RESTART_GAME, RestartCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_TRUE, SelectIsTrueCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_FALSE, SelectIsFalseCommand);
			facade.registerCommand(GeneralNotifications.PAUSE, PauseCommand);
			facade.registerCommand(GeneralNotifications.PAUSE_CONTINUE_GAME, ContinueGameCommand);
			facade.registerCommand(GeneralNotifications.GAME_OVER, GameOverCommand);
			facade.registerCommand(GeneralNotifications.WIN, WinCommand);
			facade.registerCommand(GeneralNotifications.START_TIMER, StartTimerCommand);
			facade.registerCommand(GeneralNotifications.BONUS, BonusCommand);
			facade.registerCommand(GeneralNotifications.SHOW_SETTINGS_PANEL, ShowSettingsPanelCommand);
			facade.registerCommand(GeneralNotifications.CLOSE_SETTINGS_PANEL, CloseSettingsPanelCommand);
		}
	}
}