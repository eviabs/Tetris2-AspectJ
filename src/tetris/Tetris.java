package tetris;

import java.awt.BorderLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;


public class Tetris extends JFrame {

    public static JLabel statusbar;


    public Tetris() {

        statusbar = new JLabel(" 0");
        add(statusbar, BorderLayout.SOUTH);
        Board board = new Board(this);
        add(board);
        board.startTimer();
        board.start();

        setSize(200, 400);
        setTitle("Game");
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
   }

   public JLabel getStatusBar() {
       return statusbar;
   }
   
   public static void main(String[] args) {

       Tetris game = new Tetris();
       game.setLocationRelativeTo(null);
       game.setVisible(true);

   } 
    public static void startNewGame() {

        Tetris game = new Tetris();
        game.setLocationRelativeTo(null);
        game.setVisible(true);

    } 
}