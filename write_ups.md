# Summary up to November 1


Exploratory analysis:

In our data set, representing 1794 movies in total, 803 movies pass the bechdel test while 991 fail. Most movies in this data set were released in the 2000s to 2010s. To investigate the presence of women in these films, a binary variable was created to detect words relating to women in the plot summary. The words used to detect this were: *woman*, *women*, *she*, *her*, and *girl*. 357 movies had detected the presence of these words and 1235 movies did not. When comparing these groups of movies, boxplots were used. IMDB ratings appeared to be slightly higher for movies that did not include words relating to women. Movies that contained these words in the plot summary also seemed to have more recent release dates. 

To examine the details of the bechdel test a jitter plot was created using our women variable and sorted using how the movie passed the test. This led into an investigation of the *dubious* level of the clean_test variable because certain movies that claimed to pass online did not appear to pass in our data. This was found to be because if a movie was deemed questionable in its relation to passing the bechdel test it was labeled as dubious and therefore failed the test. Looking further into the bechdel test, it appears that movies that pass may have a slightly higher number of voters on IMDB. It could also be suggested that movies with women who don't talk or movies that do not have a main character who is a women have slightly higher ratings on IMDB.


Sentiment Analysis:

For our sentiment analysis we used three different sets of sentiments to assess our data (bing, nrc, afinn). For all movies, sentiment scores showed a normal distribution centering around -3, on a scale from -10 to 10. Movies that passed the bechdel test could have a slightly higher overall sentiment score than movies that do not. We then assigned movies to an emotion (such as joy, anger, fear, saddness, etc.) and created an array of boxplots of movies that passed/failed in each of these sentiment categories. Heat maps were then used to visually organize the number of movies in each sentiment, separated by movies that pass the bechdel test and those that do not, as well as an array of heat map plots designed to invetigate this for each sentiment category. The next step is to create these heat maps with proportions instead of using number of movies. 


Genre Analysis:

We investigated the sentiment of movies that either pass or fail the bechdel test, separated by movie genre. This was done using a rough sentiment score that was created to place a value on the number of posiitve/negative words included in the plot summary. A series of boxplots were created to show these trends, but there are no obvious differences within genres. Looking within each genre specifically, the number of movies that pass and fail the bechdel test was examined over time. Some intertesting trends were seen among these plots. For example, within action movies, the number of movies that fail the test increase at a higher rate than the number of movies that pass the test over time. For comedy movies, the number of movies that pass over time was higher than the number of movies that fail during the mid 2000s, but this trend seems to reverse in the recent decade. This analysis was conducted using the data set used for previous exploratory and sentiment analyses, but only includes movies up until 2013. Future analysis on genre would like to inlcude more movies from the recent decade, so the first step for next semester will be searching for a newer data set. 







