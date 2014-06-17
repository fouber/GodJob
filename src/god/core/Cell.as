package god.core
{
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	
	import god.events.EatEvent;
	import god.model.ModelLocator;
	import god.view.body.BaseBody;
	import god.view.karyon.BaseKaryon;
	import god.vo.cell.BaseCellVO;
	
	public class Cell extends Sprite
	{
		
		public var vo:BaseCellVO;
		public var model:ModelLocator;
		public var guid:String;
		public var ifMove:Boolean = true;
		public var ifEating:Boolean = false;
		
		public function Cell() {
			super();
			this.model = ModelLocator.getInstance();
			this.guid = model.getGUID();
		}
		
		public function getTarget(r:Number):Number {
			return r;
		}
		
		public function move(r:Number = -1):void {
			var ov:BaseCellVO = this.vo;
			if(ov.age >= ov.dieAge || ov.energy < ov.base_energy) {
				if(this.die()) {
					model.giveEnergy(ov.energy * 0.8);
				}
				return;
			} else {
				old(ov.dage);
			}
			if(ov.divisiveNum > 0 && ov.age > ov.bornAge && ov.energy > ov.bornAge + ov.base_energy + 100) {
				ov.energy -= ov.born_energy;
				this.divisive();
				ov.divisiveNum--;
				ov.age = 0;
				return;
			}
			if(!ifMove) return;
			var x:Number;
			var y:Number;
			if(r>0) {
				ov.rt = getTarget(r);
				x = this.x + Math.cos(ov.rt) * ov.speed;
				y = this.y + Math.sin(ov.rt) * ov.speed;
			}
			else {
				var w:Number = ov.width;
				var h:Number = ov.height;
				var sw:Number = model.stage.stageWidth;
				var sh:Number = model.stage.stageHeight;
				x = this.x + Math.cos(ov.rt) * ov.speed;
				y = this.y + Math.sin(ov.rt) * ov.speed;
				if(x < w || x > sw - w || y < h || y > sh - h) {
					ov.rt = -ov.rt + (2 * ov.rt - Math.PI)*Math.random();
					return;
				}
			}
			this.x = x;
			this.y = y;
			ov.energy-=ov.denergy;
			if(ifEating) return;
			if(Math.random() > 0.8) this.vo.dt = 1 - 2 * Math.random();
			var deep:Number = ov.deep + ov.dt;
			if(deep < 0 || deep > model.deep) return;
			ov.deep = deep;
			this.filters = [new BlurFilter(deep, deep)];
		}
		public function eat(cell:Cell):void {
			//this.ifMove = false;
			this.ifEating = true;
			this.vo.rt = Math.atan2(cell.y - this.y,cell.x - this.x);
			this.x += Math.cos(this.vo.rt) * this.vo.speed;
			this.y += Math.sin(this.vo.rt) * this.vo.speed;
			if(Math.abs(this.x - cell.x) < this.vo.speed || Math.abs(this.y - cell.y) < this.vo.speed ) {
				if(cell.die()){
					this.ifEating = false;
					this.ifMove = true;
					getEnergy(cell.vo.energy * 0.8);
				}
			}
		}
		public function divisive():void {
			
		}
		public function eatBy(cell:Cell):void {
			this.ifMove = false;
		}
		public function getEnergy(e:Number):void {
			e += this.vo.energy;
			if(e > this.vo.top_energy) return;
			else this.vo.energy = e;
		}
		public function born():Boolean {
			return true;
		}
		public function old(dage:int):void {
			this.vo.age++;
		}
		public function die():Boolean {
			this.alpha -= 0.05;
			this.filters = [new GlowFilter(0xffcccc,0.8)];
			if(this.alpha <= 0.1) {
				model.addDie(this);
				return true;
			} else {
				return false;
			}
		}
		public function sick(level:int):void {}
		public function survive():void {}
		public function run():void {}
		public function eatNews(evt:EatEvent):void {
			trace(evt.level);
			if(evt.level == this.vo.level) {
				this.vo.rt = Math.atan2(this.y - evt.y, this.x - evt.x);
				trace(evt.level);
			}
		}
		public function setVO(vo:BaseCellVO):void {
			this.vo = vo;
		}
	}
}