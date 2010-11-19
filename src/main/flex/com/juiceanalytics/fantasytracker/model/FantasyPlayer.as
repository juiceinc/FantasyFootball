package com.juiceanalytics.fantasytracker.model
{
	public class FantasyPlayer extends Player
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public var espnFantasyProjection:Number;
		public var currentPoints:Number;
		public var currentTime:Number;
		
		//TODO: keep track of individual game stats
		public var currentStats:FantasyStats = new FantasyStats();
		
		public function get projectedPoints():Number {
			return espnFantasyProjection;
		}

		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function FantasyPlayer()
		{
			super();
		}
	}
}