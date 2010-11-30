package com.util
{
	import com.juiceanalytics.fantasytracker.model.FantasyPlayer;
	import com.juiceanalytics.fantasytracker.model.FantasyTeam;
	
	public class FantasyPointCalculator
	{
		/**
		 * Calculate the fantasy points for a team
		 */
		public static function calculateTeamPoints(fantasyTeam:FantasyTeam, multiplierArray:Array):Number
		{
			if (fantasyTeam.length && multiplierArray.length)
			{
				var teamScore:Number = 0;
				for each (player:FantasyPlayer in fantasyTeam)
				{
					teamScore += calculatePlayerPoints(player,multiplierArray);
				}
				return teamScore;
			}
			return 0;
		}
		
		/**
		 *	Calculate the Fantasy Points for a single player 
		 */
		public static function calculatePlayerPoints(player:FantasyPlayer, multiplierArray:Array):Number
		{
			var playerScore:Number = 0;
			
			// There are 155 possible stats that ESPN keeps track of for each player
			for (var i:int = 0; i < 156; i++)
			{
				if (player.currentStats.hasOwnProperty(i)  && multiplierArray.hasOwnProperty(i))
				{
					finalScore += player.currentStats[i] * mulitplierArray[i];
				}
			}
			return playerScore; 
		}
		
	}
}