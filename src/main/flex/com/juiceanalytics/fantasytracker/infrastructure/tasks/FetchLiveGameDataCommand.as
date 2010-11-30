package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class FetchLiveGameDataCommand extends AbstractOperation implements IAsyncCommand
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
			return null;
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

		public function FetchLiveGameDataCommand(fantasyManager:FantasyManager)
		{
			super();
			this.fantasyManager = fantasyManager
		}
		
	}
}