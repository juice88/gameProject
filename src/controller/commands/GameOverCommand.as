package controller.commands
{
	import flash.utils.setTimeout;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.GameOverPopupMediator;
	
	public class GameOverCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.removeMediator(GameOverPopupMediator.NAME); //видаляємо медіатор на випадок, якщо він був вже створений (наприклад після програшу було натиснуто меню а потім знову старт гейм, тоді після ще одного програшу ГеймОверПопап не випливає)
			facade.registerMediator(new GameOverPopupMediator);
		}
	}
}