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
		
		public var leagueId:String = '438367';
		
		public var teamId:String = '7';
		
		public var seasonId:String = '2010';
		
		public var scoringPeriod:String = '12';  //nfl week 11
		
		public function get url():String
		{
			//String(int(Math.random()*10000)) + 
			//http://games.espn.go.com/ffl/livescoring/init/league?leagueId=438369&teamId=7&seasonId=2010&scoringPeriodId=11
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