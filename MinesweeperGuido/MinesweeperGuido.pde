import de.bezier.guido.*;
private final int NUM_ROWS = 25;
private final int NUM_COLS = 25;
private final int NUM_MINES = (int)((float)NUM_COLS*NUM_ROWS*0.2);
private final int BG_COLOR=color(127, 127, 127);
private MSButton[][] buttons;
private int SCREEN_SIZE=750;
private ArrayList <MSButton> mines; //ArrayList of just the minesweeper buttons that are mined
private boolean firstMove;
private int end;
private String message;

public void keyPressed()
{
	if(key=='.')
	{
		reinit();
		setMines();
		mineCountAll();
	}
}

void reinit()
{
	//initializes or reinitializes variables
	firstMove=true;
	end=0;
	message="";
	mines=new ArrayList <MSButton>();
	buttons = new MSButton[NUM_ROWS][NUM_COLS];
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int ii=0; ii<NUM_COLS; ii++)
		{
			buttons[i][ii]=new MSButton(i, ii);
		}
	}
}

void setup ()
{
	//sets up canvas and initializes mines and buttons
	size(750, 750);
	textAlign(CENTER,CENTER);
	background(BG_COLOR);
	// makes the manager... whatever that is
	Interactive.make(this);
	reinit();
	setMines();
	mineCountAll();
}

public void draw()
{
	//draws mines on screen and tests whether the player has won or lost before stopping
	background(BG_COLOR);
	if(isWon()||isLost())
	{
		if(isLost())
		{
			revealAll();
		}
		displayMessage();
	}
}

public void revealAll()
{
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int ii=0; ii<NUM_COLS; ii++)
		{
			buttons[i][ii].clickHandler();
		}
	}
}

public void setMines()
{
	//Randomly sets it up so that we get a percentage of the board as mines or whatver NUM_MINES is
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
	// If all areas are either clicked or is a mine, you win!
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int ii=0; ii<NUM_COLS; ii++)
		{
			if(buttons[i][ii].isClicked()==mines.contains(buttons[i][ii]))
			{
				return false;
			}
		}
	}
	message="You Win!";
	return true;
}

public boolean isLost()
{
	//returns true if the player has clicked a mine
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int ii=0; ii<NUM_COLS; ii++)
		{
			if(mines.contains(buttons[i][ii])&&buttons[i][ii].isClicked())
			{
				message="You Lost";
				return true;
			}
		}
	}
	return false;
}

public void displayMessage()
{
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int a=0; a<message.length(); a++)
		{
			buttons[i][a].setLabel("" + message.charAt(a));
		}
		if(NUM_COLS>=message.length()*2)
		{
			for(int b=0; b<message.length(); b++)
			{
				buttons[i][b+NUM_COLS-message.length()].setLabel("" + message.charAt(b));
			}
		}
	}
}

public boolean isValid(int r, int c)
{
	return r<buttons.length && r>=0 && c<buttons[0].length && c>=0;
}

public int countMines(int row, int col)
{
	//counts mines surrounding a cell
	int numMines = 0;
	for(int i=0; i<3; i++)
	{
		for(int ii=0; ii<3; ii++)
		{
			if(row-1+i>=buttons.length||row-1+i<0||col-1+ii>=buttons[0].length||col-1+ii<0||(i==1&&ii==1)) continue;
			if(mines.contains(buttons[row-1+i][col-1+ii]))
			{
				numMines++;
			}
		}
	}
	return numMines;
}

public void mineCountAll()
{
	for(int i=0; i<NUM_ROWS; i++)
	{
		for(int ii=0; ii<NUM_COLS; ii++)
		{
			buttons[i][ii].setLabel(countMines(i, ii));
		}
	}
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
		fill(100);
		if (flagged)
		{
			fill(0);
		}
		else if(clicked)
		{
			if(mines.contains(this))
			{
				fill(255,0,0);
			}
			else{
				fill(200);
			}
		}
		rect(x, y, width, height);
		if(this.isClicked()&&!myLabel.equals("0"))
		{
			fill(0);
			text(myLabel, x+width/2, y+height/2);
		}
	}
	// called by manager automatically
	public void mousePressed() 
	{
		if(mouseButton==RIGHT&&!clicked) flagged=!flagged;
		if(flagged||clicked||mouseButton==RIGHT) return;
		clickHandler();
	}
	public void clickHandler()
	{
		clicked=true;
		if(firstMove)
		{
			firstMove=!firstMove;
			for(int i=0; i<mines.size(); i++)
			{
				if(mines.get(i).equals(this))
				{
					mines.remove(i);
					mineCountAll();
					break;
				}
			}
		}
		if(myLabel.equals("0"))
		{
			//Clicks on all buttons around this one if there are no bombs around it
			for(int i=0; i<3; i++)
			{
				for(int ii=0; ii<3; ii++)
				{
					if(isValid(myRow-1+i, myCol-1+ii))
					{
						buttons[myRow-1+i][myCol-1+ii].mousePressed();
					}
				}
			}
		}
	}
	public void setLabel(String newLabel){myLabel = newLabel;}
	public void setLabel(int newLabel){myLabel = ""+ newLabel;}
	public boolean isClicked(){return clicked;}
	public boolean isFlagged(){return flagged;}
}
