package com.juiceanalytics.fantasytracker.model
{
	[Bindable]
	public class LeagueURL
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public static const BASE_URL:String = 'http://games.espn.go.com/ffl/livescoring/init/league?';
		
		public var leagueId:String = '438369';
		
		public var teamId:String = '7';
		
		public var seasonId:String = '2010';
		
		public var scoringPeriod:String = '11';
		
		public function get url():String
		{
			return BASE_URL + 'leagueId=' + leagueId + '&teamId=' + teamId + '&seasonId=' + seasonId + '&scoringPeriodId=' + scoringPeriod;
		}
		
		//----------------------
		//
		// Methods
		//
		//----------------------
		
		
		public function LeagueURL()
		{
			
		}
		
//		public function LeagueURL(leagueId:String = null, teamId:String = null, seasonId:String = null, scoringPeriod:String = null)
//		{
//			this.leagueId = leagueId;
//			this.teamId = teamId;
//			this.seasonId = seasonId;
//			this.scoringPeriod = scoringPeriod;
//		}
	}
}