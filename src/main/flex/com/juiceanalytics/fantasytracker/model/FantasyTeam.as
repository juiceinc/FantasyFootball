package com.juiceanalytics.fantasytracker.model
{
	import mx.collections.ArrayCollection;
	
	public class FantasyTeam extends ArrayCollection
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		

		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function getPoints():Number {
			return 10;
		}
		
		
		
		public function FantasyTeam(source:Array=null)
		{
			super(source);
		}
	}
}