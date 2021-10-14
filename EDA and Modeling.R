#Import the neccessary libraries that I will need
library(dplyr)
library(tidyverse)
library(ggplot2)

#Import the 3 cleaned datasets from Python
PlayListCleaned <- read.csv("/Users/drewbrinda/Desktop/Practicum I/PlayListCleaned.csv")
PlayerTrackCleaned <- read.csv("/Users/drewbrinda/Desktop/Practicum I/PlayTrackCleaned.csv")
InjuryRecordCleaned <- read.csv("/Users/drewbrinda/Desktop/Practicum I/InjuryRecord.csv")

#Start Exploratory Analysis

#Check number of rows in each dataset
nrow(PlayListCleaned)
nrow(PlayerTrackCleaned)
nrow(InjuryRecordCleaned)

#Check each dataset dimension
dim(PlayListCleaned)
dim(PlayerTrackCleaned)
dim(InjuryRecordCleaned)

#Check the first five rows
head(PlayListCleaned)
head(PlayerTrackCleaned)
head(InjuryRecordCleaned)

#Check the datatypes of each field
sapply(PlayListCleaned, class)
sapply(PlayerTrackCleaned, class)
sapply(InjuryRecordCleaned, class)

#Get a summary of each dataset for all the fields and values
summary(PlayListCleaned)
summary(PlayTrackCleaned)
summary(InjuryRecordCleaned)

#Join two datasets together
joined_datasets<-inner_join(InjuryRecordCleaned, PlayListCleaned)
joined_datasets2<-inner_join(InjuryRecordCleaned, PlayerTrackCleaned)
table(joined_datasets$PlayType)

#Change the No temp value to NA for injuries
joined_datasets_remove_na <- gsub('No Temp', 'NA',joined_datasets$Temp)

#Examining the body parts field
table(InjuryRecordCleaned$BodyPart)
count_body_parts<- data.frame(table(unlist(tolower(InjuryRecordCleaned$BodyPart),"")))
mean(count_body_parts$Freq, na.rm = TRUE)


#Start Data vizualizations of variable relationships

#Plotting Variable relationships against Injuries

#Body Part Plot
InjuryPlot <-ggplot(data=InjuryRecordCleaned,aes(BodyPart)) + geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Body Part")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
InjuryPlot

#Position Injuries Plot
PositionInjuryPlot <-ggplot(data=joined_datasets,aes(PositionGroup)) + 
+geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Position")+ 
theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
PositionInjuryPlot

#Field Type Injuries Plot
FieldInjuryPlot <-ggplot(data=joined_datasets,aes(FieldType)) + geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Field Type")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
FieldInjuryPlot

#Weather by Injuries Plot
WeatherInjuryPlot <-ggplot(data=joined_datasets,aes(Weather)) + geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Weather Type")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
WeatherInjuryPlot

#Play Type by Injuries Plot
PlayInjuryPlot <-ggplot(data=joined_datasets,aes(PlayType)) + geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Play Type")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))+ scale_x_discrete(label=abbreviate)
PlayInjuryPlot

#Stadium Type by Injuries Plot
StadiumInjuryPlot <-ggplot(data=joined_datasets,aes(StadiumType)) + geom_bar(colour="blue", fill="#DD8888")+ggtitle("Injuries by Stadium Type")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
StadiumInjuryPlot

#Number of Games by Injuries Scatter Plot 
GameInjuryPlot <-ggplot(data=joined_datasets,aes(x=PlayerDay, y=PlayerGame)) + geom_point(colour="blue", fill="#DD8888")
+ggtitle("Injuries by Game Number")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue"))
GameInjuryPlot


#Number of Games by Injuries Scatter Plot with Trend Line
GameInjuryPlotTrend <-ggplot(data=joined_datasets,aes(x=PlayerDay, y=PlayerGame)) + geom_point(colour="blue", fill="#DD8888")
+ggtitle("Injuries by Game Number Trend")+ 
  theme(plot.title = element_text(color = "red", size = 14, face= "bold", hjust = 0.5), 
        axis.title.x = element_text(color="blue"),axis.title.y = element_text(color="blue")) + geom_smooth()

GameInjuryPlotTrend


#Model linear regressions, Compare variables against Surface 
Model_Injury_Game <- lm(joined_datasets$PlayerGamePlay ~ joined_datasets$PlayerGame,data = joined_datasets)

SurfaceType <- as.numeric(joined_datasets$Surface) #2 = Sythetic and 1= Natural


