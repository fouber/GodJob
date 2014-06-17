package god.core
{
	import god.vo.cell.T2CellVO;
	
	public class T2Cell extends Cell
	{
		
		private var ddr:Number = 1 - Math.random() * 2;
		
		public function T2Cell(w:Number, h:Number,n:int)
		{
			super();
			this.vo = new T2CellVO(this,w,h,n);
			//this.addChild(this.vo.karyon);
		}
		override public function run():void {
			this.graphics.clear();
			this.vo.body.draw();
			//this.vo.karyon.draw();
			this.rotation += ddr;
			if(Math.random() > 0.8) ddr = 1 - Math.random() * 2;
			this.move();
			this.ifMove = true;
			this.ifEating = false;
		}
	}
}