package aspects;

import java.awt.event.KeyEvent;
import tetris.Board;

/**
 * The saveMeAspect is adding a new game feature that gives the player an option to clear the board in the
 * middle of the game.
 * The penalty for using this option is 5 points, and the player can only use it if he has more then 5 points and by
 * pressing the "C" key.
 * saveMeAspect is in charge of checking if the player has enough points, if the key "C" is pressed, and if so it clears the board.
 *
 */

public privileged aspect SaveMeAspect {
	
	boolean needMorePoints = true;
	
	/**
	 * This pointcut is when the manageKeys function is called
	 * @param e - the key event
	 * @param board - the current board
	 */
	pointcut clearKey(KeyEvent e, Board board): call(void Board.manageKeys(KeyEvent, Board)) && args(e, board);
	
	/** 
	 * This advice is calling the clearKey pointcut and will start before we call the manageKeys function
	 * @param e - the key event
	 * @param board - the current board
	 */
	before (KeyEvent e, Board board): clearKey(e, board){
		 int keycode = e.getKeyCode();

         if (keycode == 'C' || keycode == 'c') {
        	 if (board.numLinesRemoved >= 5) {
        		 needMorePoints = false;
        		 board.clearBoard();
        		 board.numLinesRemoved = board.numLinesRemoved - 5;
        		 board.statusbar.setText(String.valueOf(board.numLinesRemoved));
        	 }
        	 else {
        		 needMorePoints = true;
        	 }
             return;
         }
		
	}


}
