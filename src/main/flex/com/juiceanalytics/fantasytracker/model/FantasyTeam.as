package com.juiceanalytics.fantasytracker.model
{
	import mx.collections.ArrayCollection;
	
	public class FantasyTeam extends ArrayCollection
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		

		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		[Bindable(event="collectionChange")]
		public function getPoints():Number {
			var player:FantasyPlayer;
			var totalPoints:Number = 0;
			for each (player in source) 
			{
				totalPoints += player.projectedPoints;
			} 			
			return totalPoints;
		}
		
		public var teamName:String = 'My Team';
		
		public function FantasyTeam(source:Array=null)
		{
			super(source);
		}
	}
}