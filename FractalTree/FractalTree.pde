float startSize=300;
float sizeRatio=0.5;
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
	float[] xyVertex={x, y, x+tall*cos(angle), y-wide*sin(angle), x+tall*cos(angle)-wide*cos(angle), y-tall*sin(angle)-wide*sin(angle), x-wide*cos(angle), y-wide*sin(angle)};
	fill(255,0,0);
	ellipse(xyVertex[0],xyVertex[1],10,10);
	fill(120,120,120);
	ellipse(xyVertex[2],xyVertex[3],10,10);
	fill(0,0,255);
	ellipse(xyVertex[4],xyVertex[5],10,10);
	fill(255,0,255);
	ellipse(xyVertex[6],xyVertex[7],10,10);
	fill(0,0,0);
	beginShape();
	vertex(xyVertex[0],xyVertex[1]);
	vertex(xyVertex[2],xyVertex[3]);
	vertex(xyVertex[4],xyVertex[5]);
	vertex(xyVertex[6],xyVertex[7]);
	endShape(CLOSE);
	// if(wide>1&&count>0)
	// {
	// 	sticks(500,800,wide*2/3,angle-0.5,count-1);
	// 	sticks(500,800,wide*2/3,angle+0.5,count-1);
	// }
}