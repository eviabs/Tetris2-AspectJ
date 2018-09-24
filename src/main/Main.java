package main;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.BorderLayout;
import java.awt.FlowLayout;
import javax.swing.border.BevelBorder;
import javax.swing.border.CompoundBorder;
import javax.swing.border.LineBorder;
import java.awt.Color;
import javax.swing.border.SoftBevelBorder;
import javax.swing.border.TitledBorder;

import tetris.Tetris;

import javax.swing.UIManager;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import javax.swing.JCheckBox;
import javax.swing.JTextField;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.BoxLayout;
import java.awt.GridLayout;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;

public class Main {

	/* UI JFrame */
	private JFrame frmTetris;
	
	/* Difficulty Button Group */
	private final ButtonGroup buttonGroupDiff = new ButtonGroup();
	
	/* Color Button Group */
	private final ButtonGroup buttonGroupColor = new ButtonGroup();

	/* Record Labels */
	public static JLabel lblRecord1 = new JLabel("-");
	public static JLabel lblRecord2 = new JLabel("-");
	public static JLabel lblRecord3 = new JLabel("-");
	public static JLabel lblRecord4 = new JLabel("-");
	public static JLabel lblRecord5 = new JLabel("-");
	
	/* Player Name Text */
	public static JTextField txtName = new JTextField();
	
	/* Difficulty Radio Buttons */
	public static JRadioButton rdbtnEasy = new JRadioButton("Easy");
	public static JRadioButton rdbtnNormal = new JRadioButton("Normal");
	public static JRadioButton rdbtnHard = new JRadioButton("Hard");

	/* Difficulty Radio Buttons */
	public static JRadioButton rdbtnOneColor = new JRadioButton("Single");
	public static JRadioButton rdbtnMultiColor = new JRadioButton("Multi");
	public static JRadioButton rdbtnRandomColor = new JRadioButton("Random");	
	
	/**
	 * Launch the application.
	 */
	public void runMe() {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Main window = new Main();
					window.frmTetris.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/***
	 * Create the application.
	 */
	public Main() {
		initialize();
	}

	/*
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTetris = new JFrame();
		frmTetris.setTitle("Tetris2");
		frmTetris.setBounds(100, 100, 338, 437);
		frmTetris.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmTetris.getContentPane().setLayout(null);
		
		JPanel panel_records = new JPanel();
		panel_records.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "Records", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		panel_records.setBounds(10, 11, 302, 219);
		frmTetris.getContentPane().add(panel_records);
		panel_records.setLayout(new GridLayout(5, 1, 0, 0));
		
		lblRecord1.setHorizontalAlignment(SwingConstants.CENTER);
		panel_records.add(lblRecord1);
		lblRecord1.setFont(new Font("Tahoma", Font.PLAIN, 18));
		
		lblRecord2.setHorizontalAlignment(SwingConstants.CENTER);
		lblRecord2.setFont(new Font("Tahoma", Font.PLAIN, 18));
		panel_records.add(lblRecord2);
				
		lblRecord3.setHorizontalAlignment(SwingConstants.CENTER);
		lblRecord3.setFont(new Font("Tahoma", Font.PLAIN, 18));
		panel_records.add(lblRecord3);
		
		lblRecord4.setHorizontalAlignment(SwingConstants.CENTER);
		lblRecord4.setFont(new Font("Tahoma", Font.PLAIN, 18));
		panel_records.add(lblRecord4);
		
		lblRecord5.setHorizontalAlignment(SwingConstants.CENTER);
		lblRecord5.setFont(new Font("Tahoma", Font.PLAIN, 18));
		panel_records.add(lblRecord5);
		
		JPanel panel_nw_game = new JPanel();
		panel_nw_game.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "New Game", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		panel_nw_game.setBounds(10, 241, 302, 148);
		frmTetris.getContentPane().add(panel_nw_game);
		panel_nw_game.setLayout(null);
		
		JButton btnStart = new JButton("START NEW GAME");
		btnStart.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				Tetris.startNewGame();
			}
		});
		btnStart.setBounds(10, 117, 282, 23);
		panel_nw_game.add(btnStart);
		
		txtName.setText("Player1");
		txtName.setBounds(76, 28, 216, 23);
		panel_nw_game.add(txtName);
		txtName.setColumns(10);
		
		JLabel lblName = new JLabel("Name:");
		lblName.setBounds(10, 28, 46, 14);
		panel_nw_game.add(lblName);

		JLabel lblDifficulty = new JLabel("Difficulty:");
		lblDifficulty.setBounds(10, 58, 65, 14);
		panel_nw_game.add(lblDifficulty);
		
		buttonGroupDiff.add(rdbtnEasy);
		rdbtnEasy.setSelected(true);
		rdbtnEasy.setBounds(76, 58, 65, 23);
		panel_nw_game.add(rdbtnEasy);
		
		buttonGroupDiff.add(rdbtnNormal);
		rdbtnNormal.setSelected(false);
		rdbtnNormal.setBounds(138, 58, 73, 23);
		panel_nw_game.add(rdbtnNormal);
		
		buttonGroupDiff.add(rdbtnHard);
		rdbtnHard.setSelected(false);
		rdbtnHard.setBounds(208, 58, 73, 23);
		panel_nw_game.add(rdbtnHard);
		
		JLabel lblColors = new JLabel("Colors:");
		lblColors.setBounds(10, 88, 65, 14);
		panel_nw_game.add(lblColors);
		
		
		buttonGroupColor.add(rdbtnOneColor);
		rdbtnOneColor.setSelected(false);
		rdbtnOneColor.setBounds(76, 88, 65, 23);
		panel_nw_game.add(rdbtnOneColor);
		
		buttonGroupColor.add(rdbtnMultiColor);
		rdbtnMultiColor.setSelected(true);
		rdbtnMultiColor.setBounds(138, 88, 73, 23);
		panel_nw_game.add(rdbtnMultiColor);
		
		buttonGroupColor.add(rdbtnRandomColor);
		rdbtnRandomColor.setSelected(false);
		rdbtnRandomColor.setBounds(207, 88, 89, 23);
		panel_nw_game.add(rdbtnRandomColor);
		
	}
}
