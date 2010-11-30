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
		
		public var MAX_HEIGHT:Number = 300;
		
		private var scaleIncrease:int = 0;	
		
		public var rawPlayerData:String;
		
		public var rawLeagueData:String;
		
		public var playerData:Object;
		
		public var leagueData:Object;
		
		public var playerLookupTable:Object;
		
		public var league:League;
		
		public var playerUrl:PlayerURL = new PlayerURL();
		
		public var leagueUrl:LeagueURL = new LeagueURL();
		
		public var seconds:Number = 0;
		
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