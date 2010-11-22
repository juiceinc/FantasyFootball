package com.juiceanalytics.fantasytracker.model
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class League
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public var leagueName:String;
		public var teams:ArrayCollection;
		public var selectedTeam:FantasyTeam;
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function League(leagueName:String = null, teams:ArrayCollection = null, selectedTeam:FantasyTeam = null)
		{
			this.leagueName = leagueName;
			this.teams = teams;
			this.selectedTeam = selectedTeam;
		}
	}
}