package lobby.pause.controller.commands
{
	import gamePlay.counters.model.proxy.ScoreProxy;
	import gamePlay.level1.model.proxy.StartLevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import lobby.pause.view.mediator.PausePopupMediator;
	import lobby.win.view.mediator.WinPopupMediator;
	
	public class PauseCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new PausePopupMediator());
			(facade.retrieveProxy(StartLevelProxy.NAME) as StartLevelProxy).pauseGame();
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).openPausePopup();
		}
	}
}