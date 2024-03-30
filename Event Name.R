################################################################################
#                                                                              #
# With this code, you will be able to scrape the name, location, and date of   #
#                             each UFC event.                                  #
#                                                                              #
#                                                                              #
################################################################################

library(rvest)
library(tidyverse)


url_events<-"http://ufcstats.com/statistics/events/completed?page=all"
page <- read_html(url_events)


events <- data.frame( 
                      Event = page %>%
                         html_elements(".b-link_style_black") %>%
                         html_text() %>% as.character(),
                      Date = page %>%
                         html_elements(".b-statistics__table-row .b-statistics__date") %>%
                         html_text() %>% as.character(),
                      Place =  page %>%
                         html_elements(".b-statistics__table-row .b-statistics__table-col_style_big-top-padding") %>%
                         html_text() %>% as.character()
                       )

View(events)