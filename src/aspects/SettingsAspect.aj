package aspects;

import tetris.Tetris;
import aspects.DifficultyAspect;
import main.Main;
import aspects.ColorAspect;

/**
 * This aspect controls the Settings of the game.
 * The aspect recognize changes in the Setting panel, and updates the 
 * other aspects.
 */
public privileged aspect SettingsAspect {

   /**
    * This poincut recognizes when a new Tetris game is started.
    */
	pointcut applySettings() : call(void Tetris.startNewGame());
	
	/**
	 * Every time we start a new game, we apply the setting that were set in the main
     * window.
	 */
	void around() : applySettings() {
		
		// Apply Difficulty
		if (Main.rdbtnEasy.isSelected()) {
			DifficultyAspect.difficulty = DifficultyAspect.Difficulties.Easy;
		} else if (Main.rdbtnNormal.isSelected()) {
			DifficultyAspect.difficulty = DifficultyAspect.Difficulties.Normal;
		} else {
			DifficultyAspect.difficulty = DifficultyAspect.Difficulties.Hard;
		}
		
		// Apply Colors Mode
		if (Main.rdbtnOneColor.isSelected()) {
			ColorAspect.colorsMode = ColorAspect.ColorsMode.Single;
		} else if (Main.rdbtnMultiColor.isSelected()) {
			ColorAspect.colorsMode = ColorAspect.ColorsMode.Multi;
		} else {
			ColorAspect.colorsMode = ColorAspect.ColorsMode.Random;
		}
				
		proceed();
	}
}
