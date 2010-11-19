package sparkflare.mappers
{
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ListCollectionView;
	import mx.events.CollectionEvent;
	import mx.events.PropertyChangeEvent;
	import mx.events.PropertyChangeEventKind;
	import mx.utils.NameUtil;
	
	import org.juicekit.animate.Transitioner;
	
	
	/**
	 * An ArrayCollection of IMapper items. A <code>MapperChain</code> evaluates
	 * all the IMappers it contains.
	 * 
	 */
	public class MapperChain extends ArrayCollection implements IMapper
	{
		// -- Properties ------------------------------------------------------
		
		public var owner:Object;
		
		private var _name:String = NameUtil.createUniqueName(this);
		
		
		/** An identifier for this operator */
		public function get name():String {
			return _name;
		}
		
		public function set name(b:String):void {
			_name = b;
		}
		
		
		private var _enabled:Boolean = true;
		
		
		/** Indicates if the operator is enabled or disabled. */
		public function get enabled():Boolean {
			return _enabled;
		}
		
		public function set enabled(b:Boolean):void {
			_enabled = b;
		}
		
		
		/** @inheritDoc */
		public function set parameters(params:Object):void
		{
			MapperBase.applyParameters(this, params);
		}
		
		
		/**
		 * Performs an operation over the contents of a visualization.
		 * @param t a Transitioner instance for collecting value updates.
		 */
		public function operate(items:ArrayCollection, t:Transitioner = null):void {
			if (enabled) {
				for each (var op:IMapper in this.source) {
					op.operate(items, t)
				}				
			}
		}
		
		
		/**
		 * Updates the encoder after a change to encoding parameters
		 */
		protected function updateMapper(e:Event=null):void
		{
			if (enabled) {
				dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE,
					true, false, PropertyChangeEventKind.UPDATE, 'ignore', null, null, this));
			}
		}
		
		
		/**
		 * Constructor
		 */
		public function MapperChain()
		{
			super();
			this.addEventListener(CollectionEvent.COLLECTION_CHANGE, updateMapper);
		}
		
	}
}