class Star
{
	int x,y;
  public Star()
  {
  	x=(int)(Math.random()*990+5);
  	y=(int)(Math.random()*990+5);
  }
  public void show()
  {
  	stroke(0,0,0);
  	fill(200,200,200);
  	ellipse(x,y,5,5);
  }
}
