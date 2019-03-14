#---  
#Title: Data Preparation
#Description: We will be preparing the data.
#Input(s): 
#Output(s): 
#---

library(ggplot2)
library(dplyr)
library(grid)
library(jpeg)

# scatterplot
klay_scatterplot <- ggplot(data = thompson) + geom_point(aes(x = x, y = y, color = shot_made_flag))

# court image (to be used as background of plot)
court_file <- "/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
klay_shot_chart

andre_iguodala_shot_chart <- ggplot(data = iguodola) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()

draymond_green_shot_chart <- ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()

kevin_durant_shot_chart <- ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()

klay_thompson_shot_chart <- ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()

stephen_curry_shot_chart <- ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()

ggsave("../images/andre-iguodala-shot-chart.pdf", andre_iguodala_shot_chart, 
       width = 6.5, height = 5)

ggsave("../images/draymond-green-shot-chart.pdf", draymond_green_shot_chart, 
       width = 6.5, height = 5)

ggsave("../images/kevin-durant-shot-chart.pdf", kevin_durant_shot_chart, 
       width = 6.5, height = 5)

ggsave("../images/klay-thompson-shot-chart.pdf", klay_thompson_shot_chart, 
       width = 6.5, height = 5)

ggsave("../images/stephen-curry-shot-chart.pdf", stephen_curry_shot_chart, 
       width = 6.5, height = 5)

gsw_shot_charts <- ggplot(data = new) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Combined Chart of Warrior Players') +
  theme_minimal() + facet_wrap(name ~.)
gsw_shot_charts

ggsave("../images/gsw-shot-charts.pdf", gsw_shot_charts, 
       width = 8, height = 7)

ggsave("../images/gsw-shot-charts.png", gsw_shot_charts, 
       width = 8, height = 7)
