library(tidyverse)
library(rvest)

## https://datasets.imdbws.com/

test_df <- read_tsv(here::here("title.basics.tsv")) |>
  mutate(imdbid = parse_number(tconst))

movies_api <- jsonlite::read_json('http://bechdeltest.com/api/v1/getAllMovies',simplifyVector = TRUE)%>%
 tibble::tibble()%>%
  mutate(year=as.numeric(year),
        id=as.numeric(id),
        imdbid = as.numeric(imdbid))

test_join <- left_join(movies_api, test_df,
          by = "imdbid")

sum(is.na(test_join$genres)) ## only 8 missing!!

test_join$genres

