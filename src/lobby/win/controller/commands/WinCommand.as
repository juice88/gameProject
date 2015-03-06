package lobby.win.controller.commands
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import lobby.win.view.mediator.WinPopupMediator;
	
	public class WinCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new WinPopupMediator());
		}
	}
}