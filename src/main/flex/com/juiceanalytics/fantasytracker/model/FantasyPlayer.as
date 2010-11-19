package com.juiceanalytics.fantasytracker.model
{
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;

	[Bindable]
	public class FantasyPlayer
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		public var firstName:String;
		public var lastName:String;
		public var position:String;
		public var team:String;
		
		public var espnFantasyProjection:Number;
		public var currentPoints:Number;
		public var currentTime:Number;
		
		//TODO: keep track of individual game stats
		public var currentStats:FantasyStats = new FantasyStats();
		
		public function get projectedPoints():Number {
			
			//TODO: calculate a projectedPoints total based on the currentPoints, currentTime, and espnFantasyProjection	
			//return currentPoints + espnFantasyProjection / 2;
			return Math.max(currentPoints, espnFantasyProjection);
		}
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function FantasyPlayer(firstName:String, 
																	lastName:String, 
																	position:String, 
																	team:String,
																	espnFantasyProjection:Number, 
																	currentPoints:Number, 
																	currentTime:Number)
		{ 
			this.firstName = firstName;
			this.lastName = lastName;
			this.position = position;
			this.team = team;
			this.espnFantasyProjection = espnFantasyProjection;
			this.currentPoints = currentPoints;
			this.currentTime = currentTime;
		}

	}
}