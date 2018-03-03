#Data Scraping of International and IPL Datasets

#Scraping of International Player Data

library("cricketr")
library("XML")
library("RCurl")
i<-1
batsmenURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",i,";template=results;type=batting",sep="")
batsmenHTMLTable <-readHTMLTable(batsmenURL, stringsAsFactors = F)
batsmenTable <- batsmenHTMLTable$"Overall figures"
for (i in 2:22)
{
  
  batsmenURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",i,";template=results;type=batting",sep="")
  try(batsmenHTMLTable <-readHTMLTable(batsmenURL, stringsAsFactors = F))
  try(batsmenDataPage <- batsmenHTMLTable$"Overall figures")
  try(batsmenTable<-rbind(batsmenTable,batsmenDataPage))
}
write.csv(batsmenTable,file="D:\\InternationalBatsmen.csv")


j<-1
bowlersURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",j,";template=results;type=bowling",sep="")
bowlersHTMLTable <-readHTMLTable(bowlersURL, stringsAsFactors = F)
bowlersTable <- bowlersHTMLTable$"Overall figures"
for (j in 2:22)
{
  
  bowlersURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",j,";template=results;type=bowling",sep="")
  try(bowlersHTMLTable <-readHTMLTable(bowlersURL, stringsAsFactors = F))
  try(bowlersDataPage <- bowlersHTMLTable$"Overall figures")
  try(bowlersTable<-rbind(bowlersTable,bowlersDataPage))
}
write.csv(bowlersTable,file="D:\\InternationalBowlers.csv")


k<-1
allroundersURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",k,";template=results;type=allround",sep="")
allroundersHTMLTable <-readHTMLTable(allroundersURL, stringsAsFactors = F)
allroundersTable <- allroundersHTMLTable$"Overall figures"
for (k in 2:22)
{
  
  allroundersURL<-paste("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=3;page=",k,";template=results;type=allround",sep="")
  try(allroundersHTMLTable <-readHTMLTable(allroundersURL, stringsAsFactors = F))
  try(allroundersDataPage <- allroundersHTMLTable$"Overall figures")
  try(allroundersTable<-rbind(allroundersTable,allroundersDataPage))
}
write.csv(allroundersTable,file="D:\\InternationalAllrounders.csv")




#Scraping of IPL Team Data

#IPL Teams: Chennai Super Kings, Deccan Chargers, Delhi Daredevils, Gujarat Lions, Kings XI Punjab, Kochi Tuskers Kerala, Kolkata Knight Riders, Mumbai Indians, Pune Warriors, Rajasthan Royals, Rising Pune Supergiant, Royal Challengers Bangalore, Sunrisers Hyderabad

#IPL Team Batsmen Data

#Chennai Super Kings
cskBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4343;type=trophy",sep="")
cskBatsmenHTMLTable <-readHTMLTable(cskBatsmenURL, stringsAsFactors = F)
cskBatsmenTable <- cskBatsmenHTMLTable$"Batting averages"
write.csv(cskBatsmenTable,file="D:\\IPLCSKBatting.csv")

#Deccan Chargers
dcBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4347;type=trophy",sep="")
dcBatsmenHTMLTable <-readHTMLTable(dcBatsmenURL, stringsAsFactors = F)
dcBatsmenTable <- dcBatsmenHTMLTable$"Batting averages"
write.csv(dcBatsmenTable,file="D:\\IPLDCBatting.csv")

#Delhi Daredevils
dddBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4344;type=trophy",sep="")
dddBatsmenHTMLTable <-readHTMLTable(dddBatsmenURL, stringsAsFactors = F)
dddBatsmenTable <- dddBatsmenHTMLTable$"Batting averages"
write.csv(dddBatsmenTable,file="D:\\IPLDDDBatting.csv")

#Gujarat Lions
glBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=5845;type=trophy",sep="")
glBatsmenHTMLTable <-readHTMLTable(glBatsmenURL, stringsAsFactors = F)
glBatsmenTable <- glBatsmenHTMLTable$"Batting averages"
write.csv(glBatsmenTable,file="D:\\IPLGLBatting.csv")

