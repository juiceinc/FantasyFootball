package com.juiceanalytics.fantasytracker.infrastructure
{
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CleanLeagueDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CleanPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CreateFantasyLeagueCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CreatePlayerLookupTableCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchLeagueDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchLiveGameDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.springextensions.actionscript.core.command.CompositeCommand;
	import org.springextensions.actionscript.core.command.CompositeCommandKind;
	import org.springextensions.actionscript.core.event.EventBus;
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
			//getAllData.addCommand(getLeagueData);
			
			if (!fantasyManager.playerLookupTable)
			{
				getAllData.addCommand(getLeagueData);
				getAllData.addEventListener(OperationEvent.COMPLETE, createPlayerLookupTable);	
			}
			getAllData.execute();
		}
		
		
		/**
		 * Catches <code>createPlayerLookupTable</code> event, triggers related command
		 */
		[EventHandler]
		public function createPlayerLookupTable(e:Event=null):void{
			logger.debug('Trigger command to create PlayerLookupTable');
			var cmd:CreatePlayerLookupTableCommand = new CreatePlayerLookupTableCommand(fantasyManager);
			if (fantasyManager.playerUrl.scoringPeriodId)
			{
				cmd.addEventListener(OperationEvent.COMPLETE, createLeague);	
			}
			cmd.execute();
		}
		
		
		/**
		 * Catches <code>createLeague</code> event, triggers related command 
		 */
		[EventHandler]
		public function createLeague(e:Event=null):void
		{
			logger.debug("Trigger command to create FantasyLeague");
			var cmd:CreateFantasyLeagueCommand = new CreateFantasyLeagueCommand(fantasyManager);
			if (!fantasyManager.playerUrl.scoringPeriodId)
			{
				cmd.addEventListener(OperationEvent.COMPLETE, startTimer);	
			}
			cmd.execute();			
		}		
		
		/**
		 * Catches <code>startTimer</code> event, triggers related command
		 */
		[EventHandler]
		public function startTimer(e:Event=null):void
		{
			logger.debug("Trigger command to start Timer");
			
			var timer:Timer = new Timer(5000);
			timer.addEventListener(TimerEvent.TIMER,updateTimeValue);
			timer.start();
		}
		
		public function updateTimeValue(e:TimerEvent):void
		{
			fantasyManager.seconds +=5;
			fantasyManager.playerUrl.scoringPeriodId += 1;
			EventBus.dispatch('loadData');
		}
		
		/**
		 * Catches <code>getLiveData</code> event, triggers related command 
		 */
		public function getLiveData(e:Event=null):void
		{
			logger.debug("Trigger command to get live game data");
			var cmd:FetchLiveGameDataCommand = new FetchLiveGameDataCommand(fantasyManager, 'www.websiteurlgoeshere.com');
			cmd.execute();
		}
		
		
		[EventHandler(name="loadData")]
		[EventHandler(name="createPlayerLookupTable")]
		[EventHandler(name="createLeague")]
		[EventHandler(name="startTimer")]
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