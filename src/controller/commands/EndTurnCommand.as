package controller.commands
{
	
	
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class EndTurnCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			(facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy).endTurn();
		}
		
		
	}
}