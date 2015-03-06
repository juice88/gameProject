package lobby.startScreen.controller.commands
{
	import gamePlay.counters.model.proxy.ScoreProxy;
	import gamePlay.level1.model.proxy.StartLevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import lobby.botMenu.view.mediator.BotPanelMediator;
	import gamePlay.level1.view.mediator.LevelMediator;
	import lobby.startScreen.view.mediator.StartScreenMediator;
	import lobby.topMenu.view.mediator.TopPanelMediator;
	
	public class StartGameCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.removeMediator(StartScreenMediator.NAME);
			facade.registerMediator(new TopPanelMediator());
			facade.registerMediator(new BotPanelMediator());
			facade.registerMediator(new LevelMediator());
			facade.registerProxy(new ScoreProxy());
			facade.registerProxy(new StartLevelProxy());
		}
	}
}