package god.vo.cell
{
	import flash.display.Sprite;
	
	import god.view.body.CircleBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.colors.BaseColorVO;
	
	public class T4CellVO extends BaseCellVO
	{
		public function T4CellVO(cell:Sprite, w:Number, h:Number)
		{
			super();
			
			this.colors = [BaseColorVO.CellBody, BaseColorVO.CellKaryon];
			
			this.width = w + 5 - 10 * Math.random();
			this.height = h + 5 + 2.5 * Math.random();
			this.level = 4;
			this.foods = [1,2];
			
			var n:int = Math.round(4 + Math.random() * 4);
			var d:Number = 15 - 7.5 * Math.random();
			var r:Number = 10 - 5 * Math.random();
			
			this.body = new CircleBody(cell, w, h, n, d, r, colors[0]);
			this.karyon = new BaseKaryon(w/3 + 10 * Math.random(), h/3 + 10 * Math.random(), colors[1]);
			
			this.dieAge = 2100 - 200 * Math.random();
			this.bornAge = 1050 - 100 * Math.random();
			this.energy = 2310 - 220*Math.random();
			this.denergy = 3.675 - 0.35*Math.random();
			this.base_energy = 367.5 - 35*Math.random();
			this.born_energy = 735 - 70*Math.random();
			this.top_energy = 4510 - 220*Math.random();
			this.ill_rate = 0.1;
			this.illLevel = 0;
			this.speed = 1.05 - 0.1 * Math.random();
			this.surviveLine = 6.3 - 0.6 * Math.random();
		}
	}
}