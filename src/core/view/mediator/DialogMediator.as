package core.view.mediator
{
	import config.GeneralNotifications;
	
	import core.view.components.ViewLogic;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class DialogMediator extends Mediator
	{
		public function DialogMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function onRegister():void{
			sendNotification(GeneralNotifications.ADD_CHILD_TO_ROOT, viewLogic.content);
			onRegisterListeners();
		}
		
		override public function onRemove():void{
			sendNotification(GeneralNotifications.REMOVE_CHILD_FROM_ROOT, viewLogic.content);
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
	}
}