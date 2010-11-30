package com.juiceanalytics.fantasytracker.model
{
	import com.util.FantasyPointCalculator;
	
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
		public var currentTime:Number;
		
		public var currentStats:Array;
		
		public var pointModel:Array;
		
		public function get projectedPoints():Number 
		{
			//***************************************************************************
			//  TODO: calculate a projectedPoints total based on the currentPoints, currentTime, and espnFantasyProjection 
			//***************************************************************************
			return Math.max(currentPoints, espnFantasyProjection);
		}
		
		public function get currentPoints():Number 
		{
			var playerScore:Number = 0;
			var id:String;
			
			if (currentStats)
			{
				for (id in currentStats[0].stats) 
				{
					var intId:int = int(id);
					playerScore += currentStats[0].stats[id] * pointModel[intId];
				}
			}
			return playerScore;
		}
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function FantasyPlayer(firstName:String = null, 
																	lastName:String = null, 
																	position:String = null, 
																	team:String = null,
																	currentStats:Array = null,
																	pointModel:Array = null,
																	espnFantasyProjection:Number = 0, 
																	currentTime:Number = 0)
		{ 
			this.firstName = firstName;
			this.lastName = lastName;
			this.position = position;
			this.team = team;
			this.currentStats = currentStats;
			this.pointModel = pointModel;
			this.espnFantasyProjection = espnFantasyProjection;
			this.currentTime = currentTime;
		}
		
	}
}