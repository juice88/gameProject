package core.controller.commands
{
	import core.SharedObject.model.proxy.SharedObjProxy;
	import core.queue.model.proxy.QueueDialogProxy;
	import core.utils.Warehouse;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import lobby.enterName.view.mediator.EnterNameMediator;
	import lobby.highScore.model.proxy.HighScoreProxy;
	import lobby.highScore.view.mediator.HighScorePanelMediator;
	import lobby.startScreen.view.mediator.StartScreenMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class LoadUrlRequestCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			LoadUrlRequest();
		}
		
		private function LoadUrlRequest():void
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
			
			startScreenLoad();
		}
		
		private function startScreenLoad():void
		{
			facade.registerProxy(new SharedObjProxy());
			facade.registerProxy(new QueueDialogProxy());
			facade.registerMediator(new StartScreenMediator());
			facade.registerProxy(new HighScoreProxy());
			facade.registerMediator(new HighScorePanelMediator());
			facade.registerMediator(new EnterNameMediator());
		}
	}
}