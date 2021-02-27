library(tidyverse)
library(glue)


2:9 %>% 
  map(function(.x){
    
    download.file(glue("http://storage.googleapis.com/books/ngrams/books/googlebooks-eng-all-1gram-20090715-{.x}.csv.zip"),
                  glue("./import/googlebooks-eng-all-1gram-20090715-{.x}.csv.zip"))
    
  })

0:9 %>% 
  map_df(function(.x){
    
    # traditional CSV "tab separated" (it's big)
    raw1gram <- read_delim(glue("./import/googlebooks-eng-all-1gram-20090715-{.x}.csv.zip"),
                           delim = "\t", col_names = c("ngram","year","word.count","page.count","book.count"),
                           col_types = "cinnn")
    
    raw1gram %>%
      filter( ngram %in% as.character(1850:2010) ) %>% 
      return()
    
    
  }) -> yearsGram

saveRDS(yearsGram,"./data/ngrams_v1_years.rds")
yearsGram$ngram %>% unique()
gc()


yearsGram %>% 
  mutate(ngram=as.integer(ngram)) %>% 
  select(ngram) %>% 
  arrange(ngram) %>% 
  distinct() %>% 
  pull(ngram) 
