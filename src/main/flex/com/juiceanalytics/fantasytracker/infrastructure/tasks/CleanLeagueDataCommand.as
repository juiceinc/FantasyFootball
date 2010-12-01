package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.adobe.serialization.json2.JSON;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import org.springextensions.actionscript.core.command.ICommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CleanLeagueDataCommand extends AbstractOperation implements ICommand
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
			dispatchCompleteEvent(new Event('complete'));
			return this;
		}
		
		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function CleanLeagueDataCommand(fantasyManager:FantasyManager)
		{
			super();
			this.fantasyManager = fantasyManager;
		}
		
	}
}