package controller.commands
{
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import utils.Warehouse;
	
	import view.mediator.StartScreenMediator;
	
	public class LoadFlashCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			loadFlash();
		}
		
		private function loadFlash():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
			var urlRequest:URLRequest = new URLRequest ("res/newGame.swf");
			loader.load(urlRequest);
		}
		
		protected function onLoad(event:Event):void
		{
			var loaderInfo:LoaderInfo = event.target as LoaderInfo;
			loaderInfo.removeEventListener(Event.COMPLETE, onLoad);
			Warehouse.getInstance().setData(loaderInfo);
			
			facade.registerMediator(new StartScreenMediator());
		}
	}
}