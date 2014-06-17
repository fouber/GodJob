package god.vo.cell
{
	import flash.display.Sprite;
	
	import god.view.body.LineBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.colors.BaseColorVO;

	public class T1CellVO extends BaseCellVO
	{
		public function T1CellVO(cell:Sprite, w:Number, h:Number)
		{
			super();
			this.width = w + 5 - 10 * Math.random();
			this.height = h + 5 + 2.5 * Math.random();
			this.colors = [BaseColorVO.CellBody1, BaseColorVO.CellKaryon];
			this.level = 1;
			this.foods = [];
			
			var n:int = Math.ceil(this.width / this.height) + 2;
			var d:int = 10 - 5 * Math.random();
			var r:int = 30 - 15 * Math.random();
			
			this.body = new LineBody(cell, width, height, n, d, r, colors[0] as BaseColorVO);
			
			this.dieAge = 945 - 90 * Math.random();
			this.bornAge = 475.5 - 45 * Math.random();
			this.energy = 1050 - 100*Math.random();
			this.denergy = 1.05 - 0.1*Math.random();
			this.base_energy = 105 - 10*Math.random();
			this.born_energy = 210 - 20*Math.random();
			this.top_energy = 2100 - 200*Math.random();
			this.ill_rate = 0.1;
			this.illLevel = 0;
			this.speed = 2.125 - 0.25 * Math.random();
			this.surviveLine = 1.05 - 0.1 * Math.random();
		}
	}
}