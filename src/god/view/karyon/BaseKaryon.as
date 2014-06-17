package god.view.karyon
{
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import god.view.body.IBody;
	import god.vo.colors.BaseColorVO;
	
	public class BaseKaryon extends Shape implements IBody
	{
		public var w:Number;
		public var h:Number;
		public var color:BaseColorVO;
		
		private var bmd:BitmapData;
		private var seed:Number;
		
		public function BaseKaryon(w:Number,h:Number,color:BaseColorVO)
		{
			super();
			this.w = w;
			this.h = h;
			this.color = color;
			bmd = new BitmapData(w, h, true, color.fillColor);
			
			graphics.clear();
			graphics.lineStyle(color.lineWidth, color.lineColor, color.lineAlpha);
			graphics.beginBitmapFill(bmd);
			graphics.drawEllipse(-w/2,-h/2,w,h);
			graphics.endFill();
			this.alpha = color.fillAlpha;
		}
		
		public function draw(isRandom:Boolean=false):void
		{
			seed = Math.floor(Math.random() * 10);
			bmd.noise(seed, 0, 0xFF, BitmapDataChannel.ALPHA, false);
		}
	}
}