package aspects;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import main.Main;
import tetris.Board;

/**
 * The HighScoreAspect is adding a new feature to the game. it create a database of the high scores in the game with
 * the players names. after each game it check if a new high score was made and change the table according to it.
 *
 */
public privileged aspect HighScoreAspect {
	
	/**
	 * This pointcut is when the newPiece function is called
	 * @param board - the current board
	 */
	pointcut endGamePointCut(Board board): call(void newPiece()) && this(board);
	
	/**
	 * This pointcut is when the initialize function is called
	 */
	pointcut createRecords() : call(void initialize());
	
	/**
	 * This advice is calling the createRecords pointcut and will start before initialize function will end its run
	 */
	before() : createRecords() {
		Map<Integer, String> tmap;
		try {
			tmap = readFromFile();
			printRecords(tmap);	
		} catch (IOException e) {
			System.out.println("could not print current records");
		}	
	}
	 /**
	  * This advice is calling the endGamePointCut pointcut and will start after newPiece function will end its run
	  * @param board - the current board
	  */
	after(Board board): endGamePointCut(board) {
		if (!board.isStarted) {
			try{
				Map<Integer, String> tmap = readFromFile();
				tmap.put(board.numLinesRemoved, Main.txtName.getText());
				writeToFile(tmap);
				printRecords(tmap);
			} catch (IOException e) {
			   System.out.println("could not save record");
			}
		}
	}
	
	/**
	 * This function read the current record from the highScores.txt file
	 * @return a Map of the records, when the key is the record and the value is the player name
	 * @throws IOException
	 */
	private Map<Integer, String> readFromFile() throws IOException{
		Map<Integer, String> map = new TreeMap<Integer, String>(Collections.reverseOrder());
		if (new File("highScores.txt").isFile()) {
			 BufferedReader in = new BufferedReader(new FileReader("highScores.txt"));
	        String line = "";
	        while ((line = in.readLine()) != null) {
	            String parts[] = line.split("\t");
	            int partOneAsInt = Integer.parseInt(parts[1]);
	            map.put(partOneAsInt, parts[0]);
	        }
	        in.close();
		}
       
        return map;
	}
	/**
	 * This function takes the given map and write the record to the highScores.txt file
	 * @param tmap - the current records
	 * @throws IOException
	 */
	private void writeToFile(Map<Integer, String> tmap) throws IOException{
		PrintWriter writer = new PrintWriter("highScores.txt");
		Set set = tmap.entrySet();
		Iterator iterator = set.iterator();
		int i = 0;
		while(iterator.hasNext() && i <= 10) {
			Map.Entry mentry = (Map.Entry)iterator.next();
		    writer.println(mentry.getValue() +"\t"+ mentry.getKey());
			i++;
		}
		writer.close();
	}
	
	/**
	 * This function prints the record to the GUI screen we created
	 * @param tmap - the current records
	 */
	private void printRecords(Map<Integer, String> tmap) {
		Set set = tmap.entrySet();
		Iterator iterator = set.iterator();
		int i = 0;
		while(iterator.hasNext() && i <= 5) {
			Map.Entry mentry = (Map.Entry)iterator.next();
			if (i == 0) {
				Main.lblRecord1.setText(mentry.getValue() +"    "+ mentry.getKey());
			}
		    if (i ==1) {
		    	Main.lblRecord2.setText(mentry.getValue() +"    "+ mentry.getKey());
		    }
		    if (i == 2) {
		    	 Main.lblRecord3.setText(mentry.getValue() +"    "+ mentry.getKey());
		    }
		    if (i == 3) {
		    	 Main.lblRecord4.setText(mentry.getValue() +"    "+ mentry.getKey());
		    }
		    if (i == 4) {
		    	 Main.lblRecord5.setText(mentry.getValue() +"    "+ mentry.getKey());
		    }   
			i++;
		}
	}
	

}