package view.components
{
	import config.GameEvent;
	import config.GeneralEventsConst;
	import config.Settings;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.utils.setTimeout;
	
	import model.dto.ElementDto;
	
	import utils.Warehouse;
	
	
	public class Level1ViewLogic extends ViewLogic
	{
		private var Elem:Class = Warehouse.getInstance().getAssetClass("Element");
		private var shablon:String = "shablon";
		private var hide:String = "hide";
		private var show:String = "show";
		private var allElemList:Vector.<MovieClip>; //перелік усіх елементів
		private var openElemList:Vector.<MovieClip>; // елементи які відкриті
		private var vectorElementDto:Vector.<ElementDto>; //вектор усіх ДТО
		private var restElement:Vector.<MovieClip>; // вектор елементів які ще є на сцені
		
		private var ClickSound:Class = Warehouse.getInstance().getAssetClass("SelectElemSound");
		private var FalseSound:Class = Warehouse.getInstance().getAssetClass("FalseSound");
		private var TrueSound:Class = Warehouse.getInstance().getAssetClass("TrueSound");
		private var GameOverSound:Class = Warehouse.getInstance().getAssetClass("GameOverSound");
		private var volumeSet:SoundTransform = new SoundTransform();
		
		
		public function Level1ViewLogic()
		{
			super("Polle");
			openElemList = new Vector.<MovieClip>;
			allElemList = new Vector.<MovieClip>;
			restElement = new Vector.<MovieClip>;
		}
		
		private function get level1Content():MovieClip
		{
			return content as MovieClip;
		}
		
		public function readyToDraw(value:Vector.<ElementDto>):void
		{
			vectorElementDto = value;
			for (var i:uint = 0; i<value.length; i++)
			{
				value[i].element = new Elem();
				allElemList.push(value[i].element); // додаємо до вестора clipsList MovieClip-и витягнуті з вектора ElementDto
				restElement.push(value[i].element);
				value[i].element.gotoAndStop(value[i].kadr);
				((level1Content[shablon+i]) as MovieClip).addChild(value[i].element);
			}
			allElementsDrawed();
		}
		
		private function getDtoByContent(element:MovieClip):ElementDto // метод для отримання ДТО по елементу мувікліпа 
		{
			for (var i:uint=0; i<vectorElementDto.length; i++) // пробігаємося по всьому вектору ЕлементДто 
			{
				if (element == vectorElementDto[i].element) //якщо провіряючий мовікліп співпадає з елементом в ДТО
				{
					return  vectorElementDto[i]; // вернути його ДТО
				}
			}
			return null; // інакше нічого не вертати
		}
		
		protected function onClickElement(event:MouseEvent):void
		{
			var element:MovieClip = (event.currentTarget as MovieClip); 
			var neededDto:ElementDto = getDtoByContent(element); // зміній neededDto (необхіднийДТО) присвоюємо ДТО яка визначається в методі getDtoByContent в який передано (зміну element(елемент по якому був клік))
			dispatchEvent(new GameEvent(GeneralEventsConst.OPENED_ELEMENT, neededDto));
		}
		
		public function restElemFun(delElem:MovieClip):void
		{
			var availableElem:int = allElemList.indexOf(delElem); //знаходимо даний елемент в векторі усіх елементів... визначаємо його індекс
			if (availableElem != -1) //якщо індекс не рівний -1 тоді
			{
				restElement.splice(availableElem, 1, null); //видаляємо елемент(який було видалено зі сцени) з вектора MovieClip по індексу, 1 - кількість видалених елементів після елемента з індексом, null - ставиться в масив замість видалених елементів... (без налл не видаляються елементи зі сценни в методі replayLevel)
			}
		}

		public function resultTurn(notif:Boolean):void //перевірка результатів ходу (вибору елементів)
		{
			if(notif as Boolean)
			{
				for (var i:uint = 0; i < openElemList.length; i++)
				{
					restElemFun(openElemList[i]);
					trueSelectSound();
					openElemList[i].parent.removeChild(openElemList[i]);
				}
					dispatchEvent(new Event(GeneralEventsConst.SELECT_IS_TRUE));
			}
			else
			{
				for ( i = 0; i < openElemList.length; i++)
				{
					falseSelectSound();
					openElemList[i].back.gotoAndStop(hide);
				}
					dispatchEvent(new Event(GeneralEventsConst.SELECT_IS_FALSE));
					
			}
			openElemList = new Vector.<MovieClip>;
			dispatchEvent(new Event(GeneralEventsConst.END_TURN)); //відправляємо евент про закінчення вибору елементів
		}
		
		public function permitToAdd(elemIndex:int):void 
		{
			var elem:MovieClip = allElemList[elemIndex];
			openElemList.push(elem);
			elem.back.gotoAndStop(show);
		}
		
		private function allElementsDrawed():void //відкриваємо усі елементи перед початком гри
		{
			for (var i:uint = 0; i < allElemList.length; i++)
			{
				vectorElementDto[i].element.back.gotoAndStop(show);
			//	vectorElementDto[i].element.removeEventListener(MouseEvent.CLICK, onClickElement); //знімаємо лісенери на випадок яколи був натиснутий рестарт
			}
			setTimeout(allElementsHided, Settings.SHOW_ELEMENTS_DELAY); //встановлюється затримка відкритих елементів 
		}
		
		private function allElementsHided():void //закриваємо елементи піся перегляду
		{
			for (var i:uint = 0; i < allElemList.length; i++)
			{
				vectorElementDto[i].element.back.gotoAndStop(hide);
				vectorElementDto[i].element.addEventListener(MouseEvent.CLICK, onClickElement); //добавляємо лісенери на всі елементи, лише коли вони закриються
			}
		}
		
		public function replayLevel():void
		{
			for (var i:uint = 0; i<restElement.length; i++)
			{
				if (restElement[i] != null) //якщо елемент в векторі елементів які залишилися на сцені не нулл
				{
					((level1Content[shablon+i]) as MovieClip).removeChild(restElement[i]); //видаляємо усі елементи з сцени
				}
			}
			removeListener();
			
			for (var j:uint = 0; j<allElemList.length; j++)
			{
				((level1Content[shablon+j]) as MovieClip).addChild(allElemList[j]); //додаємо вектор усіх елементів на сцену
			}
				openElemList = new Vector.<MovieClip>; //обнуляємо вектор відкритих елементів, щоб після рестарта можна було вибирати елементи спочатку
				allElementsDrawed();
		}
		private function gameOverShowRestElements():void //після програшу відкриваємо елементи які залишилися на сцені
		{
			for (var i:uint = 0; i<vectorElementDto.length; i++)
			{
				vectorElementDto[i].element.back.gotoAndStop(show);
			}
		}
		
		public function clickElemSound():void
		{
			var clickSound:Sound = new ClickSound();
			clickSound.play(200,1, volumeSet);
		}
		
		private function falseSelectSound():void
		{
			var falseSound:Sound = new FalseSound();
			//volumeSet.volume = 0.5;
			//volumeSet.pan = 0; //баланс
			falseSound.play(0,1,volumeSet);
		}
		
		private function trueSelectSound():void
		{
			var trueSound:Sound = new TrueSound();
			trueSound.play(200,1,volumeSet);
		}
		
		private function gameOverSound():void
		{
			
			var gameOverSound:Sound = new GameOverSound;
			gameOverSound.play(0,1,volumeSet);
		}
		
		public function mute():void
		{
			if (volumeSet.volume == 0)
			{
				volumeSet.volume = 1;
			}
			else
			{
				volumeSet.volume = 0;
			}
		}
		
		public function removeListener():void //метод для видалення лісенерів з елементів при паузі, рестарті та геймОвер
		{
			for (var i:uint=0; i<vectorElementDto.length; i++)
			{
				vectorElementDto[i].element.removeEventListener(MouseEvent.CLICK, onClickElement);
			}
		}
		
		public function addListenerForPause():void
		{
			for (var i:uint=0; i<vectorElementDto.length; i++)
			{
				vectorElementDto[i].element.addEventListener(MouseEvent.CLICK, onClickElement);
			}
		}
		
		public function gameOver():void
		{
			removeListener();
			setTimeout(gameOverSound, 500);
			gameOverShowRestElements();
		}
	}
}