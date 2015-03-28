package core.utils
{
	import flash.display.LoaderInfo;
	import flash.media.Sound;
	import flash.media.SoundTransform;

	public class SoundLib
	{
		public static var volumeSet:SoundTransform = new SoundTransform();
		
		public static function playSound(name:String, timeStart:int=0, loops:int=1/*, volume:int=1*/):Sound
		{
			var NeedSound:Class = Warehouse.getInstance().getAssetClass(name);
			var sound:Sound = new NeedSound();
		//	volumeSet.volume = volume;
			sound.play(timeStart,loops,volumeSet);
			return sound;
		}
		
		public static function mute():void
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
		
		public static function btnClickSound():void
		{
			SoundLib.playSound("ButtonClick");
		}
	}
}