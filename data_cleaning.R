library(tidyverse)

raw_bechdel <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/raw_bechdel.csv')
movies <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

write_csv(raw_bechdel, here::here("data/raw_bechdel.csv"))
write_csv(movies, here::here("data/movies_raw.csv"))


## Exploratory Analysis

movies_raw <- movies %>% mutate(binary_test = if_else(binary == "PASS", 1, 0))
movies$plot <- str_to_lower(movies$plot)
movies_women <- movies %>% mutate(women = str_detect(plot, " woman | women | she | her | girl "))

write_csv(movies_women, here::here("data/movies_women.csv"))


## Sentiment Analysis

library(tidytext)
library(textdata)

afinn <- get_sentiments("afinn")
bing <- get_sentiments("bing")
nrc <- get_sentiments("nrc")

movies$plot <- str_to_lower(movies$plot)
plot <- movies %>% select(plot, title) %>% unnest_tokens(output = "word", input = "plot")
plot_stop <- anti_join(plot, stop_words, by = c("word" = "word"))

plot_afinn <- plot_stop %>% inner_join(afinn)
plot_bing <- plot_stop %>% inner_join(bing)
plot_nrc <- plot_stop %>% inner_join(nrc)

movie_sentiment <- plot_afinn %>% 
  group_by(title) %>%
  summarise(sentiment_score = sum(value))

plot_nrc <- plot_nrc |> mutate(sentiment = as.factor(sentiment),
                               title = as.factor(title)) |>
  group_by(sentiment, title, .drop = FALSE) |>
  summarise(count_sent = n())

movies2 <- movies %>% inner_join(movie_sentiment)

movies_bing <- movies2 %>% inner_join(plot_bing)
movies_nrc <- movies2 %>% inner_join(plot_nrc)

movies_test <- movies2 %>% select(title, binary)
movies_nrc_test <- plot_nrc %>% inner_join(movies_test) 

movies_bing_score <- movies_bing %>% 
  select(title, sentiment, binary) %>% 
  mutate(sentimentp_score = if_else(sentiment == "positive", 1, 0),
         sentimentn_score = if_else(sentiment == "negative", 1, 0)) %>% 
  group_by(title) %>% 
  summarise(positive_score = sum(sentimentp_score), negative_score = sum(sentimentn_score)) %>%
  mutate(rough_score = positive_score - negative_score) %>%
  select(title, rough_score)

movies_bing <- movies_bing %>% inner_join(movies_bing_score)

movies2 <- movies2 %>% inner_join(movies_bing_score)

write_csv(movies2, here::here("data/movies_sentiment.csv"))


## Genre Analysis pt. 1

movies_genre <- movies2 %>% unnest_tokens(output = "genre", input = "genre")


## Genre Analysis pt. 2

test_df <- read_tsv(here::here("data.tsv")) |>    # data downloaded from from IMDb website 
  mutate(imdbid = parse_number(tconst))
movies_api <- jsonlite::read_json('http://bechdeltest.com/api/v1/getAllMovies',simplifyVector = TRUE)%>%
  tibble::tibble()%>%
  mutate(year=as.numeric(year),
         id=as.numeric(id),
         imdbid = as.numeric(imdbid))
basics.movies <- left_join(movies_api, test_df,   ## IMDb movies joined with bechdel test data set (api data)
                           by = "imdbid")
sum(is.na(basics.movies$genres)) ## only 8 missing!!


basics.movies <- basics.movies |>separate_rows(genres, sep = ",") # movies appear multiple times for multiple genres
basics.movies <- basics.movies |> mutate(binary = if_else(rating == 3, "PASS", "FAIL"))


write_csv(basics.movies, here::here("data/movies_genre.csv"))  ## this will not work yet



## Modeling pt. 1

movies_og <- read_csv("basics_movies.csv")
movies.model <- movies.model |>separate_rows(genres, sep = ",") # movies appear multiple times for multiple genres
movies.model <- movies.model |> mutate(binary = if_else(rating == 3, "1", "0")) |> 
  mutate(binary = as.numeric(binary)) |>
  filter(!genres %in% c("News", "Adult", "Talk-Show", "\\N")) |>
  relocate(binary)

movies_indi <- 
  movies_og |> 
  filter(!genres %in% c("News", "Adult", "Talk-Show", "\\N")) |>
  separate_rows(genres, sep = ",") |>
  pivot_wider(names_from = genres, values_from = title) |>
  mutate(across(c("Documentary", "Animation", "Sport", "Short", "Action", "Comedy", "Romance", "NA",
                  "Western", "Music", "History", "Horror", "Family", "Fantasy", 
                  "Drama", "Crime", "Adventure", "Biography", "Mystery", "Sci-Fi", "War", 
                  "Thriller", "Musical", "Film-Noir", "Adult"), 
                ~if_else(is.na(.), 0, 1)))

movies_indi <- movies_indi |> 
  mutate(binary = if_else(rating == 3, "1", "0")) |> 
  mutate(binary = as.numeric(binary)) |> mutate(binary = as.factor(binary))

write_csv(movies_indi, here::here("data/movies_indicator.csv"))

## saving the grid because it is large to load in every time

library(modelr)
grid1 <- movies_indi |>
  data_grid(
    year = seq_range(year, n = 6),
    binary = c(0, 1),
    Animation = c(0, 1),
    Action = c(0, 1),
    Adult = c(0, 1),
    Adventure = c(0, 1),
    Biography = c(0, 1),
    Comedy = c(0, 1),
    Crime = c(0, 1),
    Documentary = c(0, 1),
    Drama = c(0, 1),
    Family = c(0, 1),
    Fantasy = c(0, 1),
    History = c(0, 1),
    Horror = c(0, 1),
    Music = c(0, 1),
    Musical = c(0, 1),
    Mystery = c(0, 1),
    Romance = c(0, 1),
    Short = c(0, 1),
    Sport = c(0, 1),
    Thriller = c(0, 1),
    War = c(0, 1),
    Western = c(0, 1)
  )

write_csv(grid1, here::here("data/movies_grid1.csv"))

## API Data Set 

library(awtools)
library(jsonlite)
library(ggplot2movies)

ggplotmovies <- ggplot2movies::movies

movies_api <- jsonlite::read_json('http://bechdeltest.com/api/v1/getAllMovies',simplifyVector = TRUE)%>%
  data.frame()%>%
  mutate(year=as.numeric(year),
         id=as.numeric(id))

write_csv(movies_api, here::here("data/movies_api.csv"))






