package model.dto
{
	import flash.utils.Timer;

	public class ScoreDto extends Object
	{
		public var scoreValue:int = 0; // кількість очок за рівень
		public var totalScore:int = 0; //загальна кількість очок (за всі рівні)
		public var numberOfMoves:int; //кількість можливих ходів передана з StartGameProxy...
		public var allMoves:int; //кількість ходів за рівень
		public var trueSelect:int = 0; // обнуляється, для підрахунку очок
		public var allFalseSelect:int = 0;  //загальна кількість неправильних ходів
		public var allTrueSelect:int = 0; //загальна кількість правильних ходів 
		public var lifes:int = 10; //кількість життів
		public var ScoreTrueFalseValue:Array; //додаються до масиву та передаються в WinPopupVL наступні значення: загальна кількість очок, правильні ходи та неправильні ходи
		public var timer:Timer;
		public var second:int;
		public var minute:int;
		public var minuteSecond:Array; //додаються в масив значення хвилин та секунд для таймера та передається в BotPanelViewLogic
	}
}