package
{
	import com.adamatomic.Mode.MenuState;
	import com.flashgen.gaming.utils.Registry;
	
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Keyboard;
	
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	[SWF(backgroundColor="#000000")]
	public class Mode extends FlxGame
	{	
		public function Mode():void
		{
			FlxG.mobile = true;
			
			FlxG.debug = true;
			
			/*
			As the container reports the default dimensions of the application you need to check and apply as needed so the screen is
			laid out using the right dimensions for a landscape orientation.
			*/
			Registry.screenWidth = (stage.fullScreenWidth > stage.fullScreenHeight) ? stage.fullScreenWidth : stage.fullScreenHeight;
			Registry.screenHeight = (stage.fullScreenHeight > stage.fullScreenWidth) ? stage.fullScreenWidth : stage.fullScreenHeight;

			super(Registry.screenWidth/2,Registry.screenHeight/2,MenuState,2,50,50);
			
			addNativeSettings();
		}
		
		protected function addNativeSettings():void
		{
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			NativeApplication.nativeApplication.addEventListener( Event.DEACTIVATE , onDeactivate ); 
		}
		
		protected function onDeactivate(e:Event):void
		{
			FlxG.paused = true;
		}
	}
}
