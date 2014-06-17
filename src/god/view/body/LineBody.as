package god.view.body
{
	import flash.display.Sprite;
	
	import god.vo.PointVO;
	import god.vo.colors.BaseColorVO;

	public class LineBody extends BaseBody
	{
		
		public function LineBody(cell:Sprite, w:Number, h:Number, n:int, d:Number, r:Number, color:BaseColorVO)
		{
			r *= Math.PI / 180;
			
			super(cell, w, h, n, d, r, color);
			
			var dr:Number = w / n;
			
			DNA.push(new PointVO(0, 0, 0, 0, 0));
			
			for(var i:int = 1; i < n; i++) {
				DNA.push(new PointVO(i * dr, 0, d,
					r - 2 * r * Math.random(),
					Math.PI/2 * (i%2==0?1:-1)
				));
			}
		}
		
		private function calculatePoint(point:PointVO, isRandom:Boolean = false):PointVO {
			if(isRandom) {
				point.xc = point.x + point.d * Math.random();
				point.yc = point.y + point.d * Math.sin(point.or) * Math.random();
			} else {
				point.xc = point.x;
				point.yc = point.y + point.d * Math.sin(point.or);
			}
			point.or += point.r;
			return point;
		}
		
		override public function draw(isRandom:Boolean=false):void {
			
			var point1:PointVO = calculatePoint(DNA[0] as PointVO, isRandom);
			var point2:PointVO;
			
			var xt:Number;
			var yt:Number;
			
			this.cell.graphics.lineStyle(this.color.lineWidth, this.color.lineColor, this.color.lineAlpha);
			this.cell.graphics.moveTo(point1.x, point1.y);
			
			for(var i:int = 1; i < n - 1; i++) {
				point1 = calculatePoint(DNA[i] as PointVO, isRandom);
				point2 = calculatePoint(DNA[i + 1] as PointVO, isRandom);
				xt = (point1.xc + point2.xc)/2;
				yt = (point1.yc + point2.yc)/2;
				this.cell.graphics.curveTo(point1.xc,point1.yc,xt,yt);
			}
			
			//for(i = 0; i < n; i++) {
			//	point1 = DNA[i] as PointVO;
			//	cell.graphics.drawCircle(point1.xc, point1.yc, 1);
			//	cell.graphics.drawCircle(point1.x, point1.y, 1);
			//}
		}
	}
}