package view.mediator
{
	import config.GameEvent;
	import config.GeneralEventsConst;
	import config.GeneralNotifications;
	import config.Settings;
	
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import model.dto.ElementDto;
	
	import org.puremvc.as3.interfaces.INotification;
	
	import view.components.Level1ViewLogic;
	
	public class LevelMediator extends UIMediator
	{
		public static var NAME:String="LevelMediator";
		
		public function LevelMediator()
		{
			super(NAME, new Level1ViewLogic());
//			(viewLogic as Level1ViewLogic).addEventListener(GeneralEventsConst.OPENED_ELEMENT, onOpenedElementHand);
//			(viewLogic as Level1ViewLogic).addEventListener(GeneralEventsConst.END_TURN, onEndTurnHand);
		}
		private function get levelVL():Level1ViewLogic
		{
			return viewLogic as Level1ViewLogic;
		}

		override public function onRegisterListeners():void
		{
			levelVL.addEventListener(GeneralEventsConst.OPENED_ELEMENT, onOpenedElementHand);
			levelVL.addEventListener(GeneralEventsConst.END_TURN, onEndTurnHand);
			levelVL.addEventListener(GeneralEventsConst.SELECT_IS_TRUE, onSelectIsTrueHand);
			levelVL.addEventListener(GeneralEventsConst.SELECT_IS_FALSE, onSelectIsFalseHand);
			
		}
		
		override public function onRemoveListeners():void
		{
			levelVL.removeEventListener(GeneralEventsConst.OPENED_ELEMENT, onOpenedElementHand);
			levelVL.removeEventListener(GeneralEventsConst.END_TURN, onEndTurnHand);
			levelVL.removeEventListener(GeneralEventsConst.SELECT_IS_TRUE, onSelectIsTrueHand);
			levelVL.removeEventListener(GeneralEventsConst.SELECT_IS_FALSE, onSelectIsFalseHand);
		}
		
		override public function listNotificationInterests():Array{
			return [GeneralNotifications.READY_TO_DRAW, 
					GeneralNotifications.RESULTS_TURN, 
					GeneralNotifications.PERMIT_TO_ADD,
					GeneralNotifications.REPLAY_LEVEL,
					GeneralNotifications.MUTE,
					GeneralNotifications.PAUSE,
					GeneralNotifications.CONTINUE_GAME,
					GeneralNotifications.GAME_OVER];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch (notification.getName())
			{
				case GeneralNotifications.READY_TO_DRAW:
					levelVL.readyToDraw(notification.getBody() as Vector.<ElementDto>);
					break;
				case GeneralNotifications.RESULTS_TURN:
					setTimeout(levelVL.resultTurn, Settings.TIME_DELAY, (notification.getBody() as Boolean)); // встановлюється затримка між показом елементів і їх закриванням
					break;
				case GeneralNotifications.PERMIT_TO_ADD:
					levelVL.permitToAdd(notification.getBody() as int);
					levelVL.clickElemSound();
					break;
				case GeneralNotifications.REPLAY_LEVEL:
					levelVL.replayLevel();
					break;
				case GeneralNotifications.MUTE:
					levelVL.mute();
					break;
				case GeneralNotifications.PAUSE:
					levelVL.removeListenerForPause();
					break;
				case GeneralNotifications.CONTINUE_GAME:
					levelVL.addListenerForPause();
					break;
				case GeneralNotifications.GAME_OVER:
					levelVL.gameOver();
					break;
			}
		}
		
		protected function onOpenedElementHand(event:GameEvent):void 
		{
			sendNotification(GeneralNotifications.ON_OPEN_ELEMENT, event.params); // відправляємо Нотіф про те що елемент ще не відкритий, а ми лише намірені відкрити цей елемент
		}
		
		protected function onEndTurnHand(event:Event):void
		{
			sendNotification(GeneralNotifications.END_TURN);
		}
		
		protected function onSelectIsFalseHand(event:Event):void
		{
			sendNotification(GeneralNotifications.SELECT_IS_FALSE);
		}
		
		protected function onSelectIsTrueHand(event:Event):void
		{
			sendNotification(GeneralNotifications.SELECT_IS_TRUE);
		}	
	}
}