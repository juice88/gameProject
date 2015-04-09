package lobby.highScore.controller.commands
{
	import core.SharedObject.model.proxy.SharedObjProxy;
	
	import lobby.highScore.model.dto.UserDto;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SetNameAndScoreInSOCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			(facade.retrieveProxy(SharedObjProxy.NAME) as SharedObjProxy).setUserNameEndScore(notification.getBody() as UserDto);
		}
	}
}