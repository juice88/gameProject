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
	import view.mediator.WinPopupMediator;
	
	public class RestartCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(PausePopupMediator.NAME);
			facade.removeMediator(GameOverPopupMediator.NAME);
			facade.removeMediator(WinPopupMediator.NAME);
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).resetLevelCounters();
			(facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy).replayLevel();
		}
	}
}