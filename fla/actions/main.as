package actions 
{
	import flash.display.MovieClip;
	import flash.events.*;
     
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
				//processLogin();
				errorMsg.text = "OK.";
		}
	}
}