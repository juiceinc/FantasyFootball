package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class UpdatePlayerDataCommand extends AbstractOperation
	{
		//------------------------------------------------------------
		//
		// Properties
		//
		//------------------------------------------------------------
		
		[Autowired]
		public var manager:FantasyManager;
		
		//------------------------------------------------------------
		//
		// Methods
		//
		//------------------------------------------------------------
				
		public function execute():*
		{
			for (var i:Number = 0; i<manager.playerData.length; i++)
			{
				//find any players whose stats are needed in this application
				//update those players' stats
			}
		}
		
	}
}