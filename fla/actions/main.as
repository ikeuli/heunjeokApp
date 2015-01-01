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
			
			try 
			{
				submitButton2.addEventListener(MouseEvent.MOUSE_DOWN, inputStats);
				categoryBox.text = "";
				amountBox.text = "";
			}
			catch(err:Error){}
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
				errorMsg.text = "Please enter a category and amount.";
			else
				trace("ddd");
				//processLogin();
		}
		
		public function processLogin():void {
		 
			var phpVars:URLVariables = new URLVariables();
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/appConnect.php?rand=" + Math.random() * 999999);
			
			phpFileRequest.method = URLRequestMethod.POST;			 
			phpFileRequest.data = phpVars;
			 
			var phpLoader:URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;  
			phpLoader.addEventListener(Event.COMPLETE, processResult);
			 
			phpVars.systemCall = "checkLogin";
			phpVars.username = usernameBox.text;
			phpVars.password = passwordBox.text;
			 
			phpLoader.load(phpFileRequest);
		}
		
		public function processResult(e:Event):void 
		{
			if(e.target.data.systemResult == "Success!")
				gotoAndPlay(5);
			else
			{
				errorMsg.autoSize = TextFieldAutoSize.LEFT;
				errorMsg.text = "" + e.target.data.systemResult;
				usernameBox.text = "";
				passwordBox.text = "";
			}
		}
	}
}