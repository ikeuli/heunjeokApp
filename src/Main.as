package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author MB
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../img/background.jpg")]
		private var bgImg:Class;
		private var bg:Bitmap = new bgImg();
		[Embed(source = "../img/dollarswon.png")]
		private var currImg:Class;
		private var curr:Bitmap = new currImg();
		[Embed(source = "../img/heunjeok.png")]
		private var logoImg:Class;
		private var logo:Bitmap = new logoImg();
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			addChild(bg);
			logo.width = stage.stageWidth - 20;
			logo.x = 15;
			logo.y = 15;
			addChild(logo);
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}