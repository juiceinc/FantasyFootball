package com.juiceanalytics.fantasytracker.model
{
    public class Play
    {
        public var gamePeriod:int;
        public var awayScore:int;
        public var click:int;
        public var componentPlayTypeIds:String;
        public var endDistance:int;
        public var endDown:int;
        public var endProTeamId:int;
        public var endYardsToEndzone:int;
        public var homeScore:int;
        
        public var intercepterId:int;
        public var kickerId:int;
        public var passerId:int;
        public var playId:int;
        
        public var playTypeId:int;        
        public var receiverId:int;
        public var returnerId:int;
        public var rusherId:int;
        
        public var isScoringPlay:Boolean;
        public var loggable:Boolean;
        public var startDistance:int;
        public var startDown:int;
        public var startProTeamId:int;
        public var startYardsToEndzone:int;
        
        public var playResult:String;
        public var logPlayResult:String;
        public var longPlayResult:String;
        
        public var tackler1Id:int;
        public var tackler2Id:int;
        public var tackler3Id:int;
        
        public var yardsGained:int;
        public var gameClock:int;
        
        
        public function Play()
        {
        }
    }
}