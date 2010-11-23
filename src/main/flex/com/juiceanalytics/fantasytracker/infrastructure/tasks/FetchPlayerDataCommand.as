package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
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
		
		//------------------------------------------------------------
		//
		// Methods
		//
		//------------------------------------------------------------
		
		public function execute():*
		{			
			var request:URLRequest = new URLRequest('http://g.espncdn.com/ffl/livescoring/init/all?callback=initFantasyCast&configType=fantasycast&seasonId=2010&scoringPeriodId=9&snapshotId=22400');
			request.contentType = "text";
			
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.load(request);
			
			return this;
		}
		
		//		package {
		//			
		//			import flash.events.*
		//				import flash.net.*;
		//			
		//			public class SendAndLoadExample {
		//				
		//				public function SendAndLoadExample() {}
		//				public function sendData(url:String, _vars:URLVariables):void {
		//					var request:URLRequest = new URLRequest(url);
		//					var loader:URLLoader = new URLLoader();
		//					loader.dataFormat = URLLoaderDataFormat.VARIABLES;
		//					request.data = _vars;
		//					request.method = URLRequestMethod.POST;
		//					loader.addEventListener(Event.COMPLETE, handleComplete);
		//					loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		//					loader.load(request);
		//				}
		//				private function handleComplete(event:Event):void {
		//					var loader:URLLoader = URLLoader(event.target);
		//					trace("Par: " + loader.data.par);
		//					trace("Message: " + loader.data.msg);
		//				}
		//				private function onIOError(event:IOErrorEvent):void {
		//					trace("Error loading URL.");
		//				}
		//			}
		//		}
		
		
		
		public function onComplete(e:Event):void {
			trace(e.target);
			
			
			var rawData:String = e.target.data;
			
			fantasyManager.rawData = rawData;			
			dispatchCompleteEvent(e);
		}
		
		public function onError(e:Event):void {
			dispatchErrorEvent(e);
		}
		
		//------------------------------------------------------------
		//
		// Constructor
		//
		//------------------------------------------------------------
		
		public function FetchPlayerDataCommand(fantasyManager:FantasyManager)
		{
			this.fantasyManager = fantasyManager;
			super();
		}
		
	}
}