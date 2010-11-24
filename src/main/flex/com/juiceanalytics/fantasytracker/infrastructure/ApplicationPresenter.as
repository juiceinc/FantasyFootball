package com.juiceanalytics.fantasytracker.infrastructure
{
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CleanLeagueDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CleanPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CreateFantasyTeamCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchLeagueDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.springextensions.actionscript.core.command.CompositeCommand;
	import org.springextensions.actionscript.core.command.CompositeCommandKind;
	import org.springextensions.actionscript.core.operation.OperationEvent;
	
	public class ApplicationPresenter
	{
		//----------------------
		//
		// Properties 
		//
		//----------------------
		
		private static var logger:ILogger = LoggerFactory.getClassLogger(ApplicationPresenter);
		public var fantasyManager:FantasyManager;
		
		//----------------------
		//
		// Methods 
		//
		//----------------------		
		
		public function ApplicationPresenter(fantasyManager:FantasyManager)
		{
			if (fantasyManager) 
			{
				this.fantasyManager = fantasyManager;
				loadData();
			}
		}
		
		/**
		 * Catches <code>loadData</code> event, triggers related command
		 */  
		[EventHandler]
		public function loadData():void
		{
			logger.debug("Trigger command to load data");
			
			var getPlayerData:CompositeCommand = new CompositeCommand(CompositeCommandKind.SEQUENCE);
			getPlayerData.addCommand(new FetchPlayerDataCommand(fantasyManager,fantasyManager.playerUrl.url));
			getPlayerData.addCommand(new CleanPlayerDataCommand(fantasyManager));
			
			var getLeagueData:CompositeCommand = new CompositeCommand(CompositeCommandKind.SEQUENCE);
			getLeagueData.addCommand(new FetchLeagueDataCommand(fantasyManager,fantasyManager.leagueUrl.url));
			getLeagueData.addCommand(new CleanLeagueDataCommand(fantasyManager));
			
			var getAllData:CompositeCommand = new CompositeCommand(CompositeCommandKind.SEQUENCE);
			getAllData.addCommand(getPlayerData);
			getAllData.addCommand(getLeagueData);
			
			getAllData.addEventListener(OperationEvent.COMPLETE, createTeams);
			getAllData.execute();
		}
		
		/**
		 * Catches <code>createTeams<code> event, triggers related command 
		 */
		[EventHandler]
		public function createTeams(e:Event=null):void
		{
			logger.debug("Trigger command to create FantasyTeams");
			
			var cmd:CreateFantasyTeamCommand = new CreateFantasyTeamCommand(fantasyManager);
			cmd.execute();			
		}		
		
		[EventHandler(name="loadData")]
		[EventHandler(name="getSomeOtherMessage")]
		public function listenToEverythingHandler(e:Event):void
		{
			logger.debug("caught one of the events");
		}
		
		/**
		 * Tell the presenter to start.
		 */
		public function go():void {
		}
		
	}
}