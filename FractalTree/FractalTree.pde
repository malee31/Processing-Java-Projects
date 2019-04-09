float startSize=300;
float sizeRatio=0.1;
float sizeLimit=1;
int counter=3;
int wider=20;
int startAngle=0;
void setup()
{
	size(1000,1000);
	frameRate(1);
	background(200,200,200);
}
void draw()
{
	fill(0,0,0);
	sticks(500,1000,50,0,counter);
	counter++;
}
void sticks(float x,float y,float wide,float angle,int count)
{
	float xDif=(float)(wide*Math.cos(radians(angle)));
	float yDif=(float)(wide*sizeRatio*Math.sin(radians(angle)));
	stroke(0,0,0);
	line(x,y,x+xDif,y-yDif);
	line(x,y,x-xDif,y-yDif);
	count--;
	if(count>0)
	{
		sticks(x+xDif,y-yDif,wide/3*2,angle+wider,count);
		sticks(x-xDif,y-yDif,wide/3*2,angle-wider,count);
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