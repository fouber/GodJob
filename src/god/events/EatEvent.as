package god.events
{
	import flash.events.Event;
	
	public class EatEvent extends Event
	{
		
		public static var EAT_CELL:String = 'eatCell';
		public var x:Number;
		public var y:Number;
		public var level:int;
		
		public function EatEvent(x:Number, y:Number, level:int)
		{
			super(EatEvent.EAT_CELL, false, false);
			this.x = x;
			this.y = y;
			this.level = level;
		}
	}
}