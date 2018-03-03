#Learning a classifier and outputting the effective ratings to Batsmen and Bowlers in the scraped International Player Dataset


#Learning a classifier for International Batsmen Data

#Import the International Batsmen dataset that was scraped
InternationalPlayerData <- InternationalBatsmen

#Removing the Country Codes at the end of each player names so that when we join this with the IPL dataset we have the same value
InternationalPlayerData$Player <- gsub("\\s*\\([^\\]+\\)","",as.character(InternationalPlayerData$Player))

#Convert the required attributes to numeric to ease the computation
InternationalPlayerData$Ave <- as.numeric(InternationalPlayerData$Ave)
InternationalPlayerData$SR <- as.numeric(InternationalPlayerData$SR)

#Constraints to consider for Batsmen, Average and Strike-rate
Subset1<-subset(InternationalPlayerData, (InternationalPlayerData$Ave>0 & InternationalPlayerData$Mat>10))
Subset1$Ave <- as.numeric(Subset1$Ave)

Subset2<-subset(InternationalPlayerData, (InternationalPlayerData$SR>0 & InternationalPlayerData$Mat>11))
Subset2$SR <- as.numeric(Subset2$SR)

valueDifference <- max(Subset1$Ave) - min(Subset1$Ave)
valueDifference2 <- max(Subset2$SR) - min(Subset2$SR)
InternationalPlayerData["PointsFromAverage"] <- NA
InternationalPlayerData["PointsFromSR"] <- NA

#Applying the classfier for constraint Average
for (i in 1:nrow(InternationalPlayerData)) {
  if(is.na(InternationalPlayerData[i,9])==TRUE | InternationalPlayerData[i,9]==0) {
    InternationalPlayerData$PointsFromAverage[i] <- 0
  }
  else{
  if(InternationalPlayerData[i,9] <= 0.10 *valueDifference){
    InternationalPlayerData$PointsFromAverage[i] <- 1
  }
  else if(InternationalPlayerData[i,9]> 0.10 *valueDifference & InternationalPlayerData[i,9] <= 0.20 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 2
  }
  else if(InternationalPlayerData[i,9]> 0.20 *valueDifference & InternationalPlayerData[i,9] <= 0.30 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 3
  }
  else if(InternationalPlayerData[i,9]> 0.30 *valueDifference & InternationalPlayerData[i,9] <= 0.40 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 4
  }
  else if(InternationalPlayerData[i,9]> 0.40 *valueDifference & InternationalPlayerData[i,9] <= 0.50 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 5
  }
  else if(InternationalPlayerData[i,9]> 0.50 *valueDifference & InternationalPlayerData[i,9] <= 0.60 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 6
  }
  else if(InternationalPlayerData[i,9]> 0.60 *valueDifference & InternationalPlayerData[i,9] <= 0.70 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 7
  }
  else if(InternationalPlayerData[i,9]> 0.70 *valueDifference & InternationalPlayerData[i,9] <= 0.80 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 8
  }
  else if(InternationalPlayerData[i,9]> 0.80 *valueDifference & InternationalPlayerData[i,9] <= 0.90 *valueDifference) {
    InternationalPlayerData$PointsFromAverage[i] <- 9
  }
  else {
    InternationalPlayerData$PointsFromAverage[i] <- 10
  }
    
  }
}

for (i in 1:nrow(InternationalPlayerData)){
   if(is.na(InternationalPlayerData[i,9])==FALSE & InternationalPlayerData[i,4]<=10 & InternationalPlayerData[i,9]!=0){
     InternationalPlayerData$PointsFromAverage[i] <- 1
   }
}


