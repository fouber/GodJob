package god.model
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.filters.DropShadowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import god.core.*;
	import god.events.EatEvent;
	
	public final class ModelLocator extends EventDispatcher
	{
		
		private static var model:ModelLocator;
		private var celllist:Array = [];
		private var energy:Number = 5000;
		private var dieList:Array = [];
		
		public function ModelLocator(target:IEventDispatcher=null)
		{
			super(target);
			if(model)
				throw new Error('only one instance accept');
		}
		public static function getInstance():ModelLocator {
			if(model)
				return model;
			else
				return model = new ModelLocator();
		}
		
		/*--------------------------  private properties  --------------------------*/
		
		private var menu:ContextMenu;
		private var copyright:String = '©2010 yunlong';
		
		/*--------------------------  private methods  --------------------------*/
		
		private function init():void {
			mainSprite.filters = [new DropShadowFilter(4,45,0x999999)];
		}
		private function onEnterFrame(evt:Event):void {
			var n:int = celllist.length;
			for(var i:int = 0; i < n; i++){
				var cell1:Cell = celllist[i] as Cell;
				for(var j:int = i + 1; j < n; j++) {
					var cell2:Cell = celllist[j] as Cell;
					if(Math.abs(cell2.vo.deep - cell1.vo.deep) < 1.5 && hitTest(mainSprite, cell1,cell2)) {
						var r:int = eatTest(cell1, cell2);
						var eatEvt:EatEvent;
						switch(r){
							case 1:
								//if(cell1.ifEating) continue;
								cell1.eat(cell2);
								cell2.eatBy(cell1);
								eatEvt = new EatEvent(cell2.x, cell2.y, cell2.vo.level);
								this.dispatchEvent(eatEvt);
								break;
							case -1:
								//if(cell2.ifEating) continue;
								cell2.eat(cell1);
								cell1.eatBy(cell2);
								eatEvt = new EatEvent(cell1.x, cell1.y, cell1.vo.level);
								this.dispatchEvent(eatEvt);
								break;
						}
					}
				}
				cell1.run();
			}
			n = dieList.length;
			while(n--){
				this.removeCell(dieList[n] as Cell);
			}
			dieList = [];
		}
		
		/*--------------------------  public properties  --------------------------*/
		
		public var stage:Stage;
		public var mainSprite:Sprite;
		public var deep:Number = 10;
		
		/*--------------------------  public methods  --------------------------*/
		
		public function setStage(stage:Stage, mainSprite:Sprite):void {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu = false;
			
			menu = new ContextMenu();
			menu.hideBuiltInItems();
			var crItem:ContextMenuItem = new ContextMenuItem(copyright);
			menu.customItems.push(crItem);
			mainSprite.contextMenu = menu;
			
			this.stage = stage;
			this.mainSprite = mainSprite;
			this.mainSprite.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			init();
		}
		public function addDie(cell:Cell):void {
			this.dieList.push(cell);
		}
		public function getGUID():String {
			var t:String = [new Date().getTime(),Math.round(Math.random() * 10000)].join('');
			return int(t).toString(32);
		}
		
		public function getEnergy(e:Number):Number {
			this.energy -= e;
			if(this.energy < 0) e = 0;
			return e;
		}
		public function giveEnergy(e:Number):void {
			this.energy += e;
		}
		
		public function hitTest(target:Sprite, mc1:DisplayObject, mc2:DisplayObject):Boolean {
			
			if(!mc1.hitTestObject(mc2)) return false;
			
			var colorT:ColorTransform = new ColorTransform(0,0,0,0,255,255,255,255);
			
			var rect1:Rectangle = mc1.getBounds(target);
			var offset1:Matrix = mc1.transform.matrix;
			offset1.tx = mc1.x - rect1.x;
			offset1.ty = mc1.y - rect1.y;
			var bmpData1:BitmapData = new BitmapData(rect1.width, rect1.height, true, 0);
			bmpData1.draw(mc1, offset1, colorT);
			var loc1:Point = new Point(rect1.x, rect1.y);
			
			var rect2:Rectangle = mc2.getBounds(target);
			var offset2:Matrix = mc2.transform.matrix;
			offset2.tx = mc2.x - rect2.x;
			offset2.ty = mc2.y - rect2.y;
			var bmpData2:BitmapData = new BitmapData(rect2.width, rect2.height, true, 0);
			bmpData2.draw(mc2, offset2, colorT);
			var loc2:Point = new Point(rect2.x, rect2.y);
			
			var r:Boolean = bmpData1.hitTest(loc1, 255, bmpData2, loc2, 255);
			bmpData1.dispose();
			bmpData2.dispose();
			return r;
		}
		
		public function eatTest(cell1:Cell, cell2:Cell):int {
			var r:int = 0;
			var foods:Array = cell1.vo.foods;
			var len:int = foods.length;
			var level:int = cell2.vo.level;
			while(len--){
				if(foods[len] == level) {
					r = 1;
					break;
				}
			}
			foods = cell2.vo.foods;
			len = foods.length;
			level = cell1.vo.level;
			while(len--){
				if(foods[len] == level) {
					r = -1;
					break;
				}
			}
			return r;
		}
		
		public function addCell(cell:Cell):void {
			this.celllist.push(cell);
			model.addEventListener(EatEvent.EAT_CELL, cell.eatNews);
			cell.born();
			mainSprite.addChild(cell);
		}
		public function removeCell(cell:Cell):void {
			var len:int = celllist.length;
			var c:Cell;
			while(len--) {
				c = celllist.shift() as Cell;
				if(c.guid === cell.guid) {
					mainSprite.removeChild(c);
					continue;
				}
				celllist.push(c);
			}
		}
		public function createT1():Cell {
			var cell:Cell = new T1Cell(
				80 - 20 * Math.random(),
				10 -5 * Math.random()
			);
			return cell;
		}
		public function createT2():Cell {
			var cell:Cell = new T2Cell(
				30 - 5 * Math.random(),
				30 - 5 * Math.random(),
				10 - 5 * Math.random()
			);
			return cell;
		}
		public function createT3():Cell {
			var cell:Cell = new T3Cell(
				20 - 10 * Math.random(),
				20 - 10 * Math.random(),
				30 - 5 * Math.random(),
				5 - 2 * Math.random()
			);
			return cell;
		}
		public function createT4():Cell {
			var cell:Cell = new T4Cell(
				40 - 10 * Math.random(),
				40 - 10 * Math.random()
			);
			return cell;
		}
		public function createT5():Cell {
			var cell:Cell = new T5Cell(
				50 - 10 * Math.random(),
				50 - 10 * Math.random(),
				20 - 10 * Math.random(),
				20 - 10 * Math.random(),
				20 - 10 * Math.random()
			);
			return cell;
		}
	}
}