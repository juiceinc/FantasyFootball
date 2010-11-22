package com.juiceanalytics.fantasytracker.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class League extends ArrayCollection
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public var leagueName:String;
		public var selectedTeamIndex:int;
		
		public function get selectedTeam():FantasyTeam 
		{
			return this.getItemAt(selectedTeamIndex) as FantasyTeam;
		}
		
		public function get comparisonTeams():ArrayCollection
		{
			var comparisonTeamArray:Array = [];
			for (var i:int = 0; i<source.length; i++)
			{
				if (selectedTeamIndex != i)
				{
					comparisonTeamArray.push(source[i]);
				}
			}
			return new ArrayCollection(comparisonTeamArray);
		}
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function League(source:Array=null)
		{
			super(source);
		}
		
	}
}