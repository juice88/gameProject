package gamePlay.level1.controller.commands
{
	import gamePlay.counters.model.proxy.ScoreProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SelectIsFalseCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).selectIsFalse();
		}
	}
}