# win_probability-

Building a Baseball Win Probability Model

The 2016 Cubs were the team to beat last season. Constructed with cheap and talented prospects, a daunting pitching staff headed by Jon Lester and Kyle Hendricks, and a dominant bullpen, the Cubs cut through the National League and claimed their first World Series since 1908.

To relive the 2016 season, we created a win probability model in an attempt to measure under and over-achieving teams and apply the model to the 2017 campaign. Using Logistic regression, we developed a model that measures the probability or odds of the response taking a particular value (1 if home team wins, 0 if home team loses), which is modeled conditional on the home and visitor’s Elo rating as well as the starting pitcher ratings. Unlike FiveThirtyEight’s win probability model, our model does not adjust for rest days and how far the visiting team has traveled.

The Elo rating system calculates the relative skills levels of MLB teams in a head–to-head matchup. Each team is assigned a rating (average 1500) after every game with the winning team gaining some Elo points and the losing team giving way the same number of points.

The model is trained on 2,249 games from the 2016 season using game-by-game data from RetroSheet.com. This allows us to adjust whether a team is playing at home or on the road and measure the strength of the starting pitchers on both sides. Our starting pitcher ratings are sourced from the Elias Sports Bureau on a scale of 0-100. Pitcher ratings are also adjusted after each game.


Read the Entire Article Here: https://beyondtheaverage.wordpress.com/2017/07/13/were-the-cubs-the-best-team-in-2016/
