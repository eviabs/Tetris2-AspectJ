package aspects;

import tetris.Shape;

import javax.swing.Timer;

import tetris.Board;

public privileged aspect GameFlowAspect {

	/**
	 * This pointcut is called when the numLinesRemoved sets to a new value.
	 * @param board - the current board
	 */
	pointcut gameFlow(Board board) : set(int Board.numLinesRemoved) && target(board);
	
	/**
	 * The advice controls the shapes and speed of the game.
	 * @param board
	 */
	void around(Board board): gameFlow(board) {

		//  the new value
        int numLinesRemovedNewValue = ((Integer)thisJoinPoint.getArgs()[0]).intValue();
        
		if (numLinesRemovedNewValue <= 3)  {
			Shape.NUM_OF_SHAPES = 7;
		}
		
		if (numLinesRemovedNewValue >= 4 && numLinesRemovedNewValue <= 7)  {
			Shape.NUM_OF_SHAPES = 8;
		}

		if (numLinesRemovedNewValue >= 8 && numLinesRemovedNewValue <= 11)  {
			Shape.NUM_OF_SHAPES = 9;
		}
		
		if (numLinesRemovedNewValue >= 12 && numLinesRemovedNewValue <= 15)  {
			Shape.NUM_OF_SHAPES = 10;
			System.out.println("bhehehehdhchcc");
			board.timer.setDelay(board.times[1]);
			board.timer.start(); 
		}
		
		if (numLinesRemovedNewValue >= 16 && numLinesRemovedNewValue <= 19)  {
			Shape.NUM_OF_SHAPES = 11;
			board.timer.setDelay(board.times[2]);
			board.timer.start(); 
		}
		proceed(board);
	}
}
