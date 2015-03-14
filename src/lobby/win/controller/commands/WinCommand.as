package lobby.win.controller.commands
{
	import config.GeneralNotifications;
	
	import lobby.win.view.mediator.WinPopupMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class WinCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
		//	facade.registerMediator(new WinPopupMediator());
			var winPop:WinPopupMediator = new WinPopupMediator();
			sendNotification(GeneralNotifications.DIALOG_LOAD_TO_QUEUE, winPop);
		}
	}
}