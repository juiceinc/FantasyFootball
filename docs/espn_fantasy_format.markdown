The file is JSON format.

A related link [http://www.wecodethings.com/blog/?p=31]

http://g.espncdn.com/ffl/livescoring/init/all
  Can get season stats "ss"
  
http://g.espncdn.com/ffl/tools/statcorrections?week=6
    Possibly shows main stats
      
http://g.espncdn.com/ffl/livescoring/init/all?callback=initFantasyCast&configType=fantasycast&seasonId=2010&scoringPeriodId=9&snapshotId=22400


  * scoringPeriodId = week of the season
  * snapshotId = sequential snaps throughout the weeks action starting with 1?
  * configType = "fantasycast" are there others?
   

Contents of file:

Shows latest snapshot id, the player records

({"config":{"pspUseSeasonStats":false},
  "latestSnapshotId":22788,
  playerData:{players:
    [
        {pi:26,fn:"Jeff",ln:"Feagles",pt:0,st:323,sp:26,ps:7},{pi:43,fn:"John",ln:"Carney",pt:18,st:549,sp:43,ps:5},
        {pi:112,fn:"Brett",ln:"Favre",pt:16,st:1025,sp:112,ps:1,gs:[{gameId:301114003,stats:{68:1,0:31,1:18,70:1,2:13,3:170,4:1,5:34,6:17,66:1,7:8,8:6,9:3,10:1,11:3,72:1,12:1,73:4,13:2...
        ...
    ]},
  proGameData: {games:[
        
# Player records:

pi: player id
fn: first name
ln: last name
pt: player team
    0 = not in league
st: ??
sp: ??
ps: position
    1 = QB
    2 = RB
    3 = WR
    4 = TE
    5 = Kicker
    6 = NONE
    7 = Punter
    8 = 
    9 = Shaun Cody, Johnathan Babineaux, Lorenzo Alexander
    10 = Mario Williams, Tamba Hali, Mathias Kiwanuka
    11 = Demarcus Ware, Shawne Merriman, Barrett Ruud
    12 = DB? Ty Law, Tyrone Poole        
    13 = Danieal Manning, Bernard Pollard, Reed Doughty
    14 = Coach!
    
    
# Game stats
    gs:[{gameId:301114003,stats:{68:1,0:31,1:18,70:1,2:13,3:170,4:1,5:34,6:17,66:1,7:8,8:6,9:3,10:1,11:3,72:1,12:1,73:4,13:2]

gameId: game id
stats: stats for game

stats
    23: rushing attempts
    24: rushing yards
    
    41: receptions
    42: reception total yards?
    53: receptions
    58: targets?
    60: reception average
    61: receiving yards?
    

# proGameData Structure

proGameData:{
    games:[
        {gameId:301111001,
        homeProTeamId:1,
        awayProTeamId:33,
        homeScore:26,
        awayScore:21,
        gameDate:1289524800000,
        gameStatus:3,
        isEndPeriod:false,
        gameClock:0,
        gamePeriod:4,
        linescores:"0,0|0,10|7,3|14,13|",
        currentDrive:{
            driveId:21,
            proTeamId:33,
            startClock:16,
            startYardsToEndzone:91,
            currentClock:0,
            currentYardsToEndzone:0,
            numberOfPlays:3,
            timeOfPossession:16,
            totalYards:10,
            redZoneProTeamId:-1},
        lastPlay:{
            gamePeriod:4,
            awayScore:21,
            clock:0,
            componentPlayTypeIds:"",
            endDistance:0,
            endDown:0,
            endProTeamId:33,
            endYardsToEndzone:0,
            homeScore:26,
            intercepterId:0,
            kickerId:0,
            passerId:0,
            playId:4091,
            playTypeId:66,
            receiverId:0,
            returnerId:0,
            rusherId:0,
            isScoringPlay:false,
            loggable:false,
            startDistance:0,
            startDown:0,
            startProTeamId:33,
            startYardsToEndzone:0,
            playResult:"End of game.",
            logPlayResult:"",
            longPlayResult:"End of Game",
            tackler1Id:0,
            tackler2Id:0,
            tackler3Id:0,
            yardsGained:0,
            gameClock:0},
    
    # All scoring plays including extra points
    gameLogs:[
        {gamePeriod:2,
        awayScore:0,
        clock:692,
        componentPlayTypeIds:"4,24",
        endDistance:-1,
        endDown:-1,
        endProTeamId:1,
        endYardsToEndzone:0,
        homeScore:6,
        intercepterId:0,
        kickerId:0,
        passerId:11237,
        playId:969,
        playTypeId:24,
        receiverId:10687,
        returnerId:0,
        rusherId:0,
        isScoringPlay:true,
        loggable:true,
        startDistance:14,
        startDown:2,
        startProTeamId:1,
        startYardsToEndzone:28,
        playResult:"Matt Ryan pass complete to Jason Snelling for 28 yards, TOUCHDOWN.",
        logPlayResult:"Matt Ryan 28 yard pass to Jason Snelling.",
        longPlayResult:"(11:32) (Shotgun) M.Ryan pass short right to J.Snelling for 28 yards, TOUCHDOWN.",
        tackler1Id:0,
        tackler2Id:0,
        tackler3Id:0,
        yardsGained:28,
        gameClock:692},
        ...
        ]
