package aspects;

import tetris.Board;

/**
 * This aspect controls the difficulty level of the game.
 * The difficulty affects the speed of the game.
 */
public privileged aspect DifficultyAspect {

	/**
	 * Available difficulties
	 */
    public static enum Difficulties  
    { 
       Easy,
       Normal,
       Hard
   }; 
   
	/**
	 * The game's difficulty
	 */   
   public static Difficulties difficulty;
   
	/**
	 * This poincut is called when the startTimer function of a Board object is called.
	 * 
     * @param board The board of the game.
     */
	pointcut setDifficulty(Board board) :  
		call (void Board.startTimer()) 
			&& target(board);

	/**
	 * The before advice sets the timers array according to the chosen difficulty.
	 * 
     * @param board
     */
	before(Board board) : setDifficulty(board) { 
		
		if (difficulty == Difficulties.Easy) {
			board.times = new int[]{400, 400, 400};
			
		}else if(difficulty == Difficulties.Normal) {		
			board.times = new int[]{400, 300, 200};
			
		} else {
			board.times = new int[]{200, 200, 200};
		}
	}  
}
