package controller.commands
{
	import config.GeneralNotifications;
	
	import model.proxy.ScoreProxy;
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverPopupMediator;
	import view.mediator.LevelMediator;
	import view.mediator.PausePopupMediator;
	
	public class RestartCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(PausePopupMediator.NAME);
			facade.removeMediator(GameOverPopupMediator.NAME);
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).resetLevelScoreCounter();
			(facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy).replayLevel();
		}
	}
}