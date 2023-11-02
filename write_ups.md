# Summary up to November 1


Exploratory analysis:

In our data set, representing 1794 movies in total, 803 movies pass the bechdel test while 991 fail. Most movies in this data set were released in the 2000s to 2010s. To investigate the presence of women in these films, a binary variable was created to detect words relating to women in the plot summary. The words used to detect this were: *woman*, *women*, *she*, *her*, and *girl*. 357 movies had detected the presence of these words and 1235 movies did not. When comparing these groups of movies, boxplots were used. IMDB ratings appeared to be slightly higher for movies that did not include words relating to women. Movies that contained these words in the plot summary also seemed to have more recent release dates. 

To examine the details of the bechdel test a jitter plot was created using our women variable and sorted using how the movie passed the test. This led into an investigation of the *dubious* level of the clean_test variable because certain movies that claimed to pass online did not appear to pass in our data. This was found to be because if a movie was deemed questionable in its relation to passing the bechdel test it was labeled as dubious and therefore failed the test. Looking further into the bechdel test, it appears that movies that pass may have a slightly higher number of voters on IMDB. It could also be suggested that movies with women who don't talk or movies that do not have a main character who is a women have slightly higher ratings on IMDB.


Sentiment Analysis:

For our sentiment analysis we used three different sets of sentiments to assess our data (bing, nrc, afinn). For all movies, sentiment scores showed a normal distribution centering around -3, on a scale from -10 to 10. Movies that passed the bechdel test could have a slightly higher overall sentiment score than movies that do not. We then assigned movies to an emotion (such as joy, anger, fear, saddness, etc.) and created an array of boxplots of movies that passed/failed in each of these sentiment categories. Heat maps were then used to visually organize the number of movies in each sentiment, separated by movies that pass the bechdel test and those that do not, as well as an array of heat map plots designed to invetigate this for each sentiment category. The next step is to create these heat maps with proportions instead of using number of movies. 


