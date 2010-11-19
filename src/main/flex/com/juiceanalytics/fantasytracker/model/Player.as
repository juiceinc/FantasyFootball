package com.juiceanalytics.fantasytracker.model
{
	public class Player
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		// Sample data will look like this:
		//        {pi:26,fn:"Jeff",ln:"Feagles",pt:0,st:323,sp:26,ps:7},{pi:43,fn:"John",ln:"Carney",pt:18,st:549,sp:43,ps:5},
		
		public var firstName:String;
		public var lastName:String;
		public var position:String;
		public var team:String;
		
		//----------------------
		//
		// Methods 
		//
		//----------------------
		
		public function Player()
		{
		}
	}
}