#Applying the classfier for constraint Strike-rate
for (i in 1:nrow(InternationalPlayerData)) {
  if(is.na(InternationalPlayerData[i,11])==TRUE | InternationalPlayerData[i,11]==0) {
    InternationalPlayerData$PointsFromSR[i] <- 0
  }
  else{
    if(InternationalPlayerData[i,11] <= 0.20 *valueDifference2){
      InternationalPlayerData$PointsFromSR[i] <- 1
    }
    else if(InternationalPlayerData[i,11]> 0.20 *valueDifference2 & InternationalPlayerData[i,11] <= 0.40 *valueDifference2) {
      InternationalPlayerData$PointsFromSR[i] <- 2
    }
    else if(InternationalPlayerData[i,11]> 0.40 *valueDifference2 & InternationalPlayerData[i,11] <= 0.60 *valueDifference2) {
      InternationalPlayerData$PointsFromSR[i] <- 3
    }
    else if(InternationalPlayerData[i,11]> 0.60 *valueDifference2 & InternationalPlayerData[i,11] <= 0.80 *valueDifference2) {
      InternationalPlayerData$PointsFromSR[i] <- 4
    }
    else {
      InternationalPlayerData$PointsFromSR[i] <- 5
    }
  }
}

for (i in 1:nrow(InternationalPlayerData)){
  if(is.na(InternationalPlayerData[i,11])==FALSE & InternationalPlayerData[i,4]<=11 & InternationalPlayerData[i,11]!=0){
    InternationalPlayerData$PointsFromSR[i] <- 1
  }
}

#Outputting the rating for each Batsmen based on the constraints mentioned
InternationalPlayerData["InternationalBatsmenRating"] <- NA
for (i in 1:nrow(InternationalPlayerData)){
  InternationalPlayerData[i,20] <- ((2*InternationalPlayerData[i,18]+InternationalPlayerData[i,19])/5)
}


InternationalBatsmenTable <- InternationalPlayerData[,c(2,20)]
write.csv(InternationalBatsmenTable, "D:/InternationalBatsmenTable.csv")


#Learning a classifier for International Bowlers Data

#Import the International Bowlers dataset that was scraped
InternationalBowlerData <- InternationalBowlers

#Removing the Country Codes at the end of each player names so that when we join this with the IPL dataset we have the same value
InternationalBowlerData$Player <- gsub("\\s*\\([^\\]+\\)","",as.character(InternationalBowlerData$Player))

#Convert the required attributes to numeric to ease the computation
InternationalBowlerData$Wkts <- as.numeric(InternationalBowlerData$Wkts)
InternationalBowlerData$Econ <- as.numeric(InternationalBowlerData$Econ)
InternationalBowlerData$Overs <- as.numeric(InternationalBowlerData$Overs)

InternationalBowlerData["WicketsPerMatch"] <- NA

for (i in 1:nrow(InternationalBowlerData)) {
  if(is.na(InternationalBowlerData[i,9])==FALSE) {
    InternationalBowlerData[i,17] <- (InternationalBowlerData[i,9]/InternationalBowlerData[i,4])
  }
}

#Constraints to consider for Bowlers, Wickets per match & Economy
Subset3<-subset(InternationalBowlerData, InternationalBowlerData$WicketsPerMatch>0 & InternationalBowlerData$Mat>11)
Subset3$WicketsPerMatch <- as.numeric(Subset3$WicketsPerMatch)

Subset4<-subset(InternationalBowlerData, (InternationalBowlerData$Econ>0 & InternationalBowlerData$Mat>11 & InternationalBowlerData$Overs>20))
Subset4$Econ <- as.numeric(Subset4$Econ)

valueDifference3 <- max(Subset3$WicketsPerMatch) - min(Subset3$WicketsPerMatch)
valueDifference4 <- max(Subset4$Econ) - min(Subset4$Econ)
InternationalBowlerData["PointsFromWicketsPerMatch"] <- NA
InternationalBowlerData["PointsFromEcon"] <- NA

