package god.vo.colors
{
	public class BaseColorVO
	{
		
		public var lineColor:uint;
		public var lineWidth:Number;
		public var lineAlpha:Number;
		
		public var fillColor:uint;
		public var fillAlpha:Number;
		
		public static var CellBody:BaseColorVO = new BaseColorVO(0x666666,2,0.8,0xeeffce,0.4);
		public static var CellKaryon:BaseColorVO = new BaseColorVO(0x666666,2,0.8,0xeeffce,0.4);
		
		public static var CellBody1:BaseColorVO = new BaseColorVO(0x64BA28,6,0.5,0xeeffce,0.4);
		public static var CellBody2:BaseColorVO = new BaseColorVO(0x136CB9,3,0.5,0xeeffce,0.4);
		public static var CellBody3:BaseColorVO = new BaseColorVO(0xD10103,2,0.5,0xFFBFB7,0.4);
		public static var CellBody4:BaseColorVO = new BaseColorVO(0xFF7B02,2,0.5,0xFEE661,0.4);
		
		public function BaseColorVO(lineColor:uint = 0x000000, lineWidth:int = 1, lineAlpha:Number = 1, fillColor:uint = 0x000000, fillAlpha:Number = 1)
		{
			this.lineColor = lineColor;
			this.lineWidth = lineWidth;
			this.lineAlpha = lineAlpha;
			this.fillAlpha = fillAlpha;
			this.fillColor = fillColor;
		}
	}
}