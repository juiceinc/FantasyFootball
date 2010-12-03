package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class FetchPlayerDataCommand extends AbstractOperation implements IAsyncCommand
	{
		
		//------------------------------------------------------------
		//
		// Properties
		//
		//------------------------------------------------------------
		
		public var fantasyManager:FantasyManager;
		public var url:String;
		
		//------------------------------------------------------------
		//
		// Methods
		//
		//------------------------------------------------------------
		
		public function execute():*
		{			
			var request:URLRequest = new URLRequest(url);
			request.contentType = "text";
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.load(request);
			
			return this;
		}
		
		public function onComplete(e:Event):void 
		{
			fantasyManager.rawPlayerData = e.target.data as String;	
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
		
		public function FetchPlayerDataCommand(fantasyManager:FantasyManager, url:String)
		{
			super();
			this.fantasyManager = fantasyManager;
			this.url = url;
		}
		
	}
}