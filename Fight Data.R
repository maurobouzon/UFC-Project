################################################################################
#                                                                              #
# With this code, you will be able to scrape TOTALS AND  SIGNIFICANT STRIKES   # 
#                        tables form each fight.                               #
#                 This code could take a few minutes.                          #
#                                                                              #
#                                                                              #
################################################################################

library(rvest)
library(tidyverse)

url<-"http://ufcstats.com/statistics/events/completed?page=all" 
page <- read_html(url)

event <- page %>%                                 
  html_nodes(".b-link_style_black") %>% 
  html_attr("href") 

TOTALS <- data.frame("Fighters"=0,"Round"=0 ,"KD"=0, "Sig.Str."=0,"Sig.Str %"=0 ,"Total Str"=0, "TD"=0, "TD %"=0,
                          "Sub.Att"=0, "Rev."=0, "Ctrl"=0,"Method"=0,"Until"=0, "Until min"=0, "Referee"=0, "Format"=0,
                          "Event Name"=0, "Date"=0, "Location"=0)
SIGNIFICANT_STRIKES <- data.frame("Fighters"=0, "SIG.STR"=0, "Sig.Str%"=0,"HEAD"=0 ,"BODY"=0, "LEG"=0, "DISTANCE"=0,
                         "CLINCH"=0, "GROUND"=0,"Metodo"=0,"Until"=0, "Until min"=0, "Referee"=0, "Format"=0,
                        "Event Name"=0, "Date"=0, "Location"=0)

for (i in 1:length(event)) {
url_event <- event[i] 
page_event <- read_html(url_event)

fight <- page_event %>%
  html_nodes(xpath='/html/body/section/div/div/table/tbody/tr') %>% html_attrs() %>% data.frame() 


fight <- fight[c(3), ]
fight <- t(fight) %>% as.data.frame()
colnames(fight) <- "Vars"
lvars <- length(fight$Vars)
row.names(fight) <- c(1:lvars)
lfight <- length(fight$Vars)

for (j in 1:lfight) {


url_fight <- fight$Vars[j]

page_fight <- read_html(url_fight)
page_fight2 <- read_html(url_fight)

Round_1 <- page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .b-fight-details__table-row_type_head .b-fight-details__table-col") %>% 
  html_text() %>% as.data.frame()
lround <- length(Round_1$.)
Round_1 <- Round_1 %>% mutate(n=1:lround)
Round_1_2 <- rbind(Round_1,Round_1)
Round_1_2 <- Round_1_2 %>% arrange(n) %>% select(-n)

Method <- page_fight %>% html_nodes(".b-fight-details__label+ i") %>% 
  html_text() %>% as.character()
lmethod <- lround*2
for (k in 2:lmethod) {
  Method[k] <- Method[1]
}
Method <- Method %>% as.data.frame()

Until <- page_fight %>% html_nodes(".b-fight-details__text-item_first+ .b-fight-details__text-item") %>% 
  html_text() %>% as.character()

for (k in 2:lmethod) {
  Until[k] <- Until[1]
}
Until <- Until %>% as.data.frame()


Until_min <- page_fight %>% html_nodes(".b-fight-details__text-item:nth-child(3)") %>% 
  html_text() %>% as.character()

for (k in 2:lmethod) {
  Until_min[k] <- Until_min[1]
}
Until_min <- Until_min %>% as.data.frame()

Format <- page_fight %>% html_nodes(".b-fight-details__text-item:nth-child(4)") %>% 
  html_text() %>% as.character()

for (k in 2:lmethod) {
  Format[k] <- Format[1]
}
Format <- Format %>% as.data.frame()


Referee <- page_fight %>% html_nodes("span") %>% 
  html_text() %>% as.character()

for (k in 2:lmethod) {
  Referee[k] <- Referee[1]
}
Referee <- Referee %>% as.data.frame()

event_name <- page_event %>% 
    html_elements(".b-content__title-highlight") %>%  html_text()

for (k in 2:lmethod) {
  event_name[k] <- event_name[1]
}
event_name <- event_name %>% as.data.frame()

event_date <- page_event %>%
    html_elements(".b-list__box-list-item:nth-child(1)") %>%  html_text()

for (k in 2:lmethod) {
  event_date[k] <- event_date[1]
}
event_date <- event_date %>% as.data.frame()

event_location <- page_event %>%
  html_elements(".b-list__box-list-item+ .b-list__box-list-item") %>%  html_text()

for (k in 2:lmethod) {
  event_location[k] <- event_location[1]
}
event_location <- event_location %>% as.data.frame()




table1_fights <- data.frame(page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .l-page_align_left .b-fight-details__table-text") %>% 
                             html_text() %>% as.character(),
                           Round_1_2,
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .l-page_align_left+ .b-fight-details__table-col .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(3) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(4) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(5) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(6) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(7) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(8) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-section+ .js-fight-section .js-fight-table .b-fight-details__table-col:nth-child(9) .b-fight-details__table-text") %>% 
                             html_text(),
                           page_fight %>% html_nodes(".js-fight-table .b-fight-details__table-col:nth-child(10) .b-fight-details__table-text") %>% 
                             html_text(),
                           Method,
                           Until,
                           Until_min,
                           Referee,
                           Format,
                           event_name,
                           event_date,
                           event_location
                           
                           
)

colnames(table1_fights)<- c("Fighters","Round" ,"KD", "Sig.Str.","Sig.Str %" ,"Total Str", "TD", "TD %",
                           "Sub.Att", "Rev.", "Ctrl","Metodo","Hasta", "Hasta min", "Juez", "Formato",
                           "Nombre Evento", "Fecha", "Lugar")
colnames(TOTALS)<- c("Fighters","Round" ,"KD", "Sig.Str.","Sig.Str %" ,"Total Str", "TD", "TD %",
                        "Sub.Att", "Rev.", "Ctrl","Metodo","Hasta", "Hasta min", "Juez", "Formato",
                        "Nombre Evento", "Fecha", "Lugar")


table2_fights <- data.frame(page_fight2 %>% html_nodes("table+ .js-fight-section .b-link_style_black") %>% 
                             html_text() %>% as.character(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .l-page_align_left+ .b-fight-details__table-col .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(3) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(4) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(5) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(6) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(7) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(8) .b-fight-details__table-text") %>% 
                             html_text(),
                            page_fight2 %>% html_nodes("table+ .js-fight-section .b-fight-details__table-col:nth-child(9) .b-fight-details__table-text") %>% 
                             html_text(),
                           Method,
                           Until,
                           Until_min,
                           Referee,
                           Format,
                           event_name,
                           event_date,
                           event_location
)
colnames(table2_fights)<- c("Fighters", "SIG.STR", "Sig.Str%","HEAD" ,"BODY", "LEG", "DISTANCE",
                           "CLINCH", "GROUND","Method","Until", "Until min", "Referee", "Format",
                           "Name Event", "Date", "Location")
colnames(SIGNIFICANT_STRIKES)<-c("Fighters", "SIG.STR", "Sig.Str%","HEAD" ,"BODY", "LEG", "DISTANCE",
                       "CLINCH", "GROUND","Method","Until", "Until min", "Referee", "Format",
                       "Name Event", "Date", "Location")

TOTALS <- rbind(TOTALS,table1_fights)
SIGNIFICANT_STRIKES <- rbind(SIGNIFICANT_STRIKES, table2_fights )

  }

}
TOTALS <- TOTALS %>% slice(-1)
SIGNIFICANT_STRIKES <- SIGNIFICANT_STRIKES %>% slice(-1)

View(TOTALS)
View(SIGNIFICANT_STRIKES)