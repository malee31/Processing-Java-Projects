public final static String e = "2.718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059";
public void setup()
{
	String subStr="";
	double testNum=0;
	//starts at 2 to ignore "2."
	for(int i=2;i<=e.length()-10;i++)
	{
		//gets a substring of 10 numbers after "2." in e.
		subStr=e.substring(i,i+10);
		//turns substring into a double
		testNum=Double.parseDouble(subStr);
		//tests if testNum is prime
		while(testNum!=(int)testNum)
		{
			testNum*=10;
		}
		if(isPrime(testNum))
		{
			println(subStr);
			break;
		}
	}
	println("End");
	//LET ME DRAG THE CANVAS AWAY OK?
	size(300,300);
	noLoop();
}
public boolean isPrime(double dNum)
{
    if(dNum%2==0){return false;}
    else
    {
    	for(int i=3;i<=Math.sqrt(dNum);i+=2)
    	{
    		if(dNum%i==0){return false;}
    	}
    	return true;
    }
}
public void draw(){/*not needed for this assignment*/}