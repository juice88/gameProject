package gamePlay.level1.view.components
{
	import core.config.GameEvent;
	import core.config.GeneralEventsConst;
	import core.config.Settings;
	import core.utils.SoundLib;
	import core.utils.Warehouse;
	import core.view.components.ViewLogic;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	import gamePlay.level1.model.dto.ElementDto;
	
	
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
		
		private var ScoreAnim:Class = Warehouse.getInstance().getAssetClass("ScoreAnim");
		
		private var scoreAnimTf:TextField;
		private var movesScoreVal:uint;
		
		public function Level1ViewLogic()
		{
			super("Polle");
			openElemList = new Vector.<MovieClip>; // вектор, що містить список відкритих елементів
			allElemList = new Vector.<MovieClip>; // вектор усіх елементів
			restElement = new Vector.<MovieClip>; // вектор елементів, що ще не відкриті та залишаються на сцені
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
		public function setScorAnim(scoreValue:int):void
		{
			movesScoreVal = scoreValue;
		}

		public function resultTurn(notif:Boolean):void //перевірка результатів ходу (вибору елементів)
		{
			if(notif as Boolean)
			{
				dispatchEvent(new Event(GeneralEventsConst.SELECT_IS_TRUE));
				//додаємо анімацію нарахування очків за поточний хід
				var scoreAnim:MovieClip = new ScoreAnim();
				scoreAnimTf = scoreAnim.scoreMovesTf;
				scoreAnimTf.text = movesScoreVal.toString(10);
				
				for (var i:uint = 0; i < openElemList.length; i++)
				{
					restElemFun(openElemList[i]);
					openElemList[i].parent.addChild(scoreAnim); //додаємо анімацію нарахування очків
					scoreAnim.addEventListener(Event.ENTER_FRAME, onEnterFrameScoreAnim); //по закінченю анімації видаляємо її
					openElemList[i].parent.removeChild(openElemList[i]);
					SoundLib.getSound("TrueSound", 200);
				}
			}
			else
			{
				for ( i = 0; i < openElemList.length; i++)
				{
					SoundLib.getSound("FalseSound");
					openElemList[i].back.gotoAndStop(hide);
				}
				dispatchEvent(new Event(GeneralEventsConst.SELECT_IS_FALSE));
			}
			openElemList = new Vector.<MovieClip>;
			dispatchEvent(new Event(GeneralEventsConst.END_TURN)); //відправляємо евент про закінчення вибору елементів
		}
		
		protected function onEnterFrameScoreAnim(event:Event):void //якщо поточний кадр мувікліпа scoreAnin рівний загальній кількості кадрів (тобто останній) і парент, який на який покладено мувікліп scoreAnin, тоді видаляємо мувікліп scoreAnin (після його програшу) з парента 
		{
			if (event.currentTarget.currentFrame == event.currentTarget.totalFrames && event.target.parent != null)
			{
				event.target.parent.removeChild(event.target);
				event.target.removeEventListener(Event.ENTER_FRAME, onEnterFrameScoreAnim);
			}
		}
		
		public function permitToAdd(elemIndex:int):void 
		{
			var elem:MovieClip = allElemList[elemIndex];
			openElemList.push(elem);
			elem.back.gotoAndStop(show);
			SoundLib.getSound("SelectElemSound", 200);
		}
		
		private function allElementsDrawed():void //відкриваємо усі елементи перед початком гри
		{
			for (var i:uint = 0; i < allElemList.length; i++)
			{
				vectorElementDto[i].element.back.gotoAndStop(show);
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
			dispatchEvent(new Event(GeneralEventsConst.START_TIMER));
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
			setTimeout(SoundLib.getSound, 500, "GameOverSound");
			gameOverShowRestElements();
		}
		
		public function win():void
		{
			setTimeout(SoundLib.getSound, 500, "WinSound");
		}
	}
}