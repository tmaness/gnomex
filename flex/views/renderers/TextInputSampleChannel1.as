package views.renderers
{
	import mx.controls.TextInput;
	import flash.display.Graphics;
	import flash.events.Event;
	import hci.flex.renderers.RendererFactory;

	public class TextInputSampleChannel1 extends TextInput
	{
    	override protected function initializationComplete():void
        {   
            this.addEventListener(Event.CHANGE, change);
        }
        
        
        protected function change(event:Event):void {
        	if (this.text == "") {
	        	data["@idSampleChannel1"] = "0";
	        	parentDocument.cy3SampleDragGrid.invalidateDisplayList();
	 	        parentDocument.cy3SampleDragGrid.invalidateList();
        	}
        }
            		
    	override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
     	{
          super.updateDisplayList(unscaledWidth,unscaledHeight);
          if (data == null) {
          	return;
          }
          var g:Graphics = graphics;
          g.clear();
          g.beginFill( data.@idSampleChannel1 == '0' ? parentApplication.cy3Color : 0xffffff );
		  if (data.@idSampleChannel1 == '0' ) {
	          g.lineStyle(RendererFactory.DEFAULT_MISSING_REQUIRED_FIELD_BORDER_THICKNESS,
	                      parentApplication.cy3Color );          	
          }         
          g.drawRect(0,0,unscaledWidth,unscaledHeight);
          g.endFill();
          
          if (data.@canChangeSampleDesignations == "Y" || parentApplication.hasPermission("canWriteAnyObject")) {
	       	this.editable = true;
	      } else {
	       	this.editable = false;
	      }

	    }
	}
}