# Tetris2-AspectJ
![bg](https://user-images.githubusercontent.com/14614396/45985598-a2cc4900-c06f-11e8-9d8c-09d7d9c37df5.jpg)

This is a new version of the well-known game *Tetris*, enhanced with the power of AspectJ.

Original game's source code can be found [here](https://www.ssaurel.com/blog/learn-to-create-a-tetris-game-in-java-with-swing/).


## What's AspectJ?
[AspectJ](https://en.wikipedia.org/wiki/AspectJ) is an aspect-oriented programming (AOP) extension created at PARC for the Java programming language. It enables clean modularization of crosscutting concerns, such as error checking and handling, synchronization, context-sensitive behavior, performance optimizations, monitoring and logging, debugging support, and multi-object protocols

## Why Aspects?
AOP gives us the power to modify existing code with ease, and add new functiomality without toutcing the source code itself.

We wanted to play around with the AOP concept, and built this project just to get to know with the AspectJ. 


## How to install? (Using windowns and IntelliJ)
1) Download AspectJ [installation jar file](http://www.eclipse.org/aspectj/downloads.php).
2) Install jar (double click on the downloaded jar, and follow the installer's instructions).
3) Download the source code and open in as a project using IntelliJ (Ultimate version is required!)
4) In IntelliJ, enable AspectJ and add AspectJ to your project using these [instructions](https://www.jetbrains.com/help/idea/enabling-aspectj-support-plugins.html)
5) Run the project.


## What did we change in the game?
- [Color Aspect](https://github.com/eviabs/Tetris2-AspectJ/blob/master/src/aspects/ColorAspect.aj) - Changes the color of the Tetris tiles according to the user's perefernces.
- [Difficulty Aspect](https://github.com/eviabs/Tetris2-AspectJ/blob/master/src/aspects/DifficultyAspect.aj) - Changes the speed of the Tetris tiles according to the user's perefernces.
- [High Score Aspect](https://github.com/eviabs/Tetris2-AspectJ/blob/master/src/aspects/HighScoreAspect.aj) - Manages an "high score" list.
-	[Status Bar Aspect](https://github.com/eviabs/Tetris2-AspectJ/blob/master/src/aspects/StatusBarAspect.aj) - Display useful information for the player during game play.
- [SaveMe Aspect](https://github.com/eviabs/Tetris2-AspectJ/blob/master/src/aspects/SaveMeAspect.aj) - Let the player clean the board in dangerous situations.

**All of these changes are Aspects, which means that none of them was entered to the source code!**


## Demos
![records](https://user-images.githubusercontent.com/14614396/45986702-d1e5b900-c075-11e8-9b2d-ceea3696004e.png)

![1](https://user-images.githubusercontent.com/14614396/45986703-d1e5b900-c075-11e8-8c54-8066cdbdd5e4.gif)
![2](https://user-images.githubusercontent.com/14614396/45986701-d14d2280-c075-11e8-9ef5-eb8096e56dfb.gif)
![3](https://user-images.githubusercontent.com/14614396/45986927-3bb29280-c077-11e8-9cda-75ee83dc101f.gif)



## Authers
- Nitzan Wertheizer 
- [Evyatar Ben-Shitrit](https://github.com/eviabs)

