package leagueDisplay.view
{
	import spark.components.SkinnableContainer;
	
	public class LeagueContainer extends SkinnableContainer
	{
		//------------------------------------------------------------
		//
		// Properties
		//
		//------------------------------------------------------------

		
		//------------------------------
		// Visual Elements
		//------------------------------
		[SkinPart(required='false')]
		public var leagueName:Label;
		
		
		//------------------------------------------------------------
		//
		// Methods
		//
		//------------------------------------------------------------
		
		//------------------------------------------------------------
		//
		// Skinning
		//
		//------------------------------------------------------------
		
		private function changeState(value:String):void
		{
			requiredState = value;
			invalidateSkinState();
		}
		
		override protected function getCurrentSkinState():String
		{
			if (requiredState)
				return requiredState;
			else
				return super.getCurrentSkinState();
		}
		
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
		}
		
		//------------------------------------------------------------
		//
		// Event Handling
		//
		//------------------------------------------------------------
		
		protected function addHandlers():void
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		protected function addedToStageHandler(e:Event):void
		{
			
		}
		
		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function LeagueContainer()
		{
			addHandlers();
		}
	}
}