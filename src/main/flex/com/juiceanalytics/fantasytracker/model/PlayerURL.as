package com.juiceanalytics.fantasytracker.model
{
	public class PlayerURL
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		public static const BASE_URL:String = 'http://g.espncdn.com/ffl/livescoring/init/all?callback=initFantasyCast&';
		
		public var configType:String = 'fantasycast';
		
		public var seasonId:String = '2010';
		
		public var scoringPeriodId:String = '9';
		
		public var snapshotId:String = '22400';
		
		public function get url():String 
		{
			return BASE_URL + 'configType=' + configType + '&seasonId=' + seasonId + '&scoringPeriodId=' + scoringPeriodId + '&snapshotId=' + snapshotId;
		}
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function PlayerURL()
		{
		}

	}
}