package model.proxy
{
	import config.GeneralNotifications;
	import config.Settings;
	
	import flash.display.MovieClip;
	import flash.sampler.NewObjectSample;
	import flash.utils.setTimeout;
	
	import model.dto.ElementDto;
	import model.dto.LevelDto;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class StartGameProxy extends Proxy
	{
		public static const NAME:String = "StartGameProxy";
		
		public function StartGameProxy()
		{
			super(NAME, new LevelDto());
			init();
		}
		
		public function get levelDto():LevelDto
		{
			return getData() as LevelDto;
		}
		
		// формуються гетера та сеттер для перемінної state (стан гри) в StartGameDto, щоб було швидко та зручно записати (Set) в ню дані та їх отримати(Get)
		public function get state():String
		{
			return levelDto.state;
		}
		
		public function set state(value:String):void
		{
			levelDto.state = value;
		}
		
		public function init():void
		{ 
			levelDto.movesCounter = 0; //встановлюємо значення лічильника ходів на 0
			state = Settings.IDLE_STATE; // коли гра перший раз загрузилася тоді включається режим очікування
			levelDto.kadrList = new Vector.<uint>; //ініціалізація вектора значень кадрів
			levelDto.ElementListVector = new Vector.<ElementDto>; // ініціалізація вектора усіх елементів
			levelDto.openElementsList = new Vector.<ElementDto>; // ініціалізація вектора елементів які були відкриті
			fillKadrList();
			
			for (var i:uint = 0; i<levelDto.kadrList.length; i++)
			{
				var elementDto:ElementDto = new ElementDto;
				elementDto.kadr = levelDto.kadrList[i];
				elementDto.index = i;
				levelDto.ElementListVector.push(elementDto);
			}
			sendNotification(GeneralNotifications.READY_TO_DRAW, levelDto.ElementListVector); //формуємо повідомлення про готовність до нарисовки елементів та відправляємо масив елементів
		}
		
		private function fillKadrList():void //наповнюємо ігрове поле елементами(квадратиками)
		{ 
			for(var i:uint = 0; i<10; i++) //задаємо цикл
			{
				levelDto.randElements = 1+(int(Math.random()*5));
				
				levelDto.kadrList.push(levelDto.randElements); //додаємо отримані випадкові значення в кінець масиву
				levelDto.kadrList.unshift(levelDto.randElements); //додаємо ще раз ті самі значення на початок масиву для отримання парності кольорів
			}
			trace("послідовність кадрів наступна -",levelDto.kadrList);
		}
		
		public function openElement(elem:ElementDto):void
		{
			if(state == Settings.RESULT_STATE) //якщо відбуваєтьбся пересилання(порівняння) результатів після вибору тоді чекати закінчення перевірки...
			{ 
				return;
			}
			
			if (levelDto.openElementsList.length == 0) // якщо масив пустий, тобто вибирається перший елемент після запуску гри, тоді цей елемент додається одразу додається до масиву
			{
				elem.ifSelect = true; //встановлюєтсья true та означає те, що цей елемент вже відкритий та на ньому не можливо буде клікнути ще раз
				levelDto.openElementsList.push(elem); //додаємо поточний елемент в масив відкритих елементів
				sendNotification(GeneralNotifications.PERMIT_TO_ADD, elem.index as int);
			}
			else
			{
				for (var i:uint=0; i<levelDto.openElementsList.length; i++)
				{
					if (elem.ifSelect == true)
					{
						trace("натиснуто той самий елемент, індекс -",elem.index+1, "кадр-", elem.kadr);
						return;
					}
				}
				elem.ifSelect = true;	
				levelDto.openElementsList.push(elem);
				sendNotification(GeneralNotifications.PERMIT_TO_ADD, elem.index as int);
			}
			
			if(levelDto.openElementsList.length == Settings.OPEN_ELEM_LIMIT) //якщо кількость відкритих елементів рівна заданій в Settings тоді...
			{
				levelDto.movesCounter++; //якщо відкрито будь-які два елемента тоді збільшити на 1 лічильник ходів
				sendNotification(GeneralNotifications.MOVES_COUTNER_UPDATED, levelDto.movesCounter);
				sendNotification(GeneralNotifications.RESULTS_TURN, checkElements()); //відправляємо нотіф з результатом ходу (вибору елемента) 
				state = Settings.RESULT_STATE; //якщо вибрано два елементи то включається режим РесалтСтейт (стан відсилання результату), тобто більше не можливо буде попасти в цю функцію
			}
			else
			{
				state = Settings.OPENING_STATE; // інакше якщо вибраний один елемент, тоді включається режим ОпенінгСтейт (стан вибору елементів)
			}
		}
		
		public function endTurn():void
		{
			state = Settings.IDLE_STATE;
		}
		
		private function ifSelectElementToFalse():void // в векторі ElementListVector для усіх елементів параметр ifSelect встановлюється в значення false, що дасть змогу вибирати наступні пари елементів
		{
			for (var i:uint = 0; i<levelDto.ElementListVector.length; i++)
			{
				levelDto.ElementListVector[i].ifSelect = false;
			}
		}
		
		private function checkElements():Boolean // перевіряємо співпадіння кадрів відкритих елементів
		{
			var item:int = levelDto.openElementsList[0].kadr;
			for (var i:int = 1; i < levelDto.openElementsList.length; i++) 
			{
				if(item != levelDto.openElementsList[i].kadr)
				{
					ifSelectElementToFalse();
					levelDto.openElementsList = new Vector.<ElementDto>; // обнуляємо вектора для того щоб можна було знову відкрити елементи які були закриті після неуспішного порівняння 
					return false;
				}
			}
			ifSelectElementToFalse();
			levelDto.openElementsList = new Vector.<ElementDto>;
			return true;
		}
		public function replayLevel():void
		{
			levelDto.movesCounter = 0;
			levelDto.openElementsList = new Vector.<ElementDto>; //обнуляємо вектор відкритих елементів, щоб після рестарта можна було вибирати елементи спочатку
			sendNotification(GeneralNotifications.REPLAY_LEVEL);
		}
		public function pauseGame():void 
		{
			
		}
	}
}