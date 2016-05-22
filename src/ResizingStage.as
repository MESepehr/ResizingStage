package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Capabilities;
	
	[SWF(width="1024",height="768",frameRate="30",backgroundColor="#000")]
	public class ResizingStage extends Sprite
	{
		public function ResizingStage()
		{
			super();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE,manageStageSize);
			trace("Capabilities.screenDPI : "+Capabilities.screenDPI);
			trace("Capabilities.screenResolutionX : "+Capabilities.screenResolutionX);
			manageStageSize(null);
		}
		
		private function manageStageSize(e:Event):void
		{
			this.graphics.clear();
			this.graphics.beginFill(0xff0000,1);
			this.graphics.drawRoundRect(0,0,stage.stageWidth,stage.stageHeight,100);
			trace(stage.stageWidth/Capabilities.screenDPI,stage.stageHeight/Capabilities.screenDPI);
		}
	}
}