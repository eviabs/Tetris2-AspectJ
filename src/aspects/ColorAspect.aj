package aspects;

import java.awt.Color;
import java.awt.Graphics;
import java.util.Arrays;
import java.util.Collections;
import java.util.Random;
import tetris.Board;
import tetris.Shape;
import tetris.Tetris;

/**
 * This aspect controls the colors of the shapes.
 * Every change of colors should be handled by the aspect, and 
 * not in the game itself.
 */
public privileged aspect ColorAspect {

	/**
	 * Available color modes
	 */
	public static enum ColorsMode  
    { 
       Single,
       Multi,
       Random
   }; 
   
	/**
	 * The current game's color mode
	 */   
   public static ColorsMode colorsMode;
   
   /**
    * List of all available colors ion the game.
    */
   public static final Color[] availableColors = 
   	{ 
		   new Color(0, 0, 0), 
		   new Color(204, 102, 102), 
           new Color(102, 204, 102), 
           new Color(102, 102, 204), 
           new Color(204, 204, 102), 
           new Color(204, 102, 204), 
           new Color(102, 204, 204), 
           new Color(218, 170, 0), 
           new Color(52, 55, 61), 
           new Color(228, 125, 31),
           new Color(198, 209, 232)
   	};

   /*
    * The single color 
    */
   private Color currentColor = getRandomColor();
   
   /*
    * Returns a random color, based on the available colors.
    */
   private Color getRandomColor() {
	   int randomIndex = new Random().nextInt(availableColors.length);
	   return availableColors[randomIndex];
   }
   
   /*
    * Creates an array of randomized colors.
    * 
    * @returns A randomized array of colors
    */
   private Color[] getRandomizedColorArray() {
	   Color[] shuffled = availableColors;
	   Collections.shuffle(Arrays.asList(shuffled));
	   return shuffled;
   }
   
   /*
    * Creates an array of the same color.
    * 
    * @return A an array of the same color.
    */   
   private Color[] getSingleColorArray() {
	   Color[] single = new Color[availableColors.length];
	   Arrays.fill(single, currentColor);
	   return single;
   }
   
   /**
    * Every time the "setColors" method is called, we need to decide which color to use.
    * 
    * @param board the board of the game
    * @param g the graphics object
    * @param x the x coord
    * @param y the y coord
    * @param shape the shape we want to set its color
    */
	pointcut setColors(Board board, Graphics g, int x, int y, Shape.Tetrominoes shape) :  
		call (void *.*drawSquare(Graphics, int, int, Shape.Tetrominoes)) 
			&& target(board) &&  args(g, x ,y ,shape);
	
	/**
	 * The before advice handles this decision, by reading the "colorsMode" value.
	 * This way we know what colors the game should be using.
	 * We change the board's colors array.
	 * 
    * @param board the board of the game
    * @param g the graphics object
    * @param x the x coord
    * @param y the y coord
    * @param shape the shape we want to set its color
	 */
	before(Board board, Graphics g, int x, int y, Shape.Tetrominoes shape) : setColors(board, g, x ,y ,shape) { 
		
		if (colorsMode == ColorsMode.Single) {
			Shape.colors = getSingleColorArray();
			
		}else if(colorsMode == ColorsMode.Random) {		
			Shape.colors = getRandomizedColorArray();
			
		} else {
			Shape.colors = availableColors;
		}
	}  
   
	/**
	 * Every time a new game is created, we need to set a new single color.
	 */
	pointcut changeColorSettings() : call(void Tetris.startNewGame());
	
	/**
	 * The around advice sets a new single color.
	 */
	void around() : changeColorSettings() {
		currentColor = getRandomColor();	
		proceed();
	}   
}
