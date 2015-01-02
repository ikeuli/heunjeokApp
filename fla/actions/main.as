package actions 
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.text.*;
     
    public class main extends MovieClip 
	{
		public function main():void 
		{
			submitButton1.addEventListener(MouseEvent.MOUSE_DOWN, checkLogin);
			usernameBox.text = "";
            passwordBox.text = "";
        }
		
		public function checkLogin(e:MouseEvent):void 
		{
			if (usernameBox.text == "" || passwordBox.text == "") 
				errorMsg.text = "Please enter a username and password.";
			else
				processLogin();
		}
		
		public function inputStats(e:MouseEvent):void 
		{
			if (categoryBox.text == "" || amountBox.text == "") 
				errorMsg2.text = "Please enter a category and amount.";
			else
				processInput();
		}
		
		public function processLogin():void {
		 
			var phpVars:URLVariables = new URLVariables();
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/appConnect.php?rand=" + Math.random() * 999999);
			
			phpFileRequest.method = URLRequestMethod.POST;			 
			phpFileRequest.data = phpVars;
			 
			var phpLoader:URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;  
			phpLoader.addEventListener(Event.COMPLETE, processLoginResult);
			 
			phpVars.systemCall = "checkLogin";
			phpVars.username = usernameBox.text;
			phpVars.password = passwordBox.text;
			 
			phpLoader.load(phpFileRequest);
		}
		
		public function processInput():void {
		 
			var phpVars:URLVariables = new URLVariables();
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/appConnect.php?rand=" + Math.random() * 999999);
			
			phpFileRequest.method = URLRequestMethod.POST;			 
			phpFileRequest.data = phpVars;
			 
			var phpLoader:URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;  
			phpLoader.addEventListener(Event.COMPLETE, processInputResult);
			 
			phpVars.systemCall = "inputStats";
			phpVars.category = categoryBox.text;
			phpVars.amount = amountBox.text;
			 
			phpLoader.load(phpFileRequest);
		}
		
		public function processLoginResult(e:Event):void 
		{
			if(e.target.data.systemResult == "Success!")
			{
				submitButton1.removeEventListener(MouseEvent.MOUSE_DOWN, checkLogin);
				gotoAndPlay(5);
				submitButton2.addEventListener(MouseEvent.MOUSE_DOWN, inputStats);
				categoryBox.text = "";
				amountBox.text = "";
			}
			else
			{
				errorMsg.autoSize = TextFieldAutoSize.LEFT;
				errorMsg.text = "" + e.target.data.systemResult;
				usernameBox.text = "";
				passwordBox.text = "";
			}
		}
		
		public function processInputResult(e:Event):void 
		{
			categoryBox.text = "";
			amountBox.text = "";
		}
	}
}