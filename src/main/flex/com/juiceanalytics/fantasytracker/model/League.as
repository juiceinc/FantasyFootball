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
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function League(source:Array=null)
		{
			super(source);
			this.leagueName = leagueName;
			this.selectedTeamIndex = selectedTeamIndex;
		}
	}
}