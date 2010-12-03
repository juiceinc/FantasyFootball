package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	
	import org.springextensions.actionscript.core.command.ICommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CreatePlayerLookupTableCommand extends AbstractOperation implements ICommand
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
			if (fantasyManager.leagueData)
			{
				//TODO: figure out why data is not being returned in a consitant structure...seems to be nested an extra level on the first pull
				var allPlayers:Object = {};
				if (fantasyManager.playerData.hasOwnProperty('playerData'))
				{
					allPlayers = fantasyManager.playerData.playerData.players;
				}
				else if (fantasyManager.playerData.hasOwnProperty('players'))
				{
					allPlayers = fantasyManager.playerData.players;
				}
				else{
					return null;
					//Alert.show('fantasyManager.playerData was not found');
				}
//				var allPlayers:Object = fantasyManager.playerData.playerData.players;
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
				fantasyManager.playerLookupTable	 = playerLookupTable;
			}
			dispatchCompleteEvent(new Event('complete'));
			return this;
		}
		
		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function CreatePlayerLookupTableCommand(fantasyManager:FantasyManager)
		{
			super();
			this.fantasyManager = fantasyManager;
		}
		
	
	}
}