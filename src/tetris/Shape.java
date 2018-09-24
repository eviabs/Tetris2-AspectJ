package tetris;

import java.util.Random;
import java.awt.Color;
import java.lang.Math;


public class Shape {

    public static enum Tetrominoes 
    { 
       NoShape,
       SquareShape, 
       ZShape, 
       SShape, 
       LineShape, 
       TShape, 
       LShape, 
       MirroredLShape, 
       DotShape, 
       CornerShape, 
       DoubleShape 
   }; 
   
    public static int[][][] coordsTable = new int[][][] {
       { { 0, 0 },   { 0, 0 },   { 0, 0 },   { 0, 0 } },
       { { 0, 0 },   { 1, 0 },   { 0, 1 },   { 1, 1 } },       // SquareShape
       { { 0, -1 },  { 0, 0 },   { -1, 0 },  { -1, 1 } },      // ZShape
       { { 0, -1 },  { 0, 0 },   { 1, 0 },   { 1, 1 } },       // SShape
       { { 0, -1 },  { 0, 0 },   { 0, 1 },   { 0, 2 } },       // LineShape
       { { -1, 0 },  { 0, 0 },   { 1, 0 },   { 0, 1 } },       // TShape
       { { -1, -1 }, { 0, -1 },  { 0, 0 },   { 0, 1 } },       // LShape
       { { 1, -1 },  { 0, -1 },  { 0, 0 },   { 0, 1 } },       // MirroredLShape
       { { 0, 0 },  { 0, 0 },   { 0, 0 },  { 0, 0 } },         // DotShape
       { { 0, 0 },  { 0, 1 },   { -1, 0 },  { 0, 0 } },         // CornerShape
       { { 0, 0 },  { 2, 1 },   { 0, 1 },  { 2, 0 } }         // DoubleShape
   };           
    public static int NUM_OF_SHAPES = Tetrominoes.values().length;
    private Tetrominoes pieceShape;
    private int coords[][];
    

    public static Color colors[] = 
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
    
    public Shape() {

        coords = new int[4][2];
        setShape(Tetrominoes.NoShape);

    }

    public void setShape(Tetrominoes shape) {

        for (int i = 0; i < 4 ; i++) {
            for (int j = 0; j < 2; ++j) {
                coords[i][j] = coordsTable[shape.ordinal()][i][j];
            }
        }
        pieceShape = shape;

    }

    private void setX(int index, int x) { coords[index][0] = x; }
    private void setY(int index, int y) { coords[index][1] = y; }
    public int x(int index) { return coords[index][0]; }
    public int y(int index) { return coords[index][1]; }
    public Tetrominoes getShape()  { return pieceShape; }

    public void setRandomShape()
    {
        Random r = new Random();
        int x = Math.abs(r.nextInt()) % (NUM_OF_SHAPES - 1) + 1;
        Tetrominoes[] values = Tetrominoes.values(); 
        setShape(values[x]);
        
    }

    public int minX()
    {
      int m = coords[0][0];
      for (int i=0; i < 4; i++) {
          m = Math.min(m, coords[i][0]);
      }
      return m;
    }

    public int minY() 
    {
      int m = coords[0][1];
      for (int i=0; i < 4; i++) {
          m = Math.min(m, coords[i][1]);
      }
      return m;
    }

    public Shape rotateLeft() 
    {
        if (pieceShape == Tetrominoes.SquareShape)
            return this;

        Shape result = new Shape();
        result.pieceShape = pieceShape;

        for (int i = 0; i < 4; ++i) {
            result.setX(i, y(i));
            result.setY(i, -x(i));
        }
        return result;
    }

    public Shape rotateRight()
    {
        if (pieceShape == Tetrominoes.SquareShape)
            return this;

        Shape result = new Shape();
        result.pieceShape = pieceShape;

        for (int i = 0; i < 4; ++i) {
            result.setX(i, -y(i));
            result.setY(i, x(i));
        }
        return result;
    }
}