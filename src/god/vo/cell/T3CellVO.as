package god.vo.cell
{
	import flash.display.Sprite;
	
	import god.core.T3Cell;
	import god.view.body.ComplexBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.colors.BaseColorVO;
	
	public class T3CellVO extends BaseCellVO
	{
		public function T3CellVO(cell:T3Cell, w:Number, h:Number, tw:Number, th:Number)
		{
			super();
			
			this.colors = [BaseColorVO.CellBody3, BaseColorVO.CellKaryon];
			
			this.width = w + 5 - 10 * Math.random();
			this.height = h + 5 + 2.5 * Math.random();
			this.level = 3;
			this.foods = [1];
			
			var n:int = Math.round(4 + Math.random() * 4);
			cell.oq = 180 / n;
			var d:Number = 4 - 2 * Math.random();
			var r:Number = 10 - 5 * Math.random();
			
			this.body = new ComplexBody(cell, width, height, n, d, r, colors[0] as BaseColorVO, 1, tw, th, n, d * 4, r, colors[0]);
			
			this.dieAge = 1890 - 180 * Math.random();
			this.bornAge = 945 - 90 * Math.random();
			this.energy = 2100 - 200*Math.random();
			this.denergy = 3.75 - 1.5*Math.random();
			this.base_energy = 315 - 30*Math.random();
			this.born_energy = 630 - 60*Math.random();
			this.top_energy = 4200 - 400*Math.random();
			this.ill_rate = 0.1;
			this.illLevel = 0;
			this.speed = 1.5725 - 0.15 * Math.random();
			this.surviveLine = 5.025 - 0.5 * Math.random();
		}
	}
}