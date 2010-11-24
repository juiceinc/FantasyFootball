package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
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