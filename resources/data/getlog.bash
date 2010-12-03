while true; do
    DATE=`date +%Y%m%d_%H%M`
    wget -O/Users/cgemignani/dev/flex/workspace2/FantasyFootball/resources/data/fantasycast/log$DATE.txt "http://g.espncdn.com/ffl/livescoring/init/all?callback=initFantasyCast&configType=fantasycast&seasonId=2010&scoringPeriodId=13"    
    sleep 50;
done
