## April 18

1. Rough Draft of Poster

2. Submit abstract: <https://www.stlawu.edu/offices/festival-science-scholarship-and-creativity/abstract-submission>


## April 11

1. Making the graph for the "extra analysis part."

2. Left-panel of poster done and then plots in the other two panels there (but not formatted).

## April 4

1. Left-panel of poster with background and data introduction (maybe do write-up at same time / outline of write-up at some time).

2. Make two plots look "nicer".

3. Look into layout and options of poster.

    * https://github.com/kaseygwood/slufellow/tree/main/fellow_poster
    * https://github.com/lilykasperek/Fellowship2023/tree/main/Fellowship_Poster

## Dates

April 11: Abstract Submission (will do at meeting)

April 21: Poster Printing Deadline

## March 28

MH: look at awards.

1. Put any data cleaning / joining / prep work into a data_cleaning.R file. At the end, use write_csv(here::here("data/name_of_file.csv")) and put the clean data sets into a /data folder.

    * anything old that is not being used can either be deleted or put in its own folder.
    
2. Clean up graphs (especially the genre analysis graphs).

3. Start the poster <https://github.com/brentthorne/posterdown>.

    1. introduce the data sets in bullet points (number of movies, variables of interest, etc.)
    
    1. introduce the Bechdel test itself in bullet points.

## March 14

1. Put rug marks on faceted graph (and on the coloured one too).

2. Clean up graphs and make them look "nice".

3. Go back to the other data set and pick another question to answer (some ideas: male/female director, awards, budget and gross income).

## March 7

1. Make sum variable on grid and filter to keep only rows where sum is 1. Then augment().

2. pivot_longer() the augmented data frame to make plots, using genre as an aesthetic or as a facet.

3. If goes well, add an interaction between year and each of the genre variables in the model and plot and compare plots and compare BIC.

4. Examine posterdown link: <https://github.com/brentthorne/posterdown>.

5. Next week, talk more about the write-up.

## February 22

1. Fix model so that each movie is one row.

2. Look at data viz section 10 to start making plot of predictions.

## February 8

1. Clean up plots in genre-analysis-p2.qmd

2. Expand model.

3. Plot model.

4. Create indicator variables for each genre "manually".

## February 1

1. geom_rug() plots for each genre. 

2. If time, fit logistic regression model with genre, year, (and interaction?), and make plot.

3. After Monday, lollipop plot of proportion of passing test.

## January 25

1. genre with new data set

 - separate genre so each movie appears more than once (since movies have multiple genres)
 
2. time 

3. interactions - maybe small interaction time and movies passing within genre

- possibly fit model after this is done (more of a future task)


## November 30

1. Use updated data frame for sentiment and genre analysis (focusing especially on past decade).

2. Consider a logistic regression model for PASS/FAIL with year, genre, and perhaps their interaction as covariates.


## For November 16

1. Investigate genre or why movies fail or another predictor.

For more movies: <https://austinwehrwein.com/post/bechdel/>, <https://bechdeltest.com/api/v1/doc>


## For November 9

1. positivity score graph.

## For November 2

1. Update heat maps to proportions.

2. Informal 1-2 paragraph write-up of progress so far.

## October 19

1. Wrangle data so that each row corresponds to a movie-sentiment combination with a column for whether or not the sentiment appeared.

2. Make plots in sketches.

```
plot_nrc |> mutate(sentiment = as.factor(sentiment),
                   title = as.factor(title)) |>
  group_by(sentiment, title, .drop = FALSE) |>
  summarise(count_sent = n())
```

## For October 5

1. Create data set where each row is a word and there is a column for each word's sentiment (positive/negative or fear/anger/joy/etc.).

    1. Can use this <https://highamm.github.io/ds234_quarto/12-stringr.html#text-analysis> for word manipulation
    
    1. get_sentiments("afinn")

1. Check in to `dubious` movies.

## September 28

No Meeting: MH

## September 21

1. More exploration, especially with the pass variable.

2. Explore the more complex variable (plot, other non-numeric).

## For September 14

No Meeting: HQ.

