package gamePlay.bonus.controller.commands
{
	import config.GeneralNotifications;
	
	import core.counters.model.proxy.ScoreProxy;
	
	import gamePlay.bonus.view.mediator.BonusMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class BonusResultOfChoiseCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(BonusMediator.NAME);
	//		(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).addBonus(notification.getBody() as int);
			sendNotification(GeneralNotifications.WIN);
			(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).resultOfChoiseBonus(notification.getBody() as int);
	//		(facade.retrieveProxy(ScoreProxy.NAME) as ScoreProxy).sendValueScoreTrueFalseMoves();
		}
	}
}