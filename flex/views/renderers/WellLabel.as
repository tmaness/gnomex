package views.renderers 
{
	
	import mx.controls.Label;
	

	// Special Well label with a white background
	public class WellLabel extends Label
	{ 	
		
		public function WellLabel(name:String):void{
			super();
			text = name;
			setStyle('fontSize', 7);
			setStyle('textAlign','center');
		}
				
		public function resetLabel():void{
			setStyle('fontWeight', 'normal');
		}
		
		
		public function highlightLabel():void{
			setStyle('fontWeight', 'bold');
			this.textField.background = true;
			this.textField.backgroundColor = 0xD3D3D3;
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number): void {
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			graphics.lineStyle(0);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRoundRect (0,0,unscaledWidth,unscaledHeight,0,0);
			graphics.endFill();
		}
				
	}

}