package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	import managers.core.ScreenManager;
	
	[SWF(width="1024",height="768",frameRate="30",backgroundColor="#000")]
	public class ResizingStage extends Sprite
	{
		private var testView:Sprite ; 
		
		private var text:TextField ;
		
		public function ResizingStage()
		{
			super();
			
			testView = new Sprite();
			testView.graphics.beginFill(0xff0000);
			testView.graphics.drawRoundRect(0,0,1024,768,100);
			this.addChild(testView);
			
			text = new TextField();
			text.textColor = 0xffffff ;
			this.addChild(text);
			
			ScreenManager.eventDispatcher.addEventListener(Event.RESIZE,manageStageSize);
			ScreenManager.setUp(stage,1024,768);
			
		}
		
		protected function oncliecked(event:Event):void
		{
			// TODO Auto-generated method stub
			
		}
		
		private function manageStageSize(e:Event):void
		{
			testView.scaleX = testView.scaleY = ScreenManager.scaleFactor ;
			testView.x = ScreenManager.deltaXOnScaleFactor();
			testView.y = ScreenManager.deltaYOnScaleFactor();
			text.text = ScreenManager.screenDPI.toString() ;
		}
	}
}