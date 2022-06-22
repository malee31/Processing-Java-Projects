final int sizeLimit=1;
final int initSize = 400;
final float scaleFactor = 0.1;
int pause=0, count=0;
void setup()
{
	background(0,0,0);
	noStroke();
	size(500,500);
	frameRate(2);
}

void draw()
{
	//fractalSpark();
	reset();
	start();
}

void reset()
{
	fill(0);
	rect(0, 0, width, height);
}

void start()
{
	fractalize(250, 250, initSize);
}

void fractalize(double startX, double startY, double startSize)
{
	if(startSize < 1) return;
	hollowBox((int)startX, (int)startY, (int)startSize);
	fractalize(startX + startSize / 2, startY + startSize / 2, startSize / 2);
	fractalize(startX - startSize / 2, startY + startSize / 2, startSize / 2);
	fractalize(startX + startSize / 2, startY - startSize / 2, startSize / 2);
	fractalize(startX - startSize / 2, startY - startSize / 2, startSize / 2);
}

public void hollowBox(int x, int y, int sizee)
{
	fill(randomColor());
	rect(x - sizee / 2, y - sizee / 2, sizee, sizee * scaleFactor);
	rect(x - sizee / 2,y + sizee / 2 - sizee * scaleFactor, sizee, sizee * scaleFactor);
	rect(x - sizee / 2, y - sizee / 2, sizee * scaleFactor, sizee);
	rect(x + sizee / 2 - sizee * scaleFactor, y - sizee / 2, sizee * scaleFactor, sizee);
}

public int randomColor()
{
	return color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
}