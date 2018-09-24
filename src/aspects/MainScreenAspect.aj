package aspects;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import main.Main;
import tetris.Tetris;


/** 
 * The MainScreenAspect is creating a new GUI screen, it allows the user to see the "King of the game" table, to choose
 * the difficulty and colors of the game. It also prints instructions for the game. 
 *
 */
public privileged aspect MainScreenAspect {
	/**
	 * This pointcut is when the main function is called
	 * @param arg - the program arguments
	 */
	pointcut mainExecution(String[] arg) : 
		execution(public static void main(String[])) && args(arg);
	
	/**
	 * This advice is around the mainExecution pointcut
	 * @param arg - the program arguments
	 */
	void around(String[] arg) : mainExecution(arg) {
		Main mainGame = new Main();
		System.out.println("Welcome to the tetris game!");
		System.out.println("Don't know how to play? press here - http://www.wikihow.com/Play-Tetris");
		System.out.println("Good to know - if you press the C key and you have more then 5 point it will clear your"
				+ " screen (but it will cost you 5 points)!");
		System.out.println("Don't forget to choose a color!");
		System.out.println("Single - for one color , Multi - color for each shape, Random - is a suprise!");
		System.out.println("Please enter your name in the screen in front of you");
		System.out.println("Great! let's start!");
		
		mainGame.runMe();
		
		
	}

}
