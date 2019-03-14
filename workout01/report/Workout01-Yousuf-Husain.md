---
title: "Workout01_Yousuf_Husain"
output: github_document
---

*Warriors Are Excellent Shooters*

**Introduction**
The Golden State Warriors are currently one of the most dominant teams in the National Basketball Association (NBA), and this season they are vying for a three-peat after securing back-to-back championships in 2017 and 2018. A key factor for their unprecedented sucess has been their ridiculously effective shooting by their star players - Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry. This article will dive deeper into the players' respective shooting statistc and just how skilled they are. 

**Motivation** 
The presence of data analytics in the NBA has become incredibly solidified in recent years. Analysts have used data computing skills to understand how the nuances of team and player performance. Thus, this article will rely on analyzing shooting data for the five Golden State Warriors players to understand their shooting characteristics and where on the court they thrive.

**Background**
The NBA is predicated on team-oriented, fast-paced play. The NBA is divided into four, twelve-minute periods, with competing teams going back-and-forth over each possession to score a basket. Players can attempt either two-point or three-point field goals, which each shot carrying a different value. The value of a player to a team is attributed to a variety of factors, but one key factor is often field goal percentage. The field goal percentage is the percentage of shots a player makes, relative to the shots a player attempts. The typical goal is to have a field goal percentage of 50%; however, this varies from player to player depending on the position they play. The field goal percentage is also somewhat misleading, as a larger point of importance is the raw number of shots a player actually attempts. Thus, it is critical to evaluate both the total number of shots and the number of shots made for a certain playe.r 

Field goal percentage is significant because more talented players often possess higher field goal percentages. One of the most coveted statistics to obtain is the 50-40-90 mark, where a player has a 50% minimum two-point field goal percentage, a 40% minimum three-point field goal percentage, and a 90% minimum one-point, or free throw, percentage. This article will focus on two-point and three-point field goal percentages. Two-point field goal percentages are usually greater than three-point field goal percentages, given that three-point shots are harder to complete. 

**Data**

```{r, echo=FALSE}
source <- "/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/data/shots-data.csv"
data <- read.csv(source, sep = ",")
data

three_pt <- summarise(group_by(filter(data, shot_type == "3PT Field Goal"), name), total = n(), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total*100)
three_pt <- arrange(three_pt, desc(perc_made))
three_pt

two_pt <- summarise(group_by(filter(data, shot_type == "2PT Field Goal"), name), total = n(), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total*100)
two_pt <- arrange(two_pt, desc(perc_made))
two_pt

overall_pt <- summarise(group_by(filter(data, shot_type == "2PT Field Goal" | shot_type == "3PT Field Goal"), name), total = n(), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total*100)
overall_pt <- arrange(overall_pt, desc(perc_made))
overall_pt

image <- knitr::include_graphics("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/images/gsw-shot-charts.png")
image
```
```{r}
three_pt

two_pt

overall_pt
```


**Data Analysis**
We will refer to the first table, three_pt, as Figure 1. Figure 1 indicates 3-point field goal effective shooting percentage by player. Figure 1 shows that Klay Thompson is the most effective 3-point shooter on the Golden State Warriors, followed by Stephen Curry, Kevin Durant, Andre Iguodala, and Draymond Green.

We will refer to the second table, two_pt, as Figure 2. Figure 2 indicates 2-point field goal effective shooting percentage by player. Figure 2 shows that Andre Iguodala is the most effective 2-point shooter on the Golden State Warriors, followed by Kevin Durant, Stephen Curry, Klay Thompson, and Draymond Green.

The third and final table, overall_pt, will be referred to as Figure 3. Figure 3 indicates overall field goal effective shooting percentage by player. Figure 3 shows that Kevin Durant is the most effective overall shooter on the Golden State Warriors, followed by Andre Iguodala, Klay Thompson, Stephen Curry, and Draymond Green.

**Images**
```{r, echo=FALSE}
image <- knitr::include_graphics("/Users/yousufhusain/Documents/Stat 133/Workout/Workout 1/images/gsw-shot-charts.png")
```
```{r}
image
```

**Images Analysis**
We will refer to the image as Figure 4. Figure 4 highlights several points. First, Andre Iguodala and Draymond Green have much more focused play styles than the other Golden State Warriors players. Both Iguodala and Green specialize as "3 and D" players, meaning that they focus on attempting 3-point field goals or close-range field goals. This is evident in how the vast majority of their shots are concentrated either beyond the 3-point arc or very close to the basket. In contrast, the other players - Kevin Durant, Klay Thompson, and Stephen Curry - are much more flexible in the way they play. All three players attempt a mix of 3-point field goals, mid-range field goals, and field goals close to the basket. Stephen Curry clearly prefers the 3-point line, unsurprisingly, but he also fares well in the mid-range area. 

**Discussion**
Ultimately, the data does not explain everything. The data fails to account for other factors that contribute to the value of a player. For example, though Stephen Curry is not statistically the most effective 3-point shooter, he is known to very clutch, catch momentum quickly, and take abnormally far shots. Furthermore, Curry has made a greater number of shots. 

Elsewhere, it appears that Andre Iguodala is the most effective 2-point shooter. This is somewhat misleading, given that he attempts the fewest number of shots. This is because Iguodala is a highly specialized player who plays a role as a defensive stalwart. As such, he is able to boast a higher field goal percentage as he only mostly takes shots very close to the rim.

However, regardless of the data's mistakes, it is apparent that the Golden State Warriors are extremely talented. All of the featured players shoot above 30% for 3-point shots, above 40% for 2-point shots, and above 40% both of the shots. Furthermore, with the trio of Curry, Thompson, and Durant, the team is attempting and completing an extremely large number of 3-point shots. 

**Conclusion**
In conclusion, the Golden State Warriors are a very talented team. Its main stars - Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry - are shooting extremely well, above normal NBA statistical averages. All of the players are shooting above 30% for 3-point shots and above 40% for 2-point shots, and all of the players play a variety of roles on the court as evident by the image. Though the data is missing some factors, such as clutchness, basketball IQ, and defensive acumen, the team still appears to be on the verge of winning another championship this year. 

**References**
The article references NBA shooting data which was obtained from a professor at the University of California, Berkeley.




