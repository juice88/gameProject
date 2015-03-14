package gamePlay.bonus.view.components
{
	import config.GameEvent;
	import config.GeneralEventsConst;
	
	import core.view.components.ViewLogic;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import gamePlay.bonus.model.dto.ElemBonusDto;
	
	import utils.Warehouse;

	public class BonusViewLogic extends ViewLogic
	{
		private var BonusElem:Class = Warehouse.getInstance().getAssetClass("ElementBonus");
		private var shablonBonus:String = "shablonBonus";
		private var show:String = "show";
		private var bonusElemList:Vector.<ElemBonusDto>;
		
		public function BonusViewLogic()
		{
			super("PolleBonus");
		}
	
		private function get bonusVL():MovieClip
		{
			return content as MovieClip;
		}
				
		public function startBonusLevel(elemBonusDto:Vector.<ElemBonusDto>):void
		{
			bonusElemList = new Vector.<ElemBonusDto>;
			bonusElemList = elemBonusDto;
			
			for (var i:int = 0; i<elemBonusDto.length; i++)
			{
				elemBonusDto[i].elemBonus = new BonusElem();
				elemBonusDto[i].elemBonus.gotoAndStop(elemBonusDto[i].kadr);
				elemBonusDto[i].elemBonus.addEventListener(MouseEvent.CLICK, onClickToBonusElemHald);
				((bonusVL[shablonBonus+i]) as MovieClip).addChild(elemBonusDto[i].elemBonus);
			}
		}
		
		protected function onClickToBonusElemHald(event:MouseEvent):void
		{
			var bonusClip:MovieClip = (event.currentTarget as MovieClip);
			var neededDto:ElemBonusDto = getDtoByContent(bonusClip);
			removeLisenersElem();
			bonusClip.back.gotoAndStop(show);
			
			dispatchEvent(new GameEvent(GeneralEventsConst.BONUS_RESULT_OF_CHOISE, neededDto.kadr as int));
		}
		
		private function removeLisenersElem():void
		{
			for (var i:uint = 0; i<bonusElemList.length; i++)
			{
				bonusElemList[i].elemBonus.removeEventListener(MouseEvent.CLICK, onClickToBonusElemHald);
			}
		}
		
		private function getDtoByContent(bonusClip:MovieClip):ElemBonusDto // метод для отримання ДТО по елементу мувікліпа 
		{
			for (var i:uint=0; i<bonusElemList.length; i++) // пробігаємося по всьому вектору ЕлементДто 
			{
				if (bonusClip == bonusElemList[i].elemBonus) //якщо провіряючий мовікліп співпадає з елементом в ДТО
				{
					return  bonusElemList[i]; // вернути його ДТО
				}
			}
			return null; // інакше нічого не вертати
		}
	}
}