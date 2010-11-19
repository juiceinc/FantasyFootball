package sparkflare.layouts
{
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	
	import org.juicekit.animate.Transitioner;
	import org.juicekit.util.Property;
	import org.juicekit.util.Sort;
	
	import sparkflare.mappers.IMapper;
	import sparkflare.mappers.MapperBase;
	
	/**
	 * Layouts are IMappers that affect multiple properties at once, typically
	 * x, y, height, and width. HorizontalStripeLayout lays items out in vertical
	 * stripes.
	 */
	[Bindable]
	public class StackedBarLayout extends MapperBase
	{
		
		public var sizeField:String;
		public var currentField:String;
		
		public var gap:Number = 2;
		public var pixelScaleFactor:Number = 3
		
		/** @inheritDoc */
		override public function operate(items:ArrayCollection, t:Transitioner = null):void
		{
			var row:Object;
			var _t:Transitioner;
			var v:Number;
			
			if (enabled) 
			{
				_t = (t != null ? t : Transitioner.DEFAULT);
				var sizeProp:Property = Property.$(sizeField);
				var currentProp:Property = Property.$(currentField);
				
				if (items) 
				{
					var ttl:Number = 0;
					var positives:int = 0;
					var ownerWidth:Number = NaN;
					var ownerHeight:Number = NaN;
					for each (row in items) 
					{
						v = Number(sizeProp.getValue(row));
						ttl += v > 0 ? v : 0;
						positives += v > 0 ? 1 : 0;
						if (isNaN(ownerWidth)) {
							ownerHeight = row.owner.height;
							ownerWidth = row.owner.width;
						}
					}
					
					var x:Number = 0;
					var y:Number = 0;
					var height:Number = 0;
					var width:Number = ownerWidth;
					var fillHeight:Number = ownerHeight - (positives - 1) * gap; 

					for each (row in items) 
					{
						v = Number(sizeProp.getValue(row));
						v = v > 0 ? v : 0;
						height = v * pixelScaleFactor;
						
//						height = (v / ttl) * fillHeight;
						var curPt:Number = Number(currentProp.getValue(row));
						_t.setValue(row, 'currentRect.height', curPt* pixelScaleFactor); 
						_t.setValue(row, 'height', height);
						_t.setValue(row, 'width', width);
						_t.setValue(row, 'x', x);
						_t.setValue(row, 'y', y);
						
						y += height;
						if (height > 0)
							y += gap;
					}
				}
				
				_t = null;
			}
		}
		
		
		/**
		 * Constructor
		 */
		public function StackedBarLayout()
		{
		}
		
		
	}
}