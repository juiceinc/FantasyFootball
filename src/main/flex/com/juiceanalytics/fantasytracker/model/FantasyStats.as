package com.juiceanalytics.fantasytracker.model
{
	public class FantasyStats
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		
		public var touchdowns:int;
		public var totalYards:int;
		
		public var rushAttempt:int;
		public var rushYards:int;
		public var fumble:int;
		
		public var reception:int;
		public var receptionYards:int;
		
		public var passAttempt:int;
		public var passComplete:int;
		public var passYards:int;
		public var passINT:int;
		
		public var tackles:Number;
		public var sacks:Number;
		public var INT:int;

		// TODO: Do actual fantasy scoring 
		public function get points():Number {
			return Math.random()*20;
		}
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
				
		public function FantasyStats()
		{
		}

	}
}