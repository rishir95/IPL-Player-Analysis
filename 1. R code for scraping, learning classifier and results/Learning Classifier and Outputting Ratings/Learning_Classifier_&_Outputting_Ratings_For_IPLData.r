#Learning a classifier and outputting the effective ratings to Batsmen and Bowlers in the scraped IPL Player Dataset

#Import the dataset from Scala
temp <- part_00000_2a5e95ab_ae34_429c_aad6_bce6998244b5_c000


batsmenMinMaxDifference <- (max(temp[,9])-min(temp[,9]))

temp["BatsmenRating"] <- NA
temp["BowlersRating"] <- NA

#Applying classifier on IPL Batsmen rating and outputting the ratings
for (i in 1:nrow(temp)) {
  if(temp[i,9] <= 0.20 *batsmenMinMaxDifference){
     temp$BatsmenRating[i] <- 1
}
else if(temp[i,9]> 0.20 *batsmenMinMaxDifference & temp[i,9] <= 0.40 *batsmenMinMaxDifference) {
  temp$BatsmenRating[i] <- 2
}
else if(temp[i,9]> 0.40 *batsmenMinMaxDifference & temp[i,9] <= 0.60 *batsmenMinMaxDifference) {
  temp$BatsmenRating[i] <- 3
}
else if(temp[i,9]> 0.60 *batsmenMinMaxDifference & temp[i,9] <= 0.80 *batsmenMinMaxDifference) {
  temp$BatsmenRating[i] <- 4
}
else{
  temp$BatsmenRating[i] <- 5
}
}

bowlersMinMaxDifference <- (max(temp[,10])-min(temp[,10]))

#Applying classifier on IPL Bowlers rating and outputting the ratings
for (i in 1:nrow(temp)) {
  if(temp[i,10] <= 0.20 *bowlersMinMaxDifference){
    temp$BowlersRating[i] <- 1
  }
  else if(temp[i,10]> 0.20 *bowlersMinMaxDifference & temp[i,10] <= 0.40 *bowlersMinMaxDifference) {
    temp$BowlersRating[i] <- 2
  }
  else if(temp[i,10]> 0.40 *bowlersMinMaxDifference & temp[i,10] <= 0.60 *bowlersMinMaxDifference) {
    temp$BowlersRating[i] <- 3
  }
  else if(temp[i,10]> 0.60 *bowlersMinMaxDifference & temp[i,10] <= 0.80 *bowlersMinMaxDifference) {
    temp$BowlersRating[i] <- 4
  }
  else{
    temp$BowlersRating[i] <- 5
  }
}

write.csv(temp, "D:/IPLFinal.csv")
