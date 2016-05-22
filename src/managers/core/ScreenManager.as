package managers.core
{
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.system.Capabilities;

	[Event(name="resize", type="flash.events.Event")]
	public class ScreenManager extends EventDispatcher
	{
		/**You can catch all events on this variable*/
		public static const eventDispatcher:ScreenManager = new ScreenManager();
		
		/**This is the default screedDPI*/
		public static const defaultDPI:Number = 72 ;
		
		
		/**This is the application stage*/
		private static var stage:Stage ;
		
		
		/**Original stage widh and height will store here*/
		private static var flashW:Number,flashH:Number;
		
		private static var _stageWidth:Number,_stageHeight:Number;
		
		/**Stored screenDPI*/
		private static var _screenDPI:Number ;
		
		/**Resized position of stage*/
		private static var scaleFactorX:Number,scaleFactorY:Number;
		
		
		private static var deltaX:Number,deltaY:Number;
		
		public function ScreenManager()
		{
			super();
		}

		/**Seting up the screenManager.*/
		public static function setUp(myStage:Stage,flashWidth:Number,flashHeight:Number,fakeDPI:Number=NaN):void
		{
			stage = myStage ;
			stage.addEventListener(Event.RESIZE,stageResized);
			
			stage.scaleMode = StageScaleMode.NO_SCALE ;
			stage.align = StageAlign.TOP_LEFT ;
			
			if(isNaN(fakeDPI))
			{
				_screenDPI = Capabilities.screenDPI ;
			}
			else
			{
				_screenDPI = fakeDPI ;
			}
			
			flashW = flashWidth ;
			flashH = flashHeight ;
			
			stageResized(null);
		}
		
		/**Stage resized. chane all of your variables*/
		protected static function stageResized(event:Event):void
		{
			_stageWidth = stage.stageWidth ;
			_stageHeight = stage.stageHeight ;
			
			scaleFactorX = _stageWidth/flashW;
			scaleFactorY = _stageHeight/flashH;
			
			deltaX = _stageWidth-flashW;
			deltaY = _stageHeight-flashH;
			
			eventDispatcher.dispatchEvent(new Event(Event.RESIZE));
		}
		
		/**Returns the scaleFactor to resize objects on the defrent stage sizes. but it depends on screenDPI.<br>
		 * This is still on beta testing.*/
		public static function get scaleFactorBasedOnDPI():Number
		{
			return Math.min(scaleFactorX,scaleFactorY)*(_screenDPI/defaultDPI);
		}
		
		/**Returns the scale factor*/
		public static function get scaleFactor():Number
		{
			return Math.min(scaleFactorX,scaleFactorY);
		}
		
		/**Returns the max scale factor*/
		public static function get scaleFactorMax():Number
		{
			return Math.max(scaleFactorX,scaleFactorY);
		}
		
		
		/**This will return you a X based on the scaleFactor*/
		public static function Xstrech(X0:Number):Number
		{
			return X0*scaleFactorX ;
		}
		
		/**This will return you a Y based on the scaleFactor*/
		public static function Ystrech(Y0:Number):Number
		{
			return Y0*scaleFactorY ;
		}
		
		/**Returns the new X and add deltaStage on it
		public static function XaddDeltaOnScale(X0):Number
		{
			trace("deltaX : "+deltaX);
			var firstPosePrecent:Number = X0/flashW ;
			return X0+(deltaX/2)*scaleFactorX;
		}*/
		
		/**Returns the new Y and add deltaStage on it
		public static function YaddDeltaScale(Y0):Number
		{
			return Y0+(deltaY/2)*scaleFactorY;
		}*/
		
		/**Delta x based on resized object on scale factor*/
		public static function deltaXOnScaleFactor():Number
		{
			return (_stageWidth-flashW*scaleFactor)/2;
		}
		
		/**Delta y based on resized object on scale factor*/
		public static function deltaYOnScaleFactor():Number
		{
			return (_stageHeight-flashH*scaleFactor)/2;
		}
		
		
		
		
		/**Real stage widh and height*/
		public static function get stageHeight():Number
		{
			return _stageHeight;
		}
		
		public static function stageHeightOnScale():Number
		{
			return _stageHeight/scaleFactor ;
		}
		
		/**Real stage widh and height*/
		public static function get stageWidth():Number
		{
			return _stageWidth;
		}
		
		public static function stageWidthOnScale():Number
		{
			return _stageWidth/scaleFactor ;
		}
		
		
		
		/**This is the screenDPI. but I donw know how should I use it.*/
		public static function get screenDPI():Number
		{
			return _screenDPI;
		}
	}
}