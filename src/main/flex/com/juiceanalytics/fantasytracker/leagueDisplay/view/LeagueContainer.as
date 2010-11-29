package com.juiceanalytics.fantasytracker.leagueDisplay.view
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	import com.juiceanalytics.fantasytracker.model.League;
	
	import flash.events.Event;
	
	import mx.binding.utils.BindingUtils;
	import mx.controls.Alert;
	
	import spark.components.DataGroup;
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	public class LeagueContainer extends SkinnableContainer
	{
		//------------------------------------------------------------
		//
		// Properties
		//
		//------------------------------------------------------------
		
		//------------------------------
		// Context
		//------------------------------
		private var requiredState:String;
		
		[Autowired]
		[Bindable]
		public var fantasyManager:FantasyManager;
		
		[Bindable]
		public var league:League;
		
		//------------------------------
		// Visual Elements
		//------------------------------
		[SkinPart(required='true')]
		public var leagueName:Label;
		
		[SkinPart(required='false')]
		public var selectedTeamArea:Group;
		
		[SkinPart(required='false')]
		public var comparisonTeamsArea:DataGroup;
		
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
			BindingUtils.bindProperty(this, 'league', fantasyManager, 'league');
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