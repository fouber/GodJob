package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import god.core.Cell;
	import god.model.ModelLocator;
	
	public class main extends Sprite
	{
		
		private var model:ModelLocator;
		private var num:int = 50;
		
		public function main()
		{
			model = ModelLocator.getInstance();
			this.addEventListener(Event.ENTER_FRAME, init);
		}
		
		private function init(evt:Event):void
		{
			if(stage.stageWidth) {
				model.setStage(stage, this);
				this.removeEventListener(Event.ENTER_FRAME, init);
				for(var i:int = 0; i < num; i++){
					var r:Number = Math.random();
					if(r < 0.35) {
						add(model.createT1());
					}
					if(r>=0.35 && r < 0.6) {
						add(model.createT2());
					}
					if(r>=0.6 && r < 0.75) {
						add(model.createT3());
					}
					if(r>=0.75 && r < 0.9) {
						add(model.createT4());
					}
					if(r >= 0.9) {
						add(model.createT5());
					}
				}
			}
		}
		private function add(cell:Cell):void {
			cell.x = (stage.stageWidth - 200) * Math.random() + 100;
			cell.y = (stage.stageHeight - 200) * Math.random() + 100;
			model.addCell(cell);
		}
	}
}