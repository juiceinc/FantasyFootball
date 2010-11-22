package com.juiceanalytics.fantasytracker.model
{
	
	[Bindable]
	public class FantasyManager
	{		
		
		public static const MAX_POINTS:Number = 120;
		
		public static const INITIAL_SCALE_FACTOR:int = 3;
		
		public var MAX_HEIGHT:Number = 300;
		private var scaleIncrease:int = 0;	
			
		[EventHandler('updateTeamContainerScale')]
		public function updateTeamContainerScale():void 
		{
			
		} 
		
		public function FantasyManager()
		{
		}
	}
}