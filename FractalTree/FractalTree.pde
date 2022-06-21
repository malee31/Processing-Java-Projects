float startSize = 300;
float sizeLimit = 1;
int counter = 1;
float wideScale = 9.0 / 10;
int startAngle = 0;
int angleChange = 15;
int startWideness = 200;

void setup()
{
  size(750, 750);
  frameRate(2);
  background(200);
  strokeWeight(3);
}

void draw()
{
  background(200);
  sticks(width / 2, height, startWideness, 0, counter, true);
  counter++;
}

void sticks(float x, float y, float wideness, float angle, int count, boolean positive)
{
  if(wideness <= sizeLimit)
  {
    return;
  }
  float xDif = (float)(wideness * Math.sin(radians(angle)));
  float yDif = (float)(wideness * Math.cos(radians(angle)));
  if(positive)
  {
    xDif *= -1;
  }
  stroke(0, 0, 0);
  line(x, y, x + xDif, y - yDif);
  line(x, y, x - xDif, y - yDif);
  count--;
  if(count > 0)
  {
    sticks(x + xDif, y - yDif, wideness * wideScale, angle + angleChange, count, true);
    sticks(x - xDif, y - yDif, wideness * wideScale, angle + angleChange, count, false);
  }
}

void mouseClicked()
{
  redraw();
}

void keyPressed()
{
  if(key == ' ')
  {
    counter = 1;
    redraw();
  }
}