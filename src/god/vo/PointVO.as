package god.vo
{
	public class PointVO
	{
		
		public var x:Number;
		public var y:Number;
		
		public var xc:Number;
		public var yc:Number;
		
		public var d:Number;
		
		public var r:Number;
		public var or:Number;
		
		public function PointVO(x:Number, y:Number, d:Number, r:Number, or:Number)
		{
			this.x = x;
			this.y = y;
			this.d = d;
			this.r = r;
			this.or = or;
		}
	}
}