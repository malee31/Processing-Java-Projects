int frams;
void setup()
{
  size(500,750);
  background(#ff1111);
  frameRate(60);
}
void draw()
{
  fill(#ff1111);
  stroke(16,16,16);
  rect(0,0,500,750);
  stroke(255,255,255);
  fill(200,200,200);
  ellipse(225,375,100,100);
  fill(100,10,10);
  ellipse(275,375,100,100);
  rect(230,322.5,40,105);
  fill(200,200,200);
  stroke(200,200,200);
  rect(220,330,10,90);
  frams+=10;
  if (frams>1000)
  {
    frams=0;
  }
}
