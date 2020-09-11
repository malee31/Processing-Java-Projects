int frams;
void setup()
{
  size(500,750);
  background(#ff1111);
  frameRate(60);
}
void draw()
{
  //clear all
  fill(#ff1111);
  stroke(16,16,16);
  rect(0,0,500,750);
  stroke(255,255,255);
  //begin drawing
  capsule(frams-45);
  // tube from 200-300
  fill(230,230,230,127);
  rect(175,-50,150,500,50);
  //frame counter and resetter
  frams+=10;
  if (frams>1500)
  {
    frams=0;
  }
}
void capsule(int y)
{
  boolean tooHigh=false;
  if (y>=700)
  {
    y=700;
    tooHigh=true;
  }
  fill(250,250,250);
  ellipse(225,y,100,100);
  fill(100,10,10);
  ellipse(275,y,100,100);
  rect(230,y-52.5,40,105);
  fill(200,200,200);
  stroke(200,200,200);
  fill(250,250,250);
  noStroke();
  rect(220,y-45,10,90);
  if (tooHigh)
  {
    textSize(18);
    text("Yeah... The capsule is glued shut...",100,450,900,500);
  }
}