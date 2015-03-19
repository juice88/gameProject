package core.counters.model.proxy
{
	import config.GeneralNotifications;
	import config.Settings;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import core.counters.model.dto.ScoreDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ScoreProxy extends Proxy
	{
		public static const NAME:String = "MenuProxy";
		
		public function ScoreProxy()
		{
			super(NAME, new ScoreDto());
			score.timer = new Timer(1000, 60);
			timerGameSet();
		}
		
		public function get score():ScoreDto
		{
			return getData() as ScoreDto;
		}
		
		public function allMovesCounter(value:int):void
		{
			score.numberOfMoves = value;
		}
		
		override public function onRemove():void
		{
			score.timer.stop();
		}
		
		public function selectIsTrue():void
		{
			score.allTrueSelect++;
			score.allMoves++;
			sendNotification(GeneralNotifications.MOVES_COUTNER_UPDATED, score.allMoves);
			scoreCounter();
		}
		
		public function selectIsFalse():void
		{
			score.allFalseSelect++;
			score.lifes--;
			score.allMoves++;
			sendNotification(GeneralNotifications.MOVES_COUTNER_UPDATED, score.allMoves);
			lifesCounter();
			score.trueSelect = 0; // при неправильному виборі обнуляємо кількість правильних виборів (тобто все спочатку... на 3-й правильний вибір і всі наступні знову будуть додаватися по 30 очок за правильний вибір)  
			trace("неправильний хід");
		}
		
		private function scoreCounter():void
		{
			score.trueSelect++;
			if (score.trueSelect < 3) //якщо кількість правильних ходів менша від 3 тоді добавляємо по 10 очок
			{
				score.scoreValue += Settings.SCORE_ONE_TRUE_SELECT;
				sendNotification(GeneralNotifications.SCORE_MOVES_ANIMATION, Settings.SCORE_ONE_TRUE_SELECT);
				sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			}
			else //інакше добавляємо по 30 очок
			{
				score.scoreValue += Settings.scoreThreeTrueSelect;
				sendNotification(GeneralNotifications.SCORE_MOVES_ANIMATION, Settings.scoreThreeTrueSelect);
				sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			}
			levelWon();
			trace("Лічильник: правильних ходів-", score.allTrueSelect, "неправильних ходів-", score.allFalseSelect, "Очки-", score.scoreValue);
		}
		
		public function resetLevelCounters():void
		{
			score.timer.stop(); //стопаємо таймер, щоб при рестарті він вимикався не одразу, а лише коли закриються всі елементи
			timerGameSet();
			score.trueSelect = 0;
			score.allTrueSelect = 0;
			score.allFalseSelect = 0;
			score.scoreValue = 0;
			score.lifes = 10;
			score.allMoves = 0;
			sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			sendNotification(GeneralNotifications.LIFES_COUNTER_UPDATED, score.lifes);
		}
		
		public function openPausePopup():void // виклик з команди. передаємо значення загального рахунку очків при відкривання діалогового вікна pausePopup
		{
			score.totalScore = score.scoreValue;
			score.timer.stop();
			sendNotification(GeneralNotifications.TOTAL_SCORE_UPDATED, score.totalScore);
		}
		
		public function timerStart():void
		{
			score.timer.start();
		}
		
		private function lifesCounter():void
		{
			if (score.lifes < 1)
			{
				sendNotification(GeneralNotifications.GAME_OVER);
				score.timer.stop();
			}
			sendNotification(GeneralNotifications.LIFES_COUNTER_UPDATED, score.lifes);
			trace ("lifes -", score.lifes);
		}
		
		public function levelWon():void
		{
			if (score.allTrueSelect == score.numberOfMoves && score.allFalseSelect == 0)
			{
				score.timer.stop();
				sendNotification(GeneralNotifications.BONUS_POPUP_SHOW);
			}
			else if (score.allTrueSelect == score.numberOfMoves)
			{
				score.timer.stop();
				sendNotification(GeneralNotifications.WIN);
				sendValueScoreTrueFalseMoves();
			}
		}
		
		public function sendValueScoreTrueFalseMoves():void
		{
			score.totalScore = score.scoreValue;
			score.ScoreTrueFalseValue = new Array;
			score.ScoreTrueFalseValue.push(score.totalScore, score.allTrueSelect, score.allFalseSelect);
			sendNotification(GeneralNotifications.VALUES_SCORE_TRUE_FALSE_MOVES, score.ScoreTrueFalseValue);
		}
		
		public function timerGameSet():void
		{
			score.minute = 0;
			score.second = 20;
			score.minuteSecond = new Array;
			score.minuteSecond.push(score.minute, score.second);
			sendNotification(GeneralNotifications.VALUES_MINUTE_SECOND, score.minuteSecond);
			score.minuteSecond.length = 0;
		}
		
		public function timerGame():void
		{
			score.timer.addEventListener(TimerEvent.TIMER, onTick);
			score.timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			score.timer.start();
		}
		
		protected function onTick(event:TimerEvent):void
		{
			score.second--;
			if (score.second <= -1)
			{
				score.minute--;
				score.second = 59;
			}
			score.minuteSecond.push(score.minute, score.second);
			sendNotification(GeneralNotifications.VALUES_MINUTE_SECOND, score.minuteSecond);
			score.minuteSecond.length = 0;
			trace("таймер", score.minute, ":", score.second);
			if (score.minute <= 0 && score.second <= 0)
			{
				score.timer.stop();
				sendNotification(GeneralNotifications.GAME_OVER);
			}
		}
		
		protected function onTimerComplete(event:TimerEvent):void
		{
			score.timer.start();
		}
		
		public function nextLevel():void
		{
			score.timer.stop();
			score.minute = 0;
			score.second = 30;
			score.lifes = 10;
			score.allMoves = 0;
			score.allTrueSelect = 0;
			score.allFalseSelect = 0;
		}
	}
}