package model.dto
{
	import flash.display.MovieClip;

	public class LevelDto extends Object
	{
		public var kadrList:Vector.<uint>; // містить значення кадрів елементів(квадратиків) на грі
		public var randElements:uint; // змінна для генерування випадкового значення кадру
		
		public var state:String; // містить данні про вибраний режим, які прописані в Settings
		public var movesCounter:uint;	// містить дані про кількість ходів
		
		public var ElementListVector:Vector.<ElementDto>; // вектор усіх сформованих елементів
		public var openElementsList:Vector.<ElementDto>; // вектор елементів, які відкрилися при кліку (для їх порівняння)
	}
}