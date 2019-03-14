#---  
#Title: Data Preparation
#Description: We will be preparing the data.
#Input(s): 
#Output(s): 
#---
library(dplyr)

iguodola <- read.csv("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/andre-iguodola.csv", stringsAsFactors = FALSE)
green <- read.csv("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/stephen-curry.csv", stringsAsFactors = FALSE)

andre = "Andre Iguodola"
iguodola$name = andre
iguodola

draymond = "Draymond Green"
green$name = draymond
green

kevin = "Kevin Durant"
durant$name = kevin
durant

klay = "Klay Thompson"
thompson$name = klay
thompson

stephen = "Stephen Curry"
curry$name = stephen
curry

iguodola[iguodola$shot_made_flag == "y", ]$shot_made_flag <- "shot_yes"
iguodola[iguodola$shot_made_flag == "n", ]$shot_made_flag <- "shot_no"

green[green$shot_made_flag == "y", ]$shot_made_flag <- "shot_yes"
green[green$shot_made_flag == "n", ]$shot_made_flag <- "shot_no"

durant[durant$shot_made_flag == "y", ]$shot_made_flag <- "shot_yes"
durant[durant$shot_made_flag == "n", ]$shot_made_flag <- "shot_no"

thompson[thompson$shot_made_flag == "y", ]$shot_made_flag <- "shot_yes"
thompson[thompson$shot_made_flag == "n", ]$shot_made_flag <- "shot_no"

curry[curry$shot_made_flag == "y", ]$shot_made_flag <- "shot_yes"
curry[curry$shot_made_flag == "n", ]$shot_made_flag <- "shot_no"

iguodola_minute <- iguodola$period * 12 - iguodola$minutes_remaining
iguodola$minute = iguodola_minute

green_minute <- green$period * 12 - green$minutes_remaining
green$minute = green_minute

durant_minute <- durant$period * 12 - durant$minutes_remaining
durant$minute = durant_minute

thompson_minute <- thompson$period * 12 - thompson$minutes_remaining
thompson$minute = thompson_minute

curry_minute <- curry$period * 12 - curry$minutes_remaining
curry$minute = curry_minute

sink("andre-iguodala-summary.txt")
print(summary(iguodola))
sink()

sink("draymond-green-summary.txt")
print(summary(green))
sink()

sink("kevin-durant-summary.txt")
print(summary(durant))
sink()

sink("klay-thompson-summary.txt")
print(summary(thompson))
sink()

sink("stephen-curry-summary.txt")
print(summary(curry))
sink()

new <- rbind(iguodola, green, durant, thompson, curry)
new

write.csv(new, "shots-data.csv")

sink("shots-data-summary.txt")
print(summary(new))
sink()

