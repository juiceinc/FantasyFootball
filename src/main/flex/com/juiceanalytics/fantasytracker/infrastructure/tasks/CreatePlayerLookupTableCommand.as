package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CreatePlayerLookupTableCommand extends AbstractOperation implements IAsyncCommand
	{

		//------------------------------------------------------------
		//
		// Properties
		//
		//------------------------------------------------------------
		
		public var fantasyManager:FantasyManager;

		//------------------------------------------------------------
		//
		// Methods
		//
		//------------------------------------------------------------

		public function execute():*
		{
			trace();
			if (fantasyManager.leagueData)
			{
				var allPlayers:Object = fantasyManager.playerData.playerData.players;
				var i:int = 0;
				var player:Object;
				var currentPlayer:Object;
				var playerLookupTable:Object = {};
				
				//cycle through teams
				for (i; i< fantasyManager.leagueData.teams.length; i++)
				{
					//Add all players in the currentTeam to the playerLookup object
					for each (player in fantasyManager.leagueData.teams[i].slots)
					{
						for each (currentPlayer in allPlayers)
						{
							if (currentPlayer.pi == player.pi)
							{
								playerLookupTable[player.pi] = currentPlayer;
							}
						}
					}
				}
				fantasyManager.playerLookupTable = playerLookupTable;
			}
			
			return this;
			return this;
		}
		
		public function onComplete(e:Event):void
		{
			dispatchCompleteEvent(e);
		}
		
		public function onError(e:Event):void
		{
			dispatchErrorEvent(e);
		}
		
		
		
		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function CreatePlayerLookupTableCommand(fantasyManager:FantasyManager)
		{
			this.fantasyManager = fantasyManager;
			super();
		}
		
	
	}
}