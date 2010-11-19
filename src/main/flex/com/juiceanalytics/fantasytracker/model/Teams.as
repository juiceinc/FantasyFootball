package com.juiceanalytics.fantasytracker.model
{
	public class Teams
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public static var VIKINGS:int = 16;
		
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public static function getTeamNameFromId(id:int):String {
			if (id == Teams.VIKINGS) 
				return 'Vikings';
			else 
				return 'Unknown';
		}
		
		
		public function Teams()
		{
		}
	}
}