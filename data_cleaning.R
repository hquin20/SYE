library(tidyverse)

## Exploratory Analysis

raw_bechdel <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/raw_bechdel.csv')
movies <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-03-09/movies.csv')

movies <- movies %>% mutate(binary_test = if_else(binary == "PASS", 1, 0))
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

test_df <- read_tsv(here::here("data.tsv")) |>    # this line takes very long time to load
  mutate(imdbid = parse_number(tconst))
movies_api <- jsonlite::read_json('http://bechdeltest.com/api/v1/getAllMovies',simplifyVector = TRUE)%>%
  tibble::tibble()%>%
  mutate(year=as.numeric(year),
         id=as.numeric(id),
         imdbid = as.numeric(imdbid))
basics.movies <- left_join(movies_api, test_df,
                           by = "imdbid")
sum(is.na(basics.movies$genres)) ## only 8 missing!!

write_csv(basics.movies, here::here("data/basics.movies.csv"))

## this one doesnt work yet




