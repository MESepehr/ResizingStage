package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import managers.core.ScreenManager;
	
	import starling.core.Starling;
	
	[SWF(width="1024",height="768",frameRate="30",backgroundColor="#000")]
	public class ResizingStage extends Sprite
	{
		private var testView:Sprite ; 
		
		
		private var starl:Starling ;
		
		public function ResizingStage()
		{
			super();
			
			testView = new Sprite();
			testView.graphics.beginFill(0xff0000,0.5);
			testView.graphics.drawRoundRect(0,0,1024,768,100);
			this.addChild(testView);
			
			starl = new Starling(StarlingMain,stage);
			starl.start();
			
			ScreenManager.eventDispatcher.addEventListener(Event.RESIZE,manageStageSize);
			ScreenManager.setUp(stage,1024,768);
			
		}
		
		
		private function manageStageSize(e:Event):void
		{
			root.scaleX = testView.scaleY = ScreenManager.scaleFactor ;
			if(true)
			{
				root.x = ScreenManager.deltaXOnScaleFactor();
				root.y = ScreenManager.deltaYOnScaleFactor();
			}
			else
			{
				testView.graphics.clear();
				testView.graphics.beginFill(0xff0000,0.5);
				testView.graphics.drawRoundRect(0,0,ScreenManager.stageWidthOnScale(),ScreenManager.stageHeightOnScale(),100);
			}
			
			starl.viewPort = new Rectangle(0,0,ScreenManager.stageWidth,ScreenManager.stageHeight);
			starl.stage.stageWidth = ScreenManager.stageWidth ;
			starl.stage.stageHeight = ScreenManager.stageHeight ;
		}
	}
}