package com.flashgen.gaming.utils
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;

	public class Registry
	{
		//////////////////////////////////////////
		//   Private / Protected  Variables     //
		//////////////////////////////////////////
		private static var _screenWidth	:Number;
		private static var _screenHeight:Number;
		private static var _js		:ThumbStick;
		private static var _btnA	:ArcadeButton;
		private static var _btnB	:ArcadeButton;
		
		//////////////////////////////////////////
		//   		Public Variables		    //
		//////////////////////////////////////////
		public static var uiLayer	:Sprite;
		public static var uiVisible	:Boolean;

		//////////////////////////////////////////
		//            	Constructor             //
		//////////////////////////////////////////
		public function Registry()
		{
		}
		
		//////////////////////////////////////////
		//  	  Static Public  Methods 	   	//
		//////////////////////////////////////////
		public static function hideUI():void
		{
			uiLayer.visible = false;
		}
		
		public static function showUI():void
		{
			uiLayer.visible = true;
		}
		
		public static function createUI():Sprite
		{
			uiLayer = new Sprite();
			uiLayer.visible = uiVisible;
			
			_js = new ThumbStick();
			_js.x = 100
			_js.y = screenHeight - 100;

			_js.alpha = 0.5
			_js.boundary.width = 400;
			_js.boundary.height = 400;
			
			_btnA = new ArcadeButton();
			_btnA.x = screenWidth - 80;
			_btnA.y = screenHeight - 200;
			_btnA.alpha = 0.5;
			_btnA.buttonVersion = ArcadeButton.BUTTON_A;	
			_btnA.emulateKeyboard = true;
			_btnA.keyCodeValue = Keyboard.C;
			_btnA.charCodeValue = Keyboard.C;
			_btnA.scaleX = 2;
			_btnA.scaleY = 2;
			
			_btnB = new ArcadeButton();
			_btnB.x = screenWidth - 140;
			_btnB.y = screenHeight - 80;
			_btnB.alpha = 0.5;
			_btnB.buttonVersion = ArcadeButton.BUTTON_B;
			_btnB.emulateKeyboard = true;
			_btnB.keyCodeValue = Keyboard.X;
			_btnB.charCodeValue = Keyboard.X;
			_btnB.scaleX = 2;
			_btnB.scaleY = 2;
			
			uiLayer.addChild(_js);
			uiLayer.addChild(_btnB);
			uiLayer.addChild(_btnA);
			
			return uiLayer;	
		}


		public static function get screenWidth():Number
		{
			return _screenWidth;
		}

		public static function set screenWidth(value:Number):void
		{
			_screenWidth = value;
		}

		public static function get screenHeight():Number
		{
			return _screenHeight;
		}

		public static function set screenHeight(value:Number):void
		{
			_screenHeight = value;
		}

	}
}