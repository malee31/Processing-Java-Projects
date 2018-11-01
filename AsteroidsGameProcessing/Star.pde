class Star
{
	int x,y;
  public Star()
  {
  	x=(int)(Math.random()*980+10);
  	y=(int)(Math.random()*980+10);
  }
  public void show()
  {
  	stroke(0,0,0);
  	fill(200,200,200);
  	ellipse(x,y,10,10);
  }
}
