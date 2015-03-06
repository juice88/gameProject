package gamePlay.bonus.view.mediator
{
	import config.GeneralNotifications;
	
	import core.view.mediator.UIMediator;
	
	import gamePlay.bonus.model.dto.ElemBonusDto;
	import gamePlay.bonus.view.components.BonusViewLogic;
	
	import org.puremvc.as3.interfaces.INotification;

	public class BonusMediator extends UIMediator
	{
		public static var NAME:String = "BonusMediator";
		
		public function BonusMediator()
		{
			super(NAME, new BonusViewLogic());
		}
		
		private function get bonusVL():BonusViewLogic
		{
			return viewLogic as BonusViewLogic;
		}
		override public function listNotificationInterests():Array
		{
			return [GeneralNotifications.BONUS_READE_TO_DRAW];
		}
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.BONUS_READE_TO_DRAW:
					bonusVL.startBonusLevel(notification.getBody() as Vector.<ElemBonusDto>);
					break;
			}
		}
	}
}