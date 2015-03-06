package lobby.pause.controller.commands
{
	import gamePlay.counters.model.proxy.ScoreProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import lobby.pause.view.mediator.PausePopupMediator;
	
	public class ContinueGameCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(PausePopupMediator.NAME);
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).timerStart();
		}
	}
}