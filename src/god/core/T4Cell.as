package god.core
{
	import god.vo.cell.T4CellVO;

	public class T4Cell extends Cell
	{
		private var ddr:Number = 1 - Math.random() * 2;
		
		public function T4Cell(w:Number, h:Number)
		{
			super();
			this.vo = new T4CellVO(this, w, h);
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