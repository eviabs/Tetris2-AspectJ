# Tetris2-AspectJ
![bg](https://user-images.githubusercontent.com/14614396/45985598-a2cc4900-c06f-11e8-9d8c-09d7d9c37df5.jpg)

This is a new version of the well-known game *Tetris*, enhanced with the power of AspectJ.

Original game's source code can be found [here](https://www.ssaurel.com/blog/learn-to-create-a-tetris-game-in-java-with-swing/)


## What's AspectJ?
[AspectJ](https://en.wikipedia.org/wiki/AspectJ) is an aspect-oriented programming (AOP) extension created at PARC for the Java programming language. It enables clean modularization of crosscutting concerns, such as error checking and handling, synchronization, context-sensitive behavior, performance optimizations, monitoring and logging, debugging support, and multi-object protocols

## Why Aspects?
AOP gives us the power to modify existing code with ease, and add new functiomality without toutcing the source code itself.

We wanted to play around with Aspects, and built this project just to get to know with the AOP concept. 


## How to install? (Using windowns and IntelliJ)
1) Download AspectJ [installation jar file](http://www.eclipse.org/aspectj/downloads.php).
2) Install jar (double click on the downloaded jar, and follow the installer's instructions).
3) Download the source code and open in as a project using IntelliJ (Ultimate version is required!)
4) In IntelliJ, enable AspectJ and add AspectJ to your project using these [instructions](https://www.jetbrains.com/help/idea/enabling-aspectj-support-plugins.html)
5) Run the project.


## What did we change in the game?
- Color Aspect - Changes the color of the Tetris tiles according to the user's perefernces.
- Difficulty Aspect - Changes the speed of the Tetris tiles according to the user's perefernces.
- High Score Aspect - Manages an "high score" list.
-	Status Bar Aspect - Display useful information for the player during game play.
- SaveMe Aspect - Let the player clean the board in dangerous situations.
**All of these changes are Aspects, which means that none of them was entered to the source code!**

## Demos


## Authers
Nitzan Wertheizer and [Evyatar Ben-Shitrit](https://github.com/eviabs)

