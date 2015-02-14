package controller.commands
{
	import config.GeneralNotifications;
	
	import flash.display.Sprite;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.RootMediator;
	import view.mediator.StartScreenMediator;
	
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
			facade.registerCommand(GeneralNotifications.START_GAME, StartGameCommand);
			facade.registerCommand(GeneralNotifications.BACK_TO_MENU, BackToMenuCommand);
			facade.registerCommand(GeneralNotifications.NUMBER_OF_MOVES, NumberOfMovesSendCommand);
			facade.registerCommand(GeneralNotifications.ON_OPEN_ELEMENT, OpenedElementCommand);
			facade.registerCommand(GeneralNotifications.END_TURN, EndTurnCommand);
			facade.registerCommand(GeneralNotifications.RESTART_GAME, RestartCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_TRUE, SelectIsTrueCommand);
			facade.registerCommand(GeneralNotifications.SELECT_IS_FALSE, SelectIsFalseCommand);
			facade.registerCommand(GeneralNotifications.PAUSE, PauseCommand);
			facade.registerCommand(GeneralNotifications.CONTINUE_GAME, ContinueGameCommand);
			facade.registerCommand(GeneralNotifications.GAME_OVER, GameOverCommand);
			facade.registerCommand(GeneralNotifications.WIN, WinCommand);
		}
	}
}