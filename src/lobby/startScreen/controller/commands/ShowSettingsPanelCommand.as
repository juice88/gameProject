package lobby.startScreen.controller.commands
{
	import lobby.settings.view.mediator.SettingsPanelMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ShowSettingsPanelCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new SettingsPanelMediator());
		}
	}
}