library(ggplot2)
library(plotly)


#Import Final datasets for Batsmen and Bowlers with ratings
data1 <- read_csv("Z:/IPL/final1/part-00000-5f222092-0c29-489f-ac64-224bd7014889-c000.csv")

playerset <- ggplot(data1, aes(x = runs, y = Wickets, color=Country)) +
  geom_point(aes(text = paste("Player:",Player_Name, '<br>', "DOB:", DOB, '<br>', "Batting Hand:", Batting_Hand, '<br>', "Bowling Style:", Bowling_Skill, '<br>',"Match:", Match)))
graph1 <- ggplotly(playerset)
graph1

#Plot for Bowlers Rating
bowl <- ggplot(data1, aes(x = Match, y = Wickets, color=Country, size=BowlersRating)) +
  geom_point(aes(text = paste("Player:",Player_Name, '<br>', "Bowling Style:", Bowling_Skill, '<br>', "Wickets per Match:", Wicket_per)))
graph2 <- ggplotly(bowl)
graph2

#Plot for Batsmen Rating
bat <- ggplot(data1, aes(x = Match, y = runs, color=Country, size=BatsmenRating)) +
  geom_point(aes(text = paste("Player:",Player_Name, '<br>', "Batting Hand:", Batting_Hand, '<br>', "Avg:", Avg)))
graph3 <- ggplotly(bat)
graph3
