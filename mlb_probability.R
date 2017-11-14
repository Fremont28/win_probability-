#importing game to game data for the 2016 MLB season
d = read.table("GL2016.txt",
               sep=",",
               fill=FALSE,
               strip.white=TRUE)

# Assiging an outcome for the home team (1-win,0-loss)
homeWin<-subset(d,home_score>visit_score)
homeWin$Win<-1
homeLose<-subset(d,visit_score>home_score)
homeLose$Win<-0

#binding the two dataframes
final2016<-rbind(homeWin,homeLose)

#subset the dataframe 
final2016X<-subset(final2016,select=c(name_Startingvisit_pitcher,name_Startinghome_pitcher,Home_team,Visit_team,Win))

#merge ELO and pitcher ratings into one dataframe
eloTeam<-read.csv(file.choose(),header=TRUE)
eloPitcher<-read.csv(file.choose(),header=TRUE)

# rename columns
colnames(eloPitcher)[colnames(eloPitcher)=="name_Startingvisit_pitcher"] <- "name_Startinghome_pitcher"

#visitor team 
eloVisitor<-read.csv(file.choose(),header=TRUE)
merge1<-cbind(eloVisitor,eloPitcher,by="name_Startingvisit_pitcher")

# home team 
eloHome<-read.csv(file.choose(),header=TRUE)
merge2<-merge(eloHome,eloPitcher,by="name_Startinghome_pitcher")

#merge the home and visitor team dataframes
merge3<-merge(merge1,merge2,by="X")
winProb<-subset(merge3,select=c(2,3,4,19,20,21,22,37,5))

# build a logistic regression model (probability that the home team wins)
modelWin<-glm(Win~name_Startingvisit_pitcher+name_Startinghome_pitcher+Home_team+Visit_team,family=binomial,data=merge3)
summary(modelWin)

#predicting the probability that the home team wins
final1$Prob<-predict(modelWin,merge3, type="response")
