package god.vo.cell
{
	import god.view.body.BaseBody;
	import god.view.karyon.BaseKaryon;

	public class BaseCellVO
	{
		
		public var foods:Array = [];
		public var colors:Array = [];
		public var level:int = 0;
		
		public var age:int = 0;
		public var dage:int = 1;
		public var dieAge:int = 0;
		public var bornAge:int = 0;
		
		public var energy:Number = 0;
		public var denergy:Number = 1;
		public var base_energy:Number = 0;
		public var top_energy:Number = 0;
		public var born_energy:Number = 0;
		public var ill_rate:Number = 0;
		public var illLevel:int = 0;
		
		public var type:int = 0;
		
		public var speed:Number = 0;
		public var width:Number = 0;
		public var height:Number = 0;
		public var divisiveNum:int = 5;
		
		public var surviveLine:Number = 0;
		
		public var body:BaseBody;
		public var karyon:BaseKaryon;
		public var deep:Number = 10 * Math.random();
		public var xt:Number = 0;
		public var yt:Number = 0;
		public var dt:Number = 2 - 4 * Math.random();
		public var rt:Number = Math.PI*2*Math.random();
	}
}