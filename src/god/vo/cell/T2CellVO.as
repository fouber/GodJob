package god.vo.cell
{
	import flash.display.Sprite;
	
	import god.view.body.ComplexBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.colors.BaseColorVO;
	
	public class T2CellVO extends BaseCellVO
	{
		public function T2CellVO(cell:Sprite, w:Number, h:Number,n:int)
		{
			super();
			
			this.colors = [BaseColorVO.CellBody2, BaseColorVO.CellKaryon];
			
			this.width = w + 5 - 10 * Math.random();
			this.height = h + 5 + 2.5 * Math.random();
			this.level = 2;
			this.foods = [];
			
			//var n:int = Math.round(4 + Math.random() * 4);
			var d:Number = 2 - Math.random();
			var r:Number = 10 - 5 * Math.random();
			
			this.body = new ComplexBody(cell, 0, 0, n, 0, 0, colors[0] as BaseColorVO, n, w, h, n, d * 2, r * 2, colors[0]);
			
			this.dieAge = 1050 - 100 * Math.random();
			this.bornAge = 525 - 50 * Math.random();
			this.energy = 1260 - 120*Math.random();
			this.denergy = 1.575 - 0.15*Math.random();
			this.base_energy = 157.5 - 15*Math.random();
			this.born_energy = 315 - 30*Math.random();
			this.top_energy = 2520 - 240*Math.random();
			this.ill_rate = 0.1;
			this.illLevel = 0;
			this.speed = 2.1 - 0.2 * Math.random();
			this.surviveLine = 2.1 - 0.2 * Math.random();
		}
	}
}