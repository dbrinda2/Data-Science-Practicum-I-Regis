# Data-Science-Practicum-I-Regis
An Analysis of NFL Injuries by Drew Brinda at Regis. 

Full Video Presentation link on youtube is at: https://www.youtube.com/watch?v=5xBQwTlmLr8

## Goal
The problem I am trying to assess is examining the effects that playing on synthetic turf versus natural turf can have on player movements and the factors that may contribute to lower extremity injuries. I will be comparing different factors like part of the body that was injured, number of days out with injury, roster position of injured player, stadium type, temperature, and weather. 

## Datasets
The datasets I will be using are from Kaggle by the National Football League. There are these 3 different datasets:

Injury Record Dataset: Contains information on 105 lower-limb injuries that occurred during regular season games over two seasons on a team. 

Play List Dataset: Details about the game and play include the player’s assigned roster position, stadium type, field type, weather, play type, position for the play, and position group.

Player Track Dataset: Player level data that describes the location, orientation, speed, and direction of each player 

## Data Cleaning
Used Python for the data cleaning aspect of this project. Went through each of my 3 datasets to clean the fields and values.

Example: Combining similar values for a specific weather type for a game. Changing Outdoors to Outdoor value as well as other misspellings in the dataset. 

Before:

![Snip20211014_1](https://user-images.githubusercontent.com/92532095/137372011-79cfa29a-93a1-4534-91f0-46ff5209d889.png)


After:


![Snip20211014_2](https://user-images.githubusercontent.com/92532095/137372217-a92d76e1-e117-4696-b97a-1a3b005bc5f0.png)

Same with Weather. Before:


![Snip20211014_3](https://user-images.githubusercontent.com/92532095/137372381-5a2f76ee-8da1-4d59-9989-611186f16483.png)

After:

![Snip20211014_4](https://user-images.githubusercontent.com/92532095/137372427-29be1b6d-b28a-4f9e-8906-818ad8a8916b.png)


## Exploratory Data Analysis

Below is some of the R code that I did orginally to analyze my datasets before starting to model. 

![Snip20211014_5](https://user-images.githubusercontent.com/92532095/137372798-4e3ccd2d-97f3-45e6-ac14-bb9ff6cdc7f2.png)

![Snip20211014_6](https://user-images.githubusercontent.com/92532095/137372828-8a9cdee2-5bd4-4fd0-ac7d-df3153e24053.png)

## Data Vizualizations

Below are some of the main graphs that I produced comparing all the variables to injuries to see the major trends. The rest of them will be found and discussed in my final video link.

![Snip20211007_1](https://user-images.githubusercontent.com/92532095/137373077-d8be8a96-7fe9-47c4-a2b7-912efbe71a31.png)

![Snip20211007_2](https://user-images.githubusercontent.com/92532095/137373114-98d97cca-52b5-43e1-bdac-e22f83deb58c.png)

![Snip20211007_3](https://user-images.githubusercontent.com/92532095/137373241-b4117998-2865-4d13-9694-998353712402.png)

## File Structure in Repository

PythonCleaning.ipynb : Python source code of full cleaning file of 3 datasets that I worked with.

EDA and Modeling.R : R source code of exploratory data analysis and modeling/plots of variable relationships.

Drew Final Video .pptx: Powerpoint Presentation of final video slides.

