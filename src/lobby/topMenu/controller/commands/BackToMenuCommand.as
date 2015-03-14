package lobby.topMenu.controller.commands
{
	import core.queue.model.proxy.QueueDialogProxy;
	
	import gamePlay.counters.model.proxy.ScoreProxy;
	import gamePlay.level1.model.proxy.StartLevelProxy;
	import gamePlay.level1.view.mediator.LevelMediator;
	
	import lobby.botMenu.view.mediator.BotPanelMediator;
	import lobby.gameOver.view.mediator.GameOverPopupMediator;
	import lobby.startScreen.view.mediator.StartScreenMediator;
	import lobby.topMenu.view.mediator.TopPanelMediator;
	import lobby.win.view.mediator.WinPopupMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BackToMenuCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			
			facade.removeMediator(LevelMediator.NAME);
			facade.removeMediator(TopPanelMediator.NAME);
			facade.removeMediator(BotPanelMediator.NAME);
			facade.removeMediator(WinPopupMediator.NAME);
			facade.removeProxy(ScoreProxy.NAME);
			facade.removeProxy(StartLevelProxy.NAME);
			facade.registerMediator(new StartScreenMediator());
		}
	}
}