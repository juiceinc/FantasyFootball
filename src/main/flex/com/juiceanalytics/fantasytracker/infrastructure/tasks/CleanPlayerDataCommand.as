package com.juiceanalytics.fantasytracker.infrastructure.tasks
{
	import com.adobe.serialization.json2.JSON;
	import com.juiceanalytics.fantasytracker.model.FantasyManager;
	
	import org.springextensions.actionscript.core.command.IAsyncCommand;
	import org.springextensions.actionscript.core.operation.AbstractOperation;
	
	public class CleanPlayerDataCommand extends AbstractOperation implements IAsyncCommand
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
			fantasyManager.rawData = fantasyManager.rawData.slice(74);
			fantasyManager.rawData = fantasyManager.rawData.slice(0,fantasyManager.rawData.length - 60);
			//var s:String = '{"config":{"pspUseSeasonStats":false},"latestSnapshotId":19469,playerData:{"players":[{pi:26,fn:"Jeff",ln:"Feagles",pt:0,st:323,sp:26,ps:7},{pi:43,fn:"John",ln:"Carney",pt:18,st:549,sp:43,ps:5,gs:[{gameId:301107029,stats:{155:1}}]},{pi:112,fn:"Brett",ln:"Favre",pt:16,st:1025,sp:112,ps:1,gs:[{gameId:301107016,stats:{0:47,1:36,2:11,3:446,4:2,64:3,5:89,6:44,7:22,8:17,9:8,10:4,11:7,12:3,13:2,73:2,14:1,155:1,18:1,21:0.765957447,20:2,23:2,22:446,24:1,39:0.5,40:1}}]},{pi:129,fn:"Matt",ln:"Stover",pt:0,st:1078,sp:129,ps:5},{pi:139,fn:"John",ln:"Kasay",pt:29,st:1111,sp:139,ps:5,gs:[{gameId:301107029,stats:{85:1,84:2,156:1,81:1,80:1,83:1,78:1,79:1}}]},{pi:286,fn:"Jason",ln:"Hanson",pt:8,st:2034,sp:286,ps:5,gs:[{gameId:301107008,stats:{87:2,86:2,156:1}}]},{pi:410,fn:"Jeff",ln:"Zgonina",pt:0,st:2386,sp:410,ps:9},{pi:445,fn:"Mark",ln:"Brunell",pt:20,st:2485,sp:445,ps:1,gs:[{gameId:301107008,stats:{155:1}}]},{pi:490,fn:"Lorenzo",ln:"Neal",pt:0,st:2570,sp:490,ps:2},{pi:555,fn:"Willie",ln:"McGinest",pt:0,st:2743,sp:555,ps:11},{pi:619,fn:"Mitch",ln:"Berger",pt:0,st:2861,sp:619,ps:7},{pi:734,fn:"Kerry",ln:"Collins",pt:10,st:3115,sp:734,ps:1},{pi:735,fn:"Todd",ln:"Collins",pt:3,st:3116,sp:735,ps:1,gs:[{gameId:301107002,stats:{155:1}}]},{pi:751,fn:"Joey",ln:"Galloway",pt:28,st:3135,sp:751,ps:3},{pi:766,fn:"Tyrone",ln:"Poole",pt:0,st:3154,sp:766,ps:12},{pi:770,fn:"Kevin",ln:"Carter",pt:0,st:3158,sp:770,ps:10},{pi:793,fn:"Ty",ln:"Law",pt:0,st:3188,sp:793,ps:12},{pi:838,fn:"Matt",ln:"Turk",pt:34,st:3276,sp:838,ps:7,gs:[{gameId:301107034,stats:{153:1,139:70,138:2,156:1,143:1,147:35}}]},{pi:901,fn:"Tony",ln:"Richardson",pt:20,st:3408,sp:901,ps:2,gs:[{gameId:301107008,stats:{155:1}}]}]}}';
			var o:Object = JSON.decode(fantasyManager.rawData , false, false);
		}
		
		public function CleanPlayerDataCommand(fantasyManager:FantasyManager)
		{
			this.fantasyManager = fantasyManager;
			super();
		}
	}
}