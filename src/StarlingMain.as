package
{
	import flash.events.Event;
	
	import managers.core.ScreenManager;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	
	public class StarlingMain extends Sprite
	{
		public function StarlingMain()
		{
			var qu:Quad = new Quad(ScreenManager.flashW-10,ScreenManager.flashH-10,0x00ff00);
			qu.x = 5;
			qu.y = 5;
			this.addChild(qu);
			ScreenManager.eventDispatcher.addEventListener(Event.RESIZE,controllSize);
		}
		
		protected function controllSize(event:Event):void
		{
			this.scaleX = this.scaleY = ScreenManager.scaleFactor ;
			this.x = ScreenManager.deltaXOnScaleFactor() ;
			this.y = ScreenManager.deltaYOnScaleFactor() ;
		}
	}
}