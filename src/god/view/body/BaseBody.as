package god.view.body
{
	import flash.display.Sprite;
	
	import god.vo.colors.BaseColorVO;

	public class BaseBody implements IBody
	{
		
		public var w:Number;
		public var h:Number;
		public var n:int;
		
		public var d:Number;
		public var r:Number;
		
		public var color:BaseColorVO;
		
		public var cell:Sprite;
		
		public var DNA:Array = [];
		
		public function BaseBody(cell:Sprite, w:Number, h:Number, n:int, d:Number, r:Number, color:BaseColorVO)
		{
			this.cell = cell;
			this.w = w;
			this.h = h;
			this.n = n;
			this.d = d;
			this.r = r;
			this.color = color;
		}
		
		public function draw(isRandom:Boolean = false):void
		{
		}
	}
}