package gamePlay.level1.controller.commands
{
	import flash.display.MovieClip;
	
	import gamePlay.level1.model.dto.ElementDto;
	import gamePlay.level1.model.proxy.StartLevelProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class OpenedElementCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			/*var note:MovieClip = notification.getBody() as MovieClip;
			var openElem:StartGameProxy;
			openElem = facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy;
			openElem.openElement(note);*/
			
			(facade.retrieveProxy(StartLevelProxy.NAME) as StartLevelProxy).openElement(notification.getBody() as ElementDto);
		}
	}
}