#Applying the classfier for constraint Wickets per match
for (i in 1:nrow(InternationalBowlerData)) {
  if(is.na(InternationalBowlerData[i,17])==TRUE | InternationalBowlerData[i,17]==0) {
    InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 0
  }
  else{
    if(InternationalBowlerData[i,17] <= 0.10 *valueDifference3){
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 1
    }
    else if(InternationalBowlerData[i,17]> 0.10 *valueDifference3 & InternationalBowlerData[i,17] <= 0.20 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 2
    }
    else if(InternationalBowlerData[i,17]> 0.20 *valueDifference3 & InternationalBowlerData[i,17] <= 0.30 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 3
    }
    else if(InternationalBowlerData[i,17]> 0.30 *valueDifference3 & InternationalBowlerData[i,17] <= 0.40 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 4
    }
    else if(InternationalBowlerData[i,17]> 0.40 *valueDifference3 & InternationalBowlerData[i,17] <= 0.50 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 5
    }
    else if(InternationalBowlerData[i,17]> 0.50 *valueDifference3 & InternationalBowlerData[i,17] <= 0.60 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 6
    }
    else if(InternationalBowlerData[i,17]> 0.60 *valueDifference3 & InternationalBowlerData[i,17] <= 0.70 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 7
    }
    else if(InternationalBowlerData[i,17]> 0.70 *valueDifference3 & InternationalBowlerData[i,17] <= 0.80 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 8
    }
    else if(InternationalBowlerData[i,17]> 0.80 *valueDifference3 & InternationalBowlerData[i,17] <= 0.90 *valueDifference3) {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 9
    }
    else {
      InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 10
    }
    
  }
}

for (i in 1:nrow(InternationalBowlerData)){
  if(is.na(InternationalBowlerData[i,17])==FALSE & InternationalBowlerData[i,4]<=11 & (InternationalBowlerData[i,17])!=0){
    InternationalBowlerData$PointsFromWicketsPerMatch[i] <- 1
  }
}

#Applying the classfier for constraint Economy
for (i in 1:nrow(InternationalBowlerData)) {
  if(is.na(InternationalBowlerData[i,12])==TRUE || InternationalBowlerData[i,12]==0) {
    InternationalBowlerData$PointsFromEcon[i] <- 0
  }
  else{
    if(InternationalBowlerData[i,6]<20){
      InternationalBowlerData$PointsFromEcon[i] <- 1
    }
    else {
    if(InternationalBowlerData[i,12] <= min(Subset4$Econ) + 0.20 *valueDifference4){
      InternationalBowlerData$PointsFromEcon[i] <- 5
    }
    else if(InternationalBowlerData[i,12]> min(Subset4$Econ) + 0.20 *valueDifference4 & InternationalBowlerData[i,12] <= min(Subset4$Econ) + 0.40 *valueDifference4) {
      InternationalBowlerData$PointsFromEcon[i] <- 4
    }
    else if(InternationalBowlerData[i,12]> min(Subset4$Econ) + 0.40 *valueDifference4 & InternationalBowlerData[i,12] <= min(Subset4$Econ) + 0.60 *valueDifference4) {
      InternationalBowlerData$PointsFromEcon[i] <- 3
    }
    else if(InternationalBowlerData[i,12]> min(Subset4$Econ) + 0.60 *valueDifference4 & InternationalBowlerData[i,12] <= min(Subset4$Econ) + 0.80 *valueDifference4) {
      InternationalBowlerData$PointsFromEcon[i] <- 2
    }
    else if (InternationalBowlerData[i,12]> min(Subset4$Econ) + 0.80 *valueDifference4 & InternationalBowlerData[i,12] <= min(Subset4$Econ) + 1.00 *valueDifference4){
      InternationalBowlerData$PointsFromEcon[i] <- 1
    }
    }
  }
}

for (i in 1:nrow(InternationalBowlerData)){
  if(is.na(InternationalBowlerData[i,12])==FALSE & InternationalBowlerData[i,4]<=11 & InternationalBowlerData[i,12]!=0 & InternationalBowlers[i,6]<20){
    InternationalBowlerData$PointsFromEcon[i] <- 1
  }
}

#Outputting the rating for each Bowler based on the constraints mentioned
InternationalBowlerData["InternationalBowlersRating"] <- NA
for (i in 1:nrow(InternationalBowlerData)){
  InternationalBowlerData[i,20] <- ((2*InternationalBowlerData[i,18]+InternationalBowlerData[i,19])/5)
}


InternationalBowlersTable <- InternationalBowlerData[,c(2,20)]
write.csv(InternationalBowlersTable, "D:/InternationalBowlersTable.csv")
