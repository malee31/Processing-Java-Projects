int strike=0;
int startX=0, startY=150, endX=0, endY=150;
void setup()
{
  size(500,600);
  background(48, 51, 56);
  strokeWeight(5);
  frameRate(60);
}
void draw()
{
  clearScreen();
  while (strike>0)
  {
    lightningStrike();
    strike--;
  }
}
void lightningStrike()
{
  stroke(rand(0,255),rand(0,255),rand(0,255));
  startX=rand(0,9);
  startY=rand(-9,9);
  while (startX<=600)
  {
    endX=rand(0,9);
    endY=rand(-9,9);
    line(startX,startY,endX,endY);
    startX=endX;
    startY=endY;
    print("Done");
  }
}
int rand(int min,int max)
{
  return (int)((Math.random()*(max-min+1))+min);
}
void clearScreen()
{
  noStroke();
  fill(48,51,56);
  rect(0,0,500,600);
}
void mousePressed()
{
  strike++;
  startX=0;
  startY=150;
  endX=0;
  endY=150;
  print("clicked"+strike);
}