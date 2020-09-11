int frams;
void setup()
{
  size(500,1000);
  background(#101010);
  frameRate(60);
}
void draw()
{
  fill(11,11,11);
  stroke(255,255,255);
  rect(0,0,frams,100);
  frams=frams*10;
  if (frams>500)
  {
    frams=0;
    fill(16,16,16);
    rect(0,0,500,1000);
  }
}



