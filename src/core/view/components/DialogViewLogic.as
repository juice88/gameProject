package core.view.components
{
	import core.config.Settings;
	import core.utils.Warehouse;
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class DialogViewLogic extends EventDispatcher
	{
		protected var displayObject:DisplayObject;
		
		private var background:Sprite;
		
		public function DialogViewLogic(name:String)
		{
			this.displayObject = Warehouse.getInstance().getAsset(name);
			addBackground();
			(this.displayObject as Sprite).addChildAt(background, 0);
		}
		
		public function get content():DisplayObject{
			return displayObject;
		}
		
		private function addBackground():void
		{
			background = new Sprite();
			var graf:Graphics = background.graphics;
			graf.beginFill(0x150000, 0.5);
			graf.drawRect(0,0,Settings.BACKGROUND_RECT_WIDTH,Settings.BACKGROUND_RECT_HEIGHT);
			graf.endFill();
		}
	}
}