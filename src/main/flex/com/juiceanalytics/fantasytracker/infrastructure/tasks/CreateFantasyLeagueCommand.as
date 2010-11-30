package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	import com.juiceanalytics.fantasytracker.model.FantasyPlayer;
	import com.juiceanalytics.fantasytracker.model.FantasyTeam;
	import com.juiceanalytics.fantasytracker.model.League;
	
	import flash.events.Event;
	
	import org.juicekit.query.Fn;
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CreateFantasyLeagueCommand extends AbstractOperation implements IAsyncCommand
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
			var team:Object;
			var player:Object;
			var teamArray:Array = [];
			
			for each (team in fantasyManager.leagueData.teams)
			{ 
				var fantasyteam:FantasyTeam = new FantasyTeam([], team.nickname);
				for each (player in team.slots)
				{ //player.si == 20 means player is on the bench, so do not add player to the FantasyTeam
					if (player.sl != 20)
					{ 
						var newPlayer:FantasyPlayer = new FantasyPlayer(fantasyManager.playerLookupTable[player.pi]['fn'],
																														fantasyManager.playerLookupTable[player.pi]['ln'],
																														fantasyManager.playerLookupTable[player.pi]['ps'],
																														fantasyManager.playerLookupTable[player.pi]['pt'],
																													  fantasyManager.playerLookupTable[player.pi]['gs'],
																														fantasyManager.leagueData['statPointValues'], 0,0);
						fantasyteam.addItem(newPlayer);
					}
				}
				teamArray.push(fantasyteam);
			}
			fantasyManager.league = new League(teamArray);
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
		
		public function CreateFantasyLeagueCommand(fantasyManager:FantasyManager)
		{
			super();
			this.fantasyManager = fantasyManager;
		}
		
		
	}
}