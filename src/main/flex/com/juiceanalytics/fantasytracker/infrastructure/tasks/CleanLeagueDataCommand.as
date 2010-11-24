package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.adobe.serialization.json2.JSON;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CleanLeagueDataCommand extends AbstractOperation implements IAsyncCommand
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
			fantasyManager.leagueData = JSON.decode(fantasyManager.rawLeagueData , false, false);
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
		
		public function CleanLeagueDataCommand(fantasyManager:FantasyManager)
		{
			this.fantasyManager = fantasyManager;
			super();
		}
		
	}
}