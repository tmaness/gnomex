package views
{
	import mx.controls.ComboBox;
	import flash.events.MouseEvent;
	import mx.collections.XMLListCollection;
	import flash.events.Event;
	import mx.events.ListEvent;

	public class ComboBoxHybProtocol extends ComboBox
	{
		    private var _data:Object;
		  
		    
            override public function set data(o:Object):void
            {
                _data = o;
                this.selectedIndex = 0;
                for(var i:Number = 0; i < this.dataProvider.length; i++) {
                	if(dataProvider[i].@value == o.@idHybProtocol) {
                          this.selectedIndex = i;
                          break;
                     }
                }
            }
             [Bindable]           
            override public function get data():Object 
            {
            	if (_data != null) {
            		return _data.@idHybProtocol;
            	} else {
            		return null;
            	}
            }
            


            override protected function initializationComplete():void
            {   
                this.addEventListener(ListEvent.CHANGE, change);
            	dataProvider = parentApplication.manageDictionaries.lastResult.Dictionary.(@className == 'hci.gnomex.model.HybProtocol').DictionaryEntry;
            	labelField = "@display";
            }
            
            
            private function change(event:ListEvent):void {
            	_data.@idHybProtocol = this.selectedItem.@value;
            	_data.@isDirty = "Y";
            }
            
	}
}