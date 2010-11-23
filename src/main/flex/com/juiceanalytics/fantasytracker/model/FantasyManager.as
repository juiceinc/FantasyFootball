package com.juiceanalytics.fantasytracker.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class FantasyManager
	{		
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public static const MAX_POINTS:Number = 120;
		public static const INITIAL_SCALE_FACTOR:int = 3;
		
		public var rawData:String;
		
		public var MAX_HEIGHT:Number = 300;
		
		private var scaleIncrease:int = 0;	
		
		public var data:ArrayCollection;
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		[EventHandler('updateTeamContainerScale')]
		public function updateTeamContainerScale():void 
		{
			
		} 
		
		public function FantasyManager()
		{
		}
	}
}