package model.proxy
{
	import config.GeneralNotifications;
	
	import model.dto.ScoreDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ScoreProxy extends Proxy
	{
		public static const NAME:String = "MenuProxy";
		
		public function ScoreProxy()
		{
			super(NAME, new ScoreDto());
		}
		
		public function get score():ScoreDto
		{
			return getData() as ScoreDto;
		}
		public function selectIsTrue():void
		{
			score.allTrueSelect++;
			scoreCounter();
		}
		public function selectIsFalse():void
		{
			score.falseSelect++;
			score.lifes--;
			lifesCounter();
			score.trueSelect = 0; // при неправильному виборі обнуляємо кількість правильних виборів (тобто все спочатку... на 3-й правильний вибір і всі наступні знову будуть додаватися по 30 очок за правильний вибір)  
			trace("неправильний хід");
		}
		
		private function scoreCounter():void
		{
			score.trueSelect++;
			if (score.trueSelect < 3) //якщо кількість правильних ходів менша від 3 тоді добавляємо по 10 очок
			{
				score.scoreValue += 10;
				sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			}
			else //інакше добавляємо по 30 очок
			{
				score.scoreValue += 30;
				sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			}
			trace("Лічильник: правильних ходів-", score.allTrueSelect, "неправильних ходів-", score.falseSelect, "Очки-", score.scoreValue);
		}
		public function resetLevelScoreCounter():void
		{
			score.trueSelect = 0;
			score.falseSelect = 0;
			score.scoreValue = 0;
			score.lifes = 10;
			sendNotification(GeneralNotifications.SCORE_COUTNER_UPDATED, score.scoreValue);
			sendNotification(GeneralNotifications.LIFES_COUNTER_UPDATED, score.lifes);
		}
		public function openPausePopup():void // виклик з команди. передаємо значення загального рахунку очків при відкривання діалогового вікна pausePopup
		{
			score.totalScore = score.scoreValue;
			sendNotification(GeneralNotifications.TOTAL_SCORE_UPDATED, score.totalScore);
		}
		private function lifesCounter():void
		{
			if (score.lifes < 1)
			{
				sendNotification(GeneralNotifications.GAME_OVER);
				trace ("sendNotification(GeneralNotifications.GAME_OVER)");
			}
			sendNotification(GeneralNotifications.LIFES_COUNTER_UPDATED, score.lifes);
			trace ("lifes -", score.lifes);
		}
	}
}