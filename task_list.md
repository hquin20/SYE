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

