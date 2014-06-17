package god.view.body
{
	import flash.display.Sprite;
	
	import god.vo.PointVO;
	import god.vo.colors.BaseColorVO;

	public class CircleBody extends BaseBody
	{
		public function CircleBody(cell:Sprite, w:Number, h:Number, n:int, d:Number, r:Number, color:BaseColorVO)
		{
			r *= Math.PI / 180;
			
			super(cell, w, h, n, d, r, color);
			
			var dr:Number = Math.PI * 2 / n;
			var q:Number = 0;
			
			for(var i:int = 0; i < n; i++) {
				DNA.push(new PointVO(
					w * Math.cos(q),
					h * Math.sin(q),
					d - 2 * d * Math.random(),
					r - 2 * r * Math.random(),
					Math.PI * 2 * Math.random()
				));
				q += dr;
			}
		}
		
		private function calculatePoint(point:PointVO, isRandom:Boolean = false):PointVO {
			if(isRandom) {
				point.xc = point.x + point.d * Math.cos(point.or) * Math.random();
				point.yc = point.y + point.d * Math.sin(point.or) * Math.random();
			} else {
				point.xc = point.x + point.d * Math.cos(point.or);
				point.yc = point.y + point.d * Math.sin(point.or);
			}
			point.or += point.r;
			return point;
		}
		
		override public function draw(isRandom:Boolean = false):void {
			
			var point1:PointVO = calculatePoint(DNA[0] as PointVO, isRandom);
			var point2:PointVO = calculatePoint(DNA[n-1] as PointVO, isRandom);
			
			var xt:Number = (point1.xc + point2.xc)/2;
			var yt:Number = (point1.yc + point2.yc)/2;
			var x0:Number = xt;
			var y0:Number = yt;
			
			this.cell.graphics.moveTo(xt, yt);
			this.cell.graphics.lineStyle(this.color.lineWidth, this.color.lineColor, this.color.lineAlpha);
			this.cell.graphics.beginFill(this.color.fillColor, this.color.fillAlpha);
			
			for(var i:int = 1; i < n; i++) {
				point1 = calculatePoint(DNA[i-1] as PointVO, isRandom);
				point2 = calculatePoint(DNA[i] as PointVO, isRandom);
				xt = (point1.xc + point2.xc)/2;
				yt = (point1.yc + point2.yc)/2;
				this.cell.graphics.curveTo(point1.xc,point1.yc,xt,yt);
			}
			point1 = calculatePoint(DNA[n-1] as PointVO, isRandom);
			this.cell.graphics.curveTo(point1.xc,point1.yc,x0,y0);
			this.cell.graphics.endFill();
		}
	}
}