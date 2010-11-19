package com.juiceanalytics.fantasytracker.infrastructure
{
    import flash.events.Event;
    
    import org.as3commons.logging.ILogger;
    import org.as3commons.logging.LoggerFactory;
    import org.springextensions.actionscript.core.command.ICommand;
    
    public class ApplicationPresenter
    {
        private static var logger:ILogger = LoggerFactory.getClassLogger(ApplicationPresenter);
        
        public function ApplicationPresenter()
        {
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