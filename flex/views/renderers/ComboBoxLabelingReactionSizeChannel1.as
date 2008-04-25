package views.renderers
{
	import mx.events.ListEvent;
	import mx.controls.Alert;
	
	public class ComboBoxLabelingReactionSizeChannel1 extends ComboBoxBase
	{
		protected override function initializeFields():void {
	    	dictionaryClassName          = "hci.gnomex.model.LabelingReactionSize";
	    	cellAttributeName            = "@codeLabelingReactionSizeChannel1";
	    	choiceDisplayAttributeName   = "@display";
	    	choiceValueAttributeName     = "@value";
	    }
	   	protected override function change(event:ListEvent):void {
	     	if (parentApplication.hasPermission("canWriteAnyObject")) {
            	super.change(event);
	     	} else {
	     		selectItem();
	     		Alert.show("Labeling reaction size cannot be changed.");
	     	}
        }            

	    

	}
}