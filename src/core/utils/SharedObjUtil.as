package core.utils
{
	import flash.net.SharedObject;

	public class SharedObjUtil
	{
		private static var _instance:SharedObjUtil;
		private var _sharedObject:SharedObject;
		private var _apName:String = "Mahjjuice_game";
		
		public static function getInstance():SharedObjUtil
		{
			if (_instance==null)
			{
				_instance = new SharedObjUtil();
			}
			return _instance;
		}
		
	//	public function set playerName
	}
}