package god.vo.cell
{
	import flash.display.Sprite;
	
	import god.view.body.ComplexBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.colors.BaseColorVO;
	
	public class T5CellVO extends BaseCellVO
	{
		public function T5CellVO(cell:Sprite, w:Number, h:Number,n:int, tw:Number, th:Number)
		{
			super();
			
			this.colors = [BaseColorVO.CellBody4, BaseColorVO.CellKaryon];
			
			this.width = w + 5 - 10 * Math.random();
			this.height = h + 5 + 2.5 * Math.random();
			this.level = 5;
			this.foods = [3,4];
			
			//var n:int = Math.round(4 + Math.random() * 4);
			var d:Number = 15 - 7.5 * Math.random();
			var r:Number = 10 - 5 * Math.random();
			
			this.body = new ComplexBody(cell, w, h, n, d, r, colors[0] as BaseColorVO, n, tw, th, 4, d, r, colors[0]);
			this.karyon = new BaseKaryon(w/3 + 10 * Math.random(), h/3 + 10 * Math.random(), colors[1]);
			
			this.dieAge = 2835 - 270 * Math.random();
			this.bornAge = 1417.5 - 135 * Math.random();
			this.energy = 4200 - 400*Math.random();
			this.denergy = 5.25 - 0.5*Math.random();
			this.base_energy = 525 - 50*Math.random();
			this.born_energy = 1050 - 100*Math.random();
			this.top_energy = 8400 - 800*Math.random();
			this.ill_rate = 0.1;
			this.illLevel = 0;
			this.speed = 0.525 - 0.05 * Math.random();
			this.surviveLine = 10.5 - 1 * Math.random();
		}
	}
}