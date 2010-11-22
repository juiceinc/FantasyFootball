package com.juiceanalytics.fantasytracker.teamDisplay.view
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	import com.juiceanalytics.fantasytracker.model.FantasyTeam;
	
	import flash.events.Event;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	
	public class TeamContainer extends SkinnableContainer
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
		public var fantasyManager:FantasyManager = new FantasyManager();
		
		[Bindable]
		public var team:FantasyTeam;
		
		//------------------------------
		// Visual Elements
		//------------------------------
		
		[SkinPart(required="false")]
		public var teamName:Label;

		
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
		
		public function TeamContainer()
		{
			addHandlers();
		}
		
	}
	
}


class LocalStates
{
	public static const NORMAL:String = "normal";
}