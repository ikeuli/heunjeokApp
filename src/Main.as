package 
{
	import flash.display.Bitmap;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.display.MovieClip;
	import flash.events.*;
	
	/**
	 * ...
	 * @author MB
	 */
	public class Main extends MovieClip
	{
		[Embed(source = "../fla/login.swf", mimeType = "application/octet-stream")]
		private var login:Class;
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
			submitButton1.buttonMode = true;
			submitButton1.addEventListener(MouseEvent.MOUSE_DOWN, checkLogin);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			usernameBox.text = "";
            passwordBox.text = "";
			trace("success");
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		public function checkLogin (e:MouseEvent):void {
         
            trace("submission success");
         
        }
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
	}
	
}