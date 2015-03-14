package core.view.mediator
{
	import config.GeneralNotifications;
	
	import core.view.components.ViewLogic;
	
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class DialogMediator extends Mediator
	{
		private var background:Sprite;
		
		public function DialogMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			addBackground();
		}
		
		override public function onRegister():void{
			sendNotification(GeneralNotifications.ADD_CHILD_TO_ROOT, background);
			onRegisterListeners();
		}
		
		override public function onRemove():void{
			sendNotification(GeneralNotifications.REMOVE_CHILD_FROM_ROOT, background);
			sendNotification(GeneralNotifications.DIALOG_CLOSE);
			onRemoveListeners();
		}
		
		protected function get viewLogic():ViewLogic
		{
			return viewComponent as ViewLogic;
		}
		
		public function onRegisterListeners():void
		{
			
		}
		
		public function onRemoveListeners():void
		{
			
		}
		
		private function addBackground():void
		{
			background = new Sprite();
			var graf:Graphics = background.graphics;
			graf.beginFill(0x150000, 0.5);
			graf.drawRect(0,0,640,555);
			graf.endFill();
			background.addChild(viewLogic.content);
		}
	}
}