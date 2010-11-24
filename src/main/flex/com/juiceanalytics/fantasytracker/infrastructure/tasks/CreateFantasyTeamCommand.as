package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	import com.juiceanalytics.fantasytracker.model.FantasyPlayer;
	
	import flash.events.Event;
	
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CreateFantasyTeamCommand extends AbstractOperation implements IAsyncCommand
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
				var playerlookup:Object = fantasyManager.playerData.playerData.players;
				var currentPlayer:Object;
				
				
				for (var i:int = 0; i< fantasyManager.leagueData.teams.length; i++)
				{
					var player:*;
					for each (player in fantasyManager.leagueData.teams[i].slots)
					{
						currentPlayer = playerlookup[player.pi];
						var newp:FantasyPlayer = new FantasyPlayer(currentPlayer['fn']);
					}
				}
			}
			
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
		
		public function CreateFantasyTeamCommand(fantasyManager:FantasyManager)
		{
			this.fantasyManager = fantasyManager;
			super();
		}
		
		
	}
}