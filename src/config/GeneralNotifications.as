package config
{
	public class GeneralNotifications
	{
		public static const STARTUP:String = "startup";
		public static const ADD_CHILD_TO_ROOT:String = "add_child_to_root";
		public static const REMOVE_CHILD_FROM_ROOT:String = "remove_child_from_root";
		public static const LOAD_FLASH:String = "load_flash";
		public static const START_GAME:String = "start_game";
		public static const BACK_TO_MENU:String = "back_to_menu";
		public static const RESTART_GAME:String = "restart_game";
		public static const READY_TO_DRAW:String = "ready_to_draw"; // Нотіф про готовність до розташування елементів
		public static const ON_OPEN_ELEMENT:String = "on_open_element"; //Нотіф про те що елемент ще не відкритий, а ми лише намірені його відкрити цей елемент
		public static const RESULTS_TURN:String = "result_turn"; //нотіф з результатом ходу (вибору елемента)
		public static const END_TURN:String = "end_turn"; //Нотіф про закінчення вибору елементів
		public static const PERMIT_TO_ADD:String = "permit_to_add"; //Нотіф про дозвіл добавити ще один вибраний елемент
		public static const MOVES_COUTNER_UPDATED:String = "moves_coutner_updated"; //нотіф з проксі про те що лічильник обновився... (має нове значення)
		public static const SELECT_IS_TRUE:String = "select_is_true"; //нотіф про правильне порівняння елементів (для лічильника очків)
		public static const SELECT_IS_FALSE:String = "select_is_false"; //нотіф про неправильне порівняння елементів (для лічильника очків)
		public static const SCORE_COUTNER_UPDATED:String = "score_coutner_updated"; // нотіф з СкорПроксі про обновлення лічильника очків обновився... (має нове значення)
		public static const TOTAL_SCORE_UPDATED:String = "total_score_updated";
		public static const REPLAY_LEVEL:String = "replay_level";
		public static const MUTE:String = "mute";
		public static const PAUSE:String="pause";
		public static const CONTINUE_GAME:String = "continue_game";
		public static const GAME_OVER:String = "game_over";
		public static const LIFES_COUNTER_UPDATED:String = "lifes_counter_updated";
		public static const FULL_SCREEN:String = "full_screen";
		
	
	}
}