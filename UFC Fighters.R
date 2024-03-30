################################################################################
#                                                                              #
#     With this code, you will be able to scrape information about each        #
#                             fighter                                          #
#                                                                              #
################################################################################
library(rvest)
library(tidyverse)
library(readxl)

url_fighters_A <- "http://ufcstats.com/statistics/fighters?char=a&page=all"
page_A <- read_html(url_fighters_A)

url_fighters_B <- "http://ufcstats.com/statistics/fighters?char=b&page=all"
page_B <- read_html(url_fighters_B)

url_fighters_C <- "http://ufcstats.com/statistics/fighters?char=c&page=all"
page_C <- read_html(url_fighters_C)


url_fighters_D <- "http://ufcstats.com/statistics/fighters?char=d&page=all"
page_D <- read_html(url_fighters_D)


url_fighters_E <- "http://ufcstats.com/statistics/fighters?char=e&page=all"
page_E <- read_html(url_fighters_E)


url_fighters_F <- "http://ufcstats.com/statistics/fighters?char=f&page=all"
page_F <- read_html(url_fighters_F)


url_fighters_G <- "http://ufcstats.com/statistics/fighters?char=g&page=all"
page_G <- read_html(url_fighters_G)


url_fighters_H <- "http://ufcstats.com/statistics/fighters?char=h&page=all"
page_H <- read_html(url_fighters_H)


url_fighters_I <- "http://ufcstats.com/statistics/fighters?char=i&page=all"
page_I <- read_html(url_fighters_I)
 

url_fighters_J <- "http://ufcstats.com/statistics/fighters?char=j&page=all"
page_J <- read_html(url_fighters_J)


url_fighters_K <- "http://ufcstats.com/statistics/fighters?char=k&page=all"
page_K <- read_html(url_fighters_K)


url_fighters_L <- "http://ufcstats.com/statistics/fighters?char=l&page=all"
page_L <- read_html(url_fighters_L)


url_fighters_M <- "http://ufcstats.com/statistics/fighters?char=m&page=all"
page_M <- read_html(url_fighters_M)
 

url_fighters_N <- "http://ufcstats.com/statistics/fighters?char=n&page=all"
page_N <- read_html(url_fighters_N)
 

url_fighters_O <- "http://ufcstats.com/statistics/fighters?char=o&page=all"
page_O <- read_html(url_fighters_O)


url_fighters_P <- "http://ufcstats.com/statistics/fighters?char=p&page=all"
page_P <- read_html(url_fighters_P)
 

url_fighters_Q <- "http://ufcstats.com/statistics/fighters?char=q&page=all"
page_Q <- read_html(url_fighters_Q)


url_fighters_R <- "http://ufcstats.com/statistics/fighters?char=r&page=all"
page_R <- read_html(url_fighters_R)
 

url_fighters_S <- "http://ufcstats.com/statistics/fighters?char=s&page=all"
page_S <- read_html(url_fighters_S)


url_fighters_T <- "http://ufcstats.com/statistics/fighters?char=t&page=all"
page_T <- read_html(url_fighters_T)


url_fighters_U <- "http://ufcstats.com/statistics/fighters?char=u&page=all"
page_U <- read_html(url_fighters_U)


url_fighters_V <- "http://ufcstats.com/statistics/fighters?char=v&page=all"
page_V <- read_html(url_fighters_V)


url_fighters_U <- "http://ufcstats.com/statistics/fighters?char=w&page=all"
page_W <- read_html(url_fighters_U)


url_fighters_X <- "http://ufcstats.com/statistics/fighters?char=x&page=all"
page_X <- read_html(url_fighters_X)


url_fighters_Y <- "http://ufcstats.com/statistics/fighters?char=y&page=all"
page_Y <- read_html(url_fighters_Y)


url_fighters_Z <- "http://ufcstats.com/statistics/fighters?char=z&page=all"
page_Z <- read_html(url_fighters_Z)


Fighters <- rbind( page_A %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_B %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_C %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_D %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_E %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_F %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_G %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_H %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_I %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_J %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_K %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_L %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_M %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_N %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_O %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_P %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_Q %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_R %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_S %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_T %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_U %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_V %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_W %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_X %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]], 
                          page_Y %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]],
                          page_Z %>% html_nodes("table.b-statistics__table") %>% 
                            html_table() %>% .[[1]]
)


Fighters <- Fighters %>% select(-Belt)

data_fighters <- Fighters

data_fighters <- data_fighters %>% mutate(Foot=NA,Inches=NA,Ind=1:length(data_fighters$Ht.))

ht <- data.frame(Foot=data_fighters$Ht.,Inches = data_fighters$Ht., Ind = 1:length(data_fighters$Ht.))
ht <- ht %>% filter(Foot!="--")
ht <- ht %>% mutate(Foot = substr(Foot,1,1)) %>% mutate(Inches = substr(Inches,4,5))
ht <- ht %>% mutate(Inches = gsub("\"", "", Inches) )

for (i in 1:length(ht$Ind)) {
  k <- ht$Ind[i]
  data_fighters$Foot[k] <- ht$Foot[i]
  data_fighters$Inches[k] <- ht$Inches[i]
}

data_fighters$Foot <- as.numeric(data_fighters$Foot)
data_fighters$Inches <- as.numeric(data_fighters$Inches)

data_fighters <- data_fighters %>% mutate(Height_cm = ((Foot*12)+Inches)*(0.0254)    )

data_fighters <- data_fighters %>% mutate(Weight.Lbs = gsub("[^0-9]", "", Wt.) )
data_fighters$Weight.Lbs <- as.numeric(data_fighters$Weight.Lbs)

data_fighters_final <- data_fighters %>% mutate(Weight.Kg = Weight.Lbs*0.453592)

data_fighters_final <- slice(data_fighters_final, -1)

View(data_fighters_final)


