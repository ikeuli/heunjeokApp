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
			initLoginBoxes();
        }
		
		//Used to make the login screen input boxes blank.
		public function initLoginBoxes():void
		{
			usernameBox.text = "";
            passwordBox.text = "";
		}
		
		//Used to make the input screen input boxes blank.
		public function initInputBoxes():void
		{
			categoryBox.text = "";
			amountBox.text = "";
			memoBox.text = "";
			monthBox.text = "";
			dayBox.text = "";
			yearBox.text = "";
		}
		
		//Checks user entered login credentials.
		public function checkLogin(e:MouseEvent):void 
		{
			if(usernameBox.text == "" || passwordBox.text == "") 
			{
				errorMsg.autoSize = TextFieldAutoSize.LEFT;
				errorMsg.text = "Please enter a username and password.\nDon't have an account? Visit heunjeok.com.";
			}
			else
				processLogin();
		}
		
		//Checks that user entered required or correct input.
		public function inputStats(e:MouseEvent):void 
		{
			var moneyRegex:RegExp = /^[0-9]+(?:\.[0-9]{2}){0,1}$/;
			var numRegex:RegExp = /^(\s*|\d+)$/;
			var now:Date = new Date();
			
			if(categoryBox.text == "" || amountBox.text == "") 
				errorMsg2.text = "Please enter a category and amount.";
			else if(!moneyRegex.test(amountBox.text))
				errorMsg2.text = "Please enter a valid money amount.";
			else
			{
				if(monthBox.text == "" && dayBox.text == "" && yearBox.text == "")
					processInput();
				else if(!numRegex.test(monthBox.text) || !numRegex.test(dayBox.text) || !numRegex.test(yearBox.text))
					errorMsg2.text = "Please enter a valid date.";
				else
				{
					if(Number(yearBox.text) <= now.getFullYear())
					{
						if(Number(monthBox.text) <= (now.getMonth() + 1))
						{
							if(Number(dayBox.text) <= now.getDate())
							{
								if(monthBox.text == "1" || monthBox.text == "01")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "2" || monthBox.text == "02")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 28)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "3" || monthBox.text == "03")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "4" || monthBox.text == "04")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 30)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "5" || monthBox.text == "05")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "6" || monthBox.text == "06")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 30)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "7" || monthBox.text == "07")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "8" || monthBox.text == "08")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "9" || monthBox.text == "09")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 30)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "10")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "11")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 30)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
								else if(monthBox.text == "12")
								{
									if(Number(dayBox.text) < 1 || Number(dayBox.text) > 31)
										errorMsg2.text = "Please enter a valid date.";
									else
										processInput();
								}
							}
							else
								errorMsg2.text = "Please enter a present or past date.";
						}
						else
							errorMsg2.text = "Please enter a present or past date.";
					}
					else
						errorMsg2.text = "Please enter a present or past date.";
				}
			}
		}
		
		public function processLogin():void {
		 
			var phpVars:URLVariables = new URLVariables();
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/heunjeok/appConnect.php?rand=" + Math.random() * 999999);
			
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
			var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/heunjeok/appConnect.php?rand=" + Math.random() * 999999);
			
			phpFileRequest.method = URLRequestMethod.POST;			 
			phpFileRequest.data = phpVars;
			 
			var phpLoader:URLLoader = new URLLoader();
			phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;  
			phpLoader.addEventListener(Event.COMPLETE, processInputResult);
			 
			phpVars.systemCall = "inputStats";
			phpVars.category = categoryBox.text;
			phpVars.amount = amountBox.text;
			if(memoBox.text != "")
				phpVars.memo = memoBox.text;
			if(monthBox.text != "")
				phpVars.customMonth = monthBox.text;
			if(dayBox.text != "")
				phpVars.customDay = dayBox.text;
			if(yearBox.text != "")
				phpVars.customYear = yearBox.text;
			 
			phpLoader.load(phpFileRequest);
		}
		
		public function processLoginResult(e:Event):void 
		{
			if(e.target.data.systemResult == "Success!")
			{
				submitButton1.removeEventListener(MouseEvent.MOUSE_DOWN, checkLogin);
				gotoAndPlay(5);
				
				var phpVars:URLVariables = new URLVariables();
				var phpFileRequest:URLRequest = new URLRequest("http://heunjeok.com/heunjeok/appConnect.php?rand=" + Math.random() * 999999);
				phpFileRequest.method = URLRequestMethod.POST;			 
				phpFileRequest.data = phpVars;
				var phpLoader:URLLoader = new URLLoader();
				phpLoader.dataFormat = URLLoaderDataFormat.VARIABLES;  
				phpLoader.addEventListener(Event.COMPLETE, processInputResult);
				phpVars.systemCall = "getStats";
				phpLoader.load(phpFileRequest);
				errorMsg2.autoSize = TextFieldAutoSize.LEFT;
				errorMsg2.text = "" + e.target.data.systemResult;
				
				submitButton2.addEventListener(MouseEvent.MOUSE_DOWN, inputStats);
				initInputBoxes();
			}
			else
			{
				errorMsg.autoSize = TextFieldAutoSize.LEFT;
				errorMsg.text = "" + e.target.data.systemResult + "\nDon't have an account? Visit heunjeok.com.";
				initLoginBoxes();
			}
		}
		
		public function processInputResult(e:Event):void 
		{
			errorMsg2.autoSize = TextFieldAutoSize.LEFT;
			errorMsg2.text = "" + e.target.data.systemResult;
			initInputBoxes();
		}
	}
}