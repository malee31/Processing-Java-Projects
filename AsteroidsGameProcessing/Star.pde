class Star
{
	//Color of stars and how long each is on screen before resetting
	private final static int FLASH_SPEED = 360, FILL_COLOR = 200;
	private int x, y, size, flashFrames;
	public Star()
	{
		reinit();
	}
	public void show()
	{
		noStroke();
		if(flashFrames<FLASH_SPEED/2)
		{
			 fill((int)(FILL_COLOR*flashFrames*2/FLASH_SPEED));
		}
		else
		{
			fill((int)(FILL_COLOR*(1-((flashFrames-FLASH_SPEED/2.0)*2/FLASH_SPEED))));
		}
		ellipse(x, y, size, size);
		flashFrames++;
		if(flashFrames == FLASH_SPEED)
		{
			reinit();
		}
	}
	private void reinit()
	{
		x = (int)(Math.random()*990+5);
		y = (int)(Math.random()*990+5);
		size = (int)(Math.random()*5+2);
		flashFrames = (int)(Math.random()*FLASH_SPEED);
	}
}
