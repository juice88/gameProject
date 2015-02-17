package controller.commands
{
	import model.proxy.ScoreProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartTimerCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).timerGame();
		}
	}
}