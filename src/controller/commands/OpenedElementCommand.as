package controller.commands
{
	import flash.display.MovieClip;
	
	import model.dto.ElementDto;
	import model.proxy.StartGameProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class OpenedElementCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void{
			/*var note:MovieClip = notification.getBody() as MovieClip;
			var openElem:StartGameProxy;
			openElem = facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy;
			openElem.openElement(note);*/
			
			(facade.retrieveProxy(StartGameProxy.NAME) as StartGameProxy).openElement(notification.getBody() as ElementDto);
		}
	}
}