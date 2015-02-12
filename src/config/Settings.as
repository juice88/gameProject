package config
{
	public class Settings
	{
		public static const OPEN_ELEM_LIMIT:uint = 2; //кількість елементів яка порівнюється
		public static const TIME_DELAY:uint = 500; //1000мс = 1с, затримка відкритого елемента
		public static const SHOW_ELEMENTS_DELAY:uint = 2000; // затримка відкритих елементів перед початком гри (для перегляду розташування елементів)
		
		public static const IDLE_STATE:String = "IdleState";//режим (стан) очікування
		public static const OPENING_STATE:String = "OpeningState";//режим (стан) відкриття елемента
		public static const RESULT_STATE:String = "ResultState";//режим (стан) відсилання результату
	}
}