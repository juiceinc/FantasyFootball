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
		
		public var scoringPeriodId:int = 0;
		
		public var snapshotId:String = '22400';
		
		public function get url():String 
		{
			//http://g.espncdn.com/ffl/livescoring/init/all?callback=initFantasyCast&configType=fantasycast&seasonId=2010&scoringPeriodId=12&snapshotId=22400
			return BASE_URL + 'configType=' + configType + '&seasonId=' + seasonId + '&scoringPeriodId=' + String(scoringPeriodId) + '&snapshotId=' + snapshotId;
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