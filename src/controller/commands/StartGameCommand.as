package controller.commands
{
	import model.proxy.ScoreProxy;
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.BotPanelMediator;
	import view.mediator.LevelMediator;
	import view.mediator.StartScreenMediator;
	import view.mediator.TopPanelMediator;
	
	public class StartGameCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			facade.removeMediator(StartScreenMediator.NAME);
			facade.registerMediator(new TopPanelMediator());
			facade.registerMediator(new BotPanelMediator());
			facade.registerMediator(new LevelMediator());
			facade.registerProxy(new StartGameProxy());
			facade.registerProxy(new ScoreProxy());
		}
	}
}