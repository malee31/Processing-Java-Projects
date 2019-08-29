import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FractalTree extends PApplet {

float startSize=300;
float sizeLimit=1;
int counter=1;
float wideScale=9.0f/10;
int startAngle=0;
int angleChange=15;
int startWideness=200;
public void setup()
{
	
	frameRate(1);
	background(200,200,200);
	noLoop();
}
public void draw()
{
	fill(200,200,200);
	rect(0, 0, width, height);
	sticks(width/2,height,startWideness,0,counter,true);
	counter++;
}
public void sticks(float x,float y,float wideness,float angle,int count, boolean positive)
{
	if(wideness<=sizeLimit)
	{
		return;
	}
	float xDif=(float)(wideness*Math.sin(radians(angle)));
	float yDif=(float)(wideness*Math.cos(radians(angle)));
	if(positive)
	{
		xDif*=-1;
	}
	stroke(0,0,0);
	line(x,y,x+xDif,y-yDif);
	line(x,y,x-xDif,y-yDif);
	count--;
	if(count>0)
	{
		sticks(x+xDif,y-yDif,wideness*wideScale,angle+angleChange,count, true);
		sticks(x-xDif,y-yDif,wideness*wideScale,angle+angleChange,count, false);
	}
}
public void mouseClicked()
{
	redraw();
}
public void keyPressed()
{
	if(key==' ')
	{
		counter=1;
		println(counter);
		redraw();
	}
}
// 	fill(200,200,200);
// 	rect(0,0,width,height);
// 	sticks(470,800,startSize,startAngle,counter);
// 	//counter++;
// 	println("rerun");
// 	startAngle++;
// }
// void sticks(float x,float y,float wide,float angle,int count)
// {
// 	float tall=wide*sizeRatio;
// 	fill(0,200,0);
// 	ellipse(x,y,10,10);
// 	translate(x,y);
// 	ellipse(0,0,10,10);
// 	rotate(radians(angle));
// 	fill(0,0,0);
// 	rect(0,0,wide,tall);
// 	rotate(radians(angle*-1));
// 	translate(x*-1,y*-1);
// 	count--;
// 	println(x,y);
// 	if(count>0)
// 	{
// 		float angle1=radians(Math.abs(angle)%90);
// 		float angle2=PI-angle1;
// 		sticks(x-wide*cos(angle2),y-wide*sin(angle2),wide/2,angle-wider,count);
// 		sticks(x-wide*cos(angle2)+tall*cos(angle1),y-wide*sin(angle2)-tall*sin(angle1),wide/2,angle+wider,count);
// 	}
// }
  public void settings() { 	size(750,750); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FractalTree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