#Kings XI Punjab
kxpBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4342;type=trophy",sep="")
kxpBatsmenHTMLTable <-readHTMLTable(kxpBatsmenURL, stringsAsFactors = F)
kxpBatsmenTable <- kxpBatsmenHTMLTable$"Batting averages"
write.csv(kxpBatsmenTable,file="D:\\IPLKXPBatting.csv")

#Kochi Tuskers Kerala
ktkBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4788;type=trophy",sep="")
ktkBatsmenHTMLTable <-readHTMLTable(ktkBatsmenURL, stringsAsFactors = F)
ktkBatsmenTable <- ktkBatsmenHTMLTable$"Batting averages"
write.csv(ktkBatsmenTable,file="D:\\IPLKTKBatting.csv")

#Kolkata Knight Riders
kkrBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4341;type=trophy",sep="")
kkrBatsmenHTMLTable <-readHTMLTable(kkrBatsmenURL, stringsAsFactors = F)
kkrBatsmenTable <- kkrBatsmenHTMLTable$"Batting averages"
write.csv(kkrBatsmenTable,file="D:\\IPLKKRBatting.csv")

#Mumbai Indians
miBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4346;type=trophy",sep="")
miBatsmenHTMLTable <-readHTMLTable(miBatsmenURL, stringsAsFactors = F)
miBatsmenTable <- miBatsmenHTMLTable$"Batting averages"
write.csv(miBatsmenTable,file="D:\\IPLMIBatting.csv")

#Pune Warriors
pwBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4787;type=trophy",sep="")
pwBatsmenHTMLTable <-readHTMLTable(pwBatsmenURL, stringsAsFactors = F)
pwBatsmenTable <- pwBatsmenHTMLTable$"Batting averages"
write.csv(pwBatsmenTable,file="D:\\IPLPWBatting.csv")

#Rajasthan Royals
rrBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4345;type=trophy",sep="")
rrBatsmenHTMLTable <-readHTMLTable(rrBatsmenURL, stringsAsFactors = F)
rrBatsmenTable <- rrBatsmenHTMLTable$"Batting averages"
write.csv(rrBatsmenTable,file="D:\\IPLRRBatting.csv")

#Rising Pune Supergiant
rpsBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=5843;type=trophy",sep="")
rpsBatsmenHTMLTable <-readHTMLTable(rpsBatsmenURL, stringsAsFactors = F)
rpsBatsmenTable <- rpsBatsmenHTMLTable$"Batting averages"
write.csv(rpsBatsmenTable,file="D:\\IPLRPSBatting.csv")


#Royal Challengers Bangalore
rcbBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=4340;type=trophy",sep="")
rcbBatsmenHTMLTable <-readHTMLTable(rcbBatsmenURL, stringsAsFactors = F)
rcbBatsmenTable <- rcbBatsmenHTMLTable$"Batting averages"
write.csv(rcbBatsmenTable,file="D:\\IPLRCBBatting.csv")

#Sunrisers Hyderabad
srhBatsmenURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/batting.html?id=117;team=5143;type=trophy",sep="")
srhBatsmenHTMLTable <-readHTMLTable(srhBatsmenURL, stringsAsFactors = F)
srhBatsmenTable <- srhBatsmenHTMLTable$"Batting averages"
write.csv(srhBatsmenTable,file="D:\\IPLSRHBatting.csv")




#IPL Team Bowlers Data

#Chennai Super Kings
cskBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4343;type=trophy",sep="")
cskBowlersHTMLTable <-readHTMLTable(cskBowlersURL, stringsAsFactors = F)
cskBowlersTable <- cskBowlersHTMLTable$"Bowling averages"
write.csv(cskBowlersTable,file="D:\\IPLCSKBowling.csv")

#Deccan Chargers
dcBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4347;type=trophy",sep="")
dcBowlersHTMLTable <-readHTMLTable(dcBowlersURL, stringsAsFactors = F)
dcBowlersTable <- dcBowlersHTMLTable$"Bowling averages"
write.csv(dcBowlersTable,file="D:\\IPLDCBowling.csv")

