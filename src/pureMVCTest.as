package
{
	import config.GeneralNotifications;
	
	import core.controller.commands.StartAppCommand;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	[SWF (width = '640', height='555', frameRate='24', backgroundColor = '#FFFFFF')]
	public class pureMVCTest extends Sprite
	{
		public function pureMVCTest()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			Facade.getInstance().registerCommand(GeneralNotifications.START_APP, StartAppCommand);
			Facade.getInstance().sendNotification(GeneralNotifications.START_APP, this);
		}
	}
}