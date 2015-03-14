package lobby.settings.controller.commands
{
	import config.GeneralNotifications;
	
	import lobby.settings.view.mediator.SettingsPanelMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SettingsPanelCloseCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(SettingsPanelMediator.NAME);
		}
	}
}