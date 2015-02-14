package controller.commands
{
	import model.proxy.ScoreProxy;
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.BotPanelMediator;
	import view.mediator.GameOverPopupMediator;
	import view.mediator.LevelMediator;
	import view.mediator.StartScreenMediator;
	import view.mediator.TopPanelMediator;
	import view.mediator.WinPopupMediator;
	
	public class BackToMenuCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			
			facade.removeMediator(LevelMediator.NAME);
			facade.removeMediator(TopPanelMediator.NAME);
			facade.removeMediator(BotPanelMediator.NAME);
			facade.removeMediator(WinPopupMediator.NAME);
			facade.removeProxy(ScoreProxy.NAME);
			facade.removeProxy(StartGameProxy.NAME);
			facade.registerMediator(new StartScreenMediator());
		}
	}
}