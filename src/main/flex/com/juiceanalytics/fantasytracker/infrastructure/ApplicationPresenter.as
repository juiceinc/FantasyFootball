package com.juiceanalytics.fantasytracker.infrastructure
{
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.CleanPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.infrastructure.tasks.FetchPlayerDataCommand;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.LoggerFactory;
	import org.springextensions.actionscript.core.command.CompositeCommand;
	import org.springextensions.actionscript.core.command.CompositeCommandKind;
	
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
				
				var getData:CompositeCommand = new CompositeCommand(CompositeCommandKind.SEQUENCE);
				getData.addCommand(new FetchPlayerDataCommand(fantasyManager));
				getData.addCommand(new CleanPlayerDataCommand(fantasyManager));
				getData.execute();	
			}
			
		}
		
		/**
		 * Catches <code>loadData</code> event, triggers related command
		 */  
		[EventHandler]
		public function loadData():void
		{
			logger.debug("Trigger command to retreive data");
			
			//var cmd:ICommand = new FetchTreemapDataFromUrlCommand(_appModel, _appModel.url);
			//            var cmd:ICommand = new InitializeTreemapCompositeCommand(_appModel);
			//            cmd.execute();
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
			//            var cmd:ICommand = new InitializeTreemapCompositeCommand(_appModel);
			//            cmd.execute();
		}
	}
}