boolean strike=false;
int startX=0, startY=150, endX=0, endY=150;
void setup()
{
  size(500,600);
  background(48, 51, 56);
  endY=600;
  frameRate(60);
}
void draw()
{
  clearScreen();
  if (strike)
  {
    lightningStrike();
  }
}
void lightningStrike(startX,startY)
{
  
  strike=false;
}
void clearScreen()
{
  noStroke();
  fill(48,51,56);
  rect(0,0,500,600);
}
void mousePressed()
{
  strike=true;
}

