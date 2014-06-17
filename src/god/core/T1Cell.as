package god.core
{
	import god.view.body.LineBody;
	import god.vo.cell.T1CellVO;

	public class T1Cell extends Cell
	{
		private var ddr:Number = 1 - Math.random() * 2;
		
		public function T1Cell(w:Number, h:Number)
		{
			super();
			this.vo = new T1CellVO(this,w,h);
		}
		
		override public function getTarget(r:Number):Number {
			return r;
		}
		
		override public function run():void {
			this.graphics.clear();
			this.vo.body.draw();
			this.rotation += ddr;
			if(Math.random() > 0.8) ddr = 1 - Math.random() * 2;
			this.move();
			this.ifMove = true;
			this.ifEating = false;
			this.vo.energy += model.getEnergy(20 - 10 * Math.random());
		}
		override public function divisive():void {
			var body:LineBody = this.vo.body as LineBody;
			var cell:T1Cell = new T1Cell(body.w, body.h);
			cell.x = this.x;
			cell.y = this.y;
			model.addCell(cell);
		}
	}
}