package god.view.body
{
	import flash.display.Sprite;
	
	import god.vo.PointVO;
	import god.vo.colors.BaseColorVO;
	
	public class ComplexBody extends BaseBody
	{
		
		private var circleBody:CircleBody;
		private var tentacles:Array = [];
		
		public var tnum:int;
		public var tw:Number;
		public var th:Number;
		public var tn:int;
		public var td:Number;
		public var tr:Number;
		public var color2:BaseColorVO;
		
		public function ComplexBody(cell:Sprite, w:Number, h:Number, n:int, d:Number, r:Number, color:BaseColorVO,
			tnum:int, tw:Number, th:Number, tn:int, td:Number, tr:Number, color2:BaseColorVO) {
			super(cell, w, h, n, d, r, color);
			this.circleBody = new CircleBody(cell, w, h, n, d, r, color);
			if(tnum > n) tnum = n;
			var dr:Number = 360 / n;
			var q:Number = -dr/2;
			this.tnum = tnum;
			for(var i:int = 0; i < tnum; i++){
				var tentacle:Sprite = new Sprite();
				tentacles.push(new LineBody(tentacle, tw, th, tn, td, tr, color2));
				tentacle.rotation = q;
				cell.addChild(tentacle);
				q += dr;
			}
			this.DNA = circleBody.DNA;
			
			this.tnum = tnum;
			this.tw = tw;
			this.th = th;
			this.tn = tn;
			this.td = td;
			this.tr = tr;
			this.color2 = color2;
			
		}
		override public function draw(isRandom:Boolean=false):void {
			
			var point1:PointVO = circleBody.DNA[0] as PointVO;
			var point2:PointVO = circleBody.DNA[n-1] as PointVO;
			
			var tentacle:LineBody = tentacles[0] as LineBody;
			var color:BaseColorVO = tentacle.color;
			tentacle.cell.graphics.clear();
			tentacle.draw(isRandom);
			tentacle.cell.x = (point1.xc + point2.xc)/2;
			tentacle.cell.y = (point1.yc + point2.yc)/2;
			
			for(var i:int = 1; i < this.tnum; i++){
				point1 = circleBody.DNA[i-1] as PointVO;
				point2 = circleBody.DNA[i] as PointVO;
				tentacle = tentacles[i] as LineBody;
				color = tentacle.color;
				tentacle.cell.graphics.clear();
				tentacle.draw(isRandom);
				tentacle.cell.x = (point1.xc + point2.xc)/2;
				tentacle.cell.y = (point1.yc + point2.yc)/2;
			}
			circleBody.draw();
		}
	}
}