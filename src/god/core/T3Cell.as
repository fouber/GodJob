package god.core
{
	import god.vo.cell.T3CellVO;
	
	public class T3Cell extends Cell
	{
		
		public var oq:Number = 0;
		
		public function T3Cell(w:Number, h:Number, tw:Number, th:Number)
		{
			super();
			this.vo = new T3CellVO(this,w,h,tw,th);
			//this.addChild(this.vo.karyon);
		}
		override public function run():void {
			this.graphics.clear();
			this.vo.body.draw(true);
			//this.vo.karyon.draw();
			this.rotation = 180 + this.vo.rt * 180 / Math.PI + oq;
			this.move();
			this.ifMove = true;
			this.ifEating = false;
		}
	}
}