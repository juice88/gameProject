package lobby.startScreen.controller.commands
{
	import core.counters.model.proxy.ScoreProxy;
	
	import gamePlay.level1.model.proxy.StartLevelProxy;
	import gamePlay.level1.view.mediator.LevelMediator;
	
	import lobby.botMenu.view.mediator.BotPanelMediator;
	import lobby.highScore.view.mediator.HighScorePanelMediator;
	import lobby.startScreen.view.mediator.StartScreenMediator;
	import lobby.topMenu.view.mediator.TopPanelMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartGameCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.removeMediator(HighScorePanelMediator.NAME);
			facade.removeMediator(StartScreenMediator.NAME);
			facade.registerMediator(new TopPanelMediator());
			facade.registerMediator(new BotPanelMediator());
			facade.registerMediator(new LevelMediator());
			facade.registerProxy(new ScoreProxy());
			facade.registerProxy(new StartLevelProxy());
		}
	}
}