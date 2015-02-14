package controller.commands
{
	import model.proxy.ScoreProxy;
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.PausePopupMediator;
	import view.mediator.WinPopupMediator;
	
	public class PauseCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new PausePopupMediator);
			(facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy).pauseGame();
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).openPausePopup();
		}
	}
}