################################################################################
#                                                                              #
#     With this code, you will be able to scrape information about each        #
#                fight card and each fight on the card.                        #
#                                                                              #
################################################################################

library(rvest)
library(tidyverse)

url_events<-"http://ufcstats.com/statistics/events/completed?page=all"
page_events <- read_html(url_events)

event <- page_events %>%
  html_nodes(".b-link_style_black") %>% 
  html_attr("href") 

le <- length(event)

function_Main_Card <- function(events){
  
  all_main_cards <- data.frame(Event=0,Date=0,Place=0,Fighter=0, KD=0, STR=0, TD=0, SUB=0, 
                                     WEIGHT.CLASS = 0, METHOD=0, ROUND=0, TIME=0, RESULT=0)
  for (i in 1:le) {
    
    url_func <- event[i]
    page <- read_html(url_func)
  
    
    WEIGHT.CLASS1 <- page %>% html_nodes(".l-page_align_left:nth-child(7) .b-fight-details__table-text") %>% 
      html_text() %>% as.character() 
    
    lv<-length(WEIGHT.CLASS1)
    
    WEIGHT.CLASS1<-cbind(WEIGHT.CLASS1,n=1:lv) 
    
    WEIGHT.CLASS1 <- rbind.data.frame(WEIGHT.CLASS1,WEIGHT.CLASS1) %>% arrange(n) %>% select(-n)
    
    
    METHOD1 <- page %>% html_nodes(".js-fight-details-click .l-page_align_left+ .l-page_align_left") %>% 
      html_text() %>% as.character()
    
    METHOD1<-cbind(METHOD1,n=1:lv) 
    
    METHOD1 <- rbind.data.frame(METHOD1,METHOD1)  %>% arrange(n) %>% select(-n)
    
    
    ROUND1 <- page %>% html_nodes(".b-fight-details__table-col:nth-child(9) .b-fight-details__table-text") %>% 
      html_text() %>% as.numeric()
    
    ROUND1<-cbind(ROUND1,n=1:lv) 
    
    ROUND1 <- rbind.data.frame(ROUND1,ROUND1) %>% arrange(n) %>% select(-n)
    
    
    TIME1 <- page %>% html_nodes(".b-fight-details__table-col:nth-child(10) .b-fight-details__table-text") %>% 
      html_text() %>% data.frame()
    
    TIME1<-cbind(TIME1,n=1:lv) 
    
    TIME1 <- rbind.data.frame(TIME1,TIME1) %>% arrange(n) %>% select(-n)
    
    event_name <- page %>% html_nodes(".b-content__title-highlight") %>% 
      html_text() %>% as.character()
    
    event_date <- page %>% html_nodes(".b-list__box-list-item:nth-child(1)") %>% 
      html_text() %>% as.character()
    
    event_place <- page %>% html_nodes(".b-list__box-list-item+ .b-list__box-list-item") %>% 
      html_text() %>% as.character()
    
    
    res <-  page %>% html_nodes(".b-fight-details__table-text:nth-child(1) .b-flag__text") %>% 
      html_text() %>% as.data.frame()
    
        lr<- length(res$.)
        
        v <- data.frame(c(1:lr))
        
        res <- data.frame(res,v)
        res2 <- res
        
        result <- rbind(res,res2)
        
        result <- result %>% as.data.frame()
        
        result <- result %>% arrange(result$c.1.lr.) 
        
        colnames(result) <- c("Result")
        
        RESULT <- result %>% select(Result)
        
        ld <- length(result$Result)
        
        for (i in (1:ld)){
          if(i%%2!=0) {
            if(RESULT$Result[i]=="win"){
              RESULT$Result[i+1] <- "lose"
            }
            
          }
          
        }
    
    
    
    main_event <- data.frame(event_name,
                            event_date,
                            event_place,
                            page %>% html_nodes(".b-link_style_black") %>% 
                              html_text() %>% as.character(),
                            KD1 <- page %>% html_nodes(".b-fight-details__table-col:nth-child(3) .b-fight-details__table-text") %>% 
                              html_text() %>% as.numeric(),
                            page %>% html_nodes(".b-fight-details__table-col:nth-child(4) .b-fight-details__table-text") %>% 
                              html_text() %>% as.numeric(),
                            page %>% html_nodes(".b-fight-details__table-col:nth-child(5) .b-fight-details__table-text") %>% 
                              html_text() %>% as.numeric(),
                            page %>% html_nodes(".b-fight-details__table-col:nth-child(6) .b-fight-details__table-text") %>% 
                              html_text() %>% as.numeric(),
                            WEIGHT.CLASS1,
                            METHOD1, ROUND1, TIME1, RESULT)
    
    colnames(main_event) <- c("Event","Date","Place","Fighter", "KD", "STR", "TD", "SUB", 
                             "WEIGHT.CLASS", "METHOD", "ROUND", "TIME", "RESULT")
    
    
    all_main_cards <- rbind(all_main_cards,main_event)
    
    
    
  }
  all_main_cards <- all_main_cards[-c(1), ]
  
  return(all_main_cards)
}
 
main_card_table <- function_Main_Card(event)
View(main_card_table)
