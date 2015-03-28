package core.controller.commands
{
	import core.config.GeneralNotifications;
	import core.counters.controller.commands.NumberOfMovesSendCommand;
	import core.queue.controller.commands.DialogCloseCommand;
	import core.queue.controller.commands.DialogLoadToQueueCommand;
	import core.queue.controller.commands.DialogOpenCommand;
	import core.view.mediator.RootMediator;
	
	import flash.display.Sprite;
	
	import gamePlay.bonus.controller.commands.BonusLevelLoadCommand;
	import gamePlay.bonus.controller.commands.BonusPopupShowCommand;
	import gamePlay.bonus.controller.commands.BonusResultOfChoiseCommand;
	import gamePlay.level1.controller.commands.EndTurnCommand;
	import gamePlay.level1.controller.commands.OpenedElementCommand;
	import gamePlay.level1.controller.commands.SelectIsFalseCommand;
	import gamePlay.level1.controller.commands.SelectIsTrueCommand;
	
	import lobby.gameOver.controller.commands.GameOverClosePopupCommand;
	import lobby.gameOver.controller.commands.GameOverCommand;
	import lobby.pause.controller.commands.ContinueGameCommand;
	import lobby.pause.controller.commands.PauseCommand;
	import lobby.pause.controller.commands.StartTimerCommand;
	import lobby.settings.controller.commands.SettingsPanelCloseCommand;
	import lobby.settings.controller.commands.SettingsPanelOpenCommand;
	import lobby.startScreen.controller.commands.StartGameCommand;
	import lobby.topMenu.controller.commands.BackToMenuCommand;
	import lobby.topMenu.controller.commands.RestartCommand;
	import lobby.win.controller.commands.WinCommand;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartAppCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			var rootSprite:Sprite = notification.getBody() as Sprite;
			registerCommand();
			facade.registerMediator(new RootMediator(rootSprite));
			sendNotification(GeneralNotifications.LOAD_URL_REQUEST);
		}
		
		private function registerCommand():void
		{
			facade.registerCommand(GeneralNotifications.BACK_TO_MENU, BackToMenuCommand);
			facade.registerCommand(GeneralNotifications.BONUS_LEVEL_LOAD, BonusLevelLoadCommand);
			facade.registerCommand(GeneralNotifications.BONUS_RESULT_OF_CHOISE, BonusResultOfChoiseCommand);
			facade.registerCommand(GeneralNotifications.BONUS_POPUP_SHOW, BonusPopupShowCommand);
			facade.registerCommand(GeneralNotifications.DIALOG_CLOSE, DialogCloseCommand);
			facade.registerCommand(GeneralNotifications.DIALOG_LOAD_TO_QUEUE, DialogLoadToQueueCommand);
			facade.registerCommand(GeneralNotifications.DIALOG_OPEN, DialogOpenCommand);
			facade.registerCommand(GeneralNotifications.END_TURN, EndTurnCommand);
			facade.registerCommand(GeneralNotifications.GAME_OVER, GameOverCommand);
			facade.registerCommand(GeneralNotifications.GAME_OVER_CLOSE_POPUP, GameOverClosePopupCommand);
			facade.registerCommand(GeneralNotifications.LOAD_URL_REQUEST, LoadUrlRequestCommand);
			facade.registerCommand(GeneralNotifications.NEXT_LEVEL, NextLevelCommand);
			facade.registerCommand(GeneralNotifications.NUMBER_OF_MOVES, NumberOfMovesSendCommand);
			facade.registerCommand(GeneralNotifications.ON_OPEN_ELEMENT, OpenedElementCommand);
			facade.registerCommand(GeneralNotifications.PAUSE, PauseCommand);
			facade.registerCommand(GeneralNotifications.PAUSE_CONTINUE_GAME, ContinueGameCommand);
			facade.registerCommand(GeneralNotifications.RESTART_GAME, RestartCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_TRUE, SelectIsTrueCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_FALSE, SelectIsFalseCommand);
			facade.registerCommand(GeneralNotifications.SETTINGS_PANEL_OPEN, SettingsPanelOpenCommand);
			facade.registerCommand(GeneralNotifications.SETTINGS_PANEL_CLOSE, SettingsPanelCloseCommand);
			facade.registerCommand(GeneralNotifications.START_NEW_GAME, StartGameCommand);
			facade.registerCommand(GeneralNotifications.START_TIMER, StartTimerCommand);
			facade.registerCommand(GeneralNotifications.WIN, WinCommand);
		}
	}
}