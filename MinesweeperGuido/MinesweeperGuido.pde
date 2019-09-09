import de.bezier.guido.*;
private final int NUM_ROWS = 5;
private final int NUM_COLS = 5;
private final int NUM_MINES = (int)((float)NUM_COLS*NUM_ROWS*0.3);
private MSButton[][] buttons;
private final int BG_COLOR=color(127, 127, 127);
private int SCREEN_SIZE = 400;
private ArrayList <MSButton> mines=new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    background(BG_COLOR);
    // make the manager
    Interactive.make( this );
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int i=0; i<NUM_ROWS; i++)
    {
        for(int ii=0; ii<NUM_COLS; ii++)
        {
            buttons[i][ii]=new MSButton(i, ii);
        }
    }
    setMines();
}

public void draw ()
{
    background(BG_COLOR);
    if(isWon() == true) displayWinningMessage();
}

public void setMines()
{
    //your code
    int randomCol;
    int randomRow;
    for(int i=0; i<NUM_MINES; i++)
    {
        randomRow=(int)(Math.random()*NUM_ROWS);
        randomCol=(int)(Math.random()*NUM_COLS);
        if(!mines.contains(buttons[randomRow][randomCol]))
        {
            mines.add(buttons[randomRow][randomCol]);
        }
        else
        {
            i--;
        }
    }
}

public boolean isWon()
{
    //your code here
    return false;
}

public void displayLosingMessage()
{
    //your code here
}

public void displayWinningMessage()
{
    //your code here
}

public boolean isValid(int r, int c)
{
    //your code here
    return false;
}

public int countMines(int row, int col)
{
    int numMines = 0;
    //your code here
    return numMines;
}

public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;

    public MSButton ( int row, int col )
    {
        width = SCREEN_SIZE/NUM_COLS;
        height = SCREEN_SIZE/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    
    public void draw () 
    {    
        if (flagged)
            fill(0);
        // else if( clicked && mines.contains(this) ) 
        //     fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }

    // called by manager
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }
    public void setLabel(String newLabel){myLabel = newLabel;}
    public void setLabel(int newLabel){myLabel = ""+ newLabel;}
    public boolean isFlagged(){return flagged;}
}
