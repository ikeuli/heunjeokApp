package actions 
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
     
    public class main extends MovieClip 
	{
		public function main ():void 
		{
			//submitButton1.buttonMode = true;
			submitButton1.addEventListener(MouseEvent.MOUSE_DOWN, checkLogin);
			usernameBox.text = "";
            passwordBox.text = "";
        }
		
		public function checkLogin (e:MouseEvent):void 
		{
			if (usernameBox.text == "" || passwordBox.text == "") 
				errorMsg.text = "Please enter a username and password.";
			
			else
				processLogin();
		}
		
		public function processLogin ():void {
		 
			var phpVars:URLVariables = new URLVariables();
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/app/appConnect.php");
			trace(phpFileRequest);
			
			phpFileRequest.method = URLRequestMethod.POST;			 
			phpFileRequest.data = phpVars;
			 
			var phpLoader:URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.TEXT;  
			phpLoader.addEventListener(Event.COMPLETE, showResult);
			 
			phpVars.systemCall = "checkLogin";
			phpVars.username = usernameBox.text;
			phpVars.password = passwordBox.text;
			 
			phpLoader.load(phpFileRequest);
		}
		
		public function showResult (event:Event):void 
		{
			errorMsg.autoSize = TextFieldAutoSize.LEFT;
			//errorMsg.text = "" + event.target.data.systemResult;
		}
	}
}