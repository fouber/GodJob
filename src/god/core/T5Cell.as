package god.core
{
	import god.vo.cell.T5CellVO;
	
	public class T5Cell extends Cell
	{
		private var ddr:Number = 1 - Math.random() * 2;
		
		public function T5Cell(w:Number, h:Number,n:int,tw:Number,th:Number)
		{
			super();
			this.vo = new T5CellVO(this,w,h,n,tw,th);
			this.addChild(this.vo.karyon);
		}
		override public function run():void {
			this.graphics.clear();
			this.vo.body.draw();
			this.vo.karyon.draw();
			this.rotation += ddr;
			if(Math.random() > 0.8) ddr = 1 - Math.random() * 2;
			this.move();
			this.ifMove = true;
			this.ifEating = false;
		}
	}
}