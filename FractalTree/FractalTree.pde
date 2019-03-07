float startSize=300;
float sizeRatio=0.3;
float sizeLimit=1;
int counter=1;
void setup()
{
	size(1000,1000);
	frameRate(5);
	background(200,200,200);
}
void draw()
{
	fill(200,200,200);
	rect(0,0,width,height);
	sticks(500,400,startSize,(float)Math.PI*3/2,counter);
	counter++;
}
void sticks(float x,float y,float wide,float angle,int count)
{
	float tall=wide*sizeRatio;
	float angle2=(float)Math.PI-angle-(float)Math.PI/2;
	println(angle/Math.PI+", "+angle2/Math.PI);
	fill(0,0,0);
	beginShape();
	vertex(x,y);
	vertex(x+wide*sin(angle),y+wide*cos(angle));
	vertex(x+wide*sin(angle)+tall*sin(angle2),y+wide*cos(angle)+tall*sin(angle2));
	vertex(x+tall*sin(angle2),y+tall*cos(angle2));
	endShape(CLOSE);
	// if(wide>1&&count>0)
	// {
	// 	sticks(500,800,wide*2/3,angle-0.5,count-1);
	// 	sticks(500,800,wide*2/3,angle+0.5,count-1);
	// }
}