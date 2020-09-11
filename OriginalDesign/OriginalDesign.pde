int frams;
void setup()
{
  size(500,1000);
  background(#111111);
  frameRate(60);
}
void draw()
{
  fill(11,11,11);
  stroke(255,255,255);
  rect(0,0,frams*10,100);
  frams++;
  if (frams>500)
  {
    frams=0;
  }
}



