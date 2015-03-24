package core.view.components
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import utils.Warehouse;
	
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
			graf.drawRect(0,0,640,555);
			graf.endFill();
		}
	}
}