#Delhi Daredevils
dddBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4344;type=trophy",sep="")
dddBowlersHTMLTable <-readHTMLTable(dddBowlersURL, stringsAsFactors = F)
dddBowlersTable <- dddBowlersHTMLTable$"Bowling averages"
write.csv(dddBowlersTable,file="D:\\IPLDDDBowling.csv")

#Gujarat Lions
glBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=5845;type=trophy",sep="")
glBowlersHTMLTable <-readHTMLTable(glBowlersURL, stringsAsFactors = F)
glBowlersTable <- glBowlersHTMLTable$"Bowling averages"
write.csv(glBowlersTable,file="D:\\IPLGLBowling.csv")

#Kings XI Punjab
kxpBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4342;type=trophy",sep="")
kxpBowlersHTMLTable <-readHTMLTable(kxpBowlersURL, stringsAsFactors = F)
kxpBowlersTable <- kxpBowlersHTMLTable$"Bowling averages"
write.csv(kxpBowlersTable,file="D:\\IPLKXPBowling.csv")

#Kochi Tuskers Kerala
ktkBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4788;type=trophy",sep="")
ktkBowlersHTMLTable <-readHTMLTable(ktkBowlersURL, stringsAsFactors = F)
ktkBowlersTable <- ktkBowlersHTMLTable$"Bowling averages"
write.csv(ktkBowlersTable,file="D:\\IPLKTKBowling.csv")

#Kolkata Knight Riders
kkrBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4341;type=trophy",sep="")
kkrBowlersHTMLTable <-readHTMLTable(kkrBowlersURL, stringsAsFactors = F)
kkrBowlersTable <- kkrBowlersHTMLTable$"Bowling averages"
write.csv(kkrBowlersTable,file="D:\\IPLKKRBowling.csv")

#Mumbai Indians
miBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4346;type=trophy",sep="")
miBowlersHTMLTable <-readHTMLTable(miBowlersURL, stringsAsFactors = F)
miBowlersTable <- miBowlersHTMLTable$"Bowling averages"
write.csv(miBowlersTable,file="D:\\IPLMIBowling.csv")

#Pune Warriors
pwBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4787;type=trophy",sep="")
pwBowlersHTMLTable <-readHTMLTable(pwBowlersURL, stringsAsFactors = F)
pwBowlersTable <- pwBowlersHTMLTable$"Bowling averages"
write.csv(pwBowlersTable,file="D:\\IPLPWBowling.csv")

#Rajasthan Royals
rrBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4345;type=trophy",sep="")
rrBowlersHTMLTable <-readHTMLTable(rrBowlersURL, stringsAsFactors = F)
rrBowlersTable <- rrBowlersHTMLTable$"Bowling averages"
write.csv(rrBowlersTable,file="D:\\IPLRRBowling.csv")

#Rising Pune Supergiant
rpsBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=5843;type=trophy",sep="")
rpsBowlersHTMLTable <-readHTMLTable(rpsBowlersURL, stringsAsFactors = F)
rpsBowlersTable <- rpsBowlersHTMLTable$"Bowling averages"
write.csv(rpsBowlersTable,file="D:\\IPLRPSBowling.csv")


#Royal Challengers Bangalore
rcbBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=4340;type=trophy",sep="")
rcbBowlersHTMLTable <-readHTMLTable(rcbBowlersURL, stringsAsFactors = F)
rcbBowlersTable <- rcbBowlersHTMLTable$"Bowling averages"
write.csv(rcbBowlersTable,file="D:\\IPLRCBBowling.csv")

#Sunrisers Hyderabad
srhBowlersURL<-paste("http://stats.espncricinfo.com/indian-premier-league-2013/engine/records/averages/bowling.html?id=117;team=5143;type=trophy",sep="")
srhBowlersHTMLTable <-readHTMLTable(srhBowlersURL, stringsAsFactors = F)
srhBowlersTable <- srhBowlersHTMLTable$"Bowling averages"
write.csv(srhBowlersTable,file="D:\\IPLSRHBowling.csv")



