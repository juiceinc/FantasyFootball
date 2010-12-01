package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.adobe.serialization.json2.JSON;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import org.springextensions.actionscript.core.command.ICommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CleanPlayerDataCommand extends AbstractOperation implements ICommand
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
			fantasyManager.rawPlayerData = fantasyManager.rawPlayerData.slice(74);
			fantasyManager.rawPlayerData = fantasyManager.rawPlayerData.slice(0,fantasyManager.rawPlayerData.length - 60);
			fantasyManager.playerData = JSON.decode(fantasyManager.rawPlayerData , false, false); 
			dispatchCompleteEvent(new Event('complete'));
			return this;
		}

		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function CleanPlayerDataCommand(fantasyManager:FantasyManager)
		{
			super();
			this.fantasyManager = fantasyManager;
		}
	}
}