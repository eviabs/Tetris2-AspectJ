package aspects;


import tetris.Board;
import tetris.Tetris;

/**
 * The StatusBarAspect is in charge of the status bar in the lower part of the screen. it prints to the screen to 
 * inform the player about the game and the game flow changes.
 *
 */
public privileged aspect StatusBarAspect {
	
	/**
	 * This pointcut is called when the isPaused sets to a new value
	 * @param board - the current board
	 */
	pointcut onPause(Board board) : set(boolean Board.isPaused) && target(board); 
	
	/**
	 * This advice is calling the onPause pointcut and will start when isPaused changes
	 * @param board - the current board
	 */
	void around(Board board): onPause(board) {

        boolean isPaused = ((Boolean)thisJoinPoint.getArgs()[0]).booleanValue();
        if (isPaused) {
        	Tetris.statusbar.setText("Paused");
        }
		
		proceed(board);
	}
	
	/**
	 * This pointcut is called when the isGameOver sets to a new value
	 * @param board - the current board
	 */
	pointcut onGameOver(Board board) : set(boolean Board.isGameOver) && target(board); 
	
	/**
	 * This advice is calling the onGameOver pointcut and will start when isGameOver changes
	 * @param board
	 */
	void around(Board board): onGameOver(board) {

        boolean isGameOver = ((Boolean)thisJoinPoint.getArgs()[0]).booleanValue();
        if (isGameOver) {
        	Tetris.statusbar.setText("Game Over");
        }
		
		proceed(board);
	}
	
	/**
	 * This pointcut is called when the needMorePoints sets to a new value
	 * @param board - the current board
	 */
	pointcut onNoPoints(Board board) : set(boolean Board.needMorePoints) && target(board); 
	
	/**
	 * This advice is calling the onNoPoints pointcut and will start when needMorePoints changes
	 * @param board
	 */
	void around(Board board): onNoPoints(board) {

        boolean needMorePoints = ((Boolean)thisJoinPoint.getArgs()[0]).booleanValue();
        if (needMorePoints) {
        	Tetris.statusbar.setText("You need more points!");
        }
		
		proceed(board);
	}
}
