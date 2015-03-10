package lobby.settings.controller.commands
{
	import lobby.settings.view.mediator.SettingsPanelMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class CloseSettingsPanelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(SettingsPanelMediator.NAME);
		}
	}
}