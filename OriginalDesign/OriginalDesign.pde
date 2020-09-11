int frams;
void setup()
{
  size(500,750);
  background(#101010);
  frameRate(60);
}
void draw()
{
  fill(16,16,16);
  stroke(16,16,16);
  rect(0,0,500,750);
  fill(200,200,200);
  ellipse(250-frams/2,375,50,50);
  stroke(255,255,255);
  frams+=10;
  if (frams>1000)
  {
    frams=0;
  }
}
