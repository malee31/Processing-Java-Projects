public static String e = "2.718281828459045235360287471352662497757247093699959574966967627724076630353547594571382178525166427427466391932003059";
// public void setup()
// {
// 	
// 	for(int i = 2; i <= e.length() - 12; i++)
// 	{
// 		//gets a substring of 10 numbers after "2." in e.
// 		subStr=e.substring(i, i + 10);
// 		//turns substring into a double
// 		testNum=Double.parseDouble(subStr);
// 		//tests if testNum is prime
// 		if(isPrime(testNum))
// 		{
// 			println("The prime was: " + subStr);
// 		}
// 	}
// 	//LET ME DRAG THE CANVAS AWAY OK?
// 	size(500, 500);
// }

void setup()
{
	fill(255);
	stroke(0);
	size(500, 500);

	String subStr = "";
	double testNum = 0;
	//starts at 2 to ignore "2."
	for(int i = 2; i <= e.length() - 12; i++)
	{
		//gets a substring of 10 numbers after "2." in e.
		subStr=e.substring(i, i + 10);
		//turns substring into a double
		// testNum=Double.parseDouble(subStr);
		//tests if testNum is prime
		if(isPrime(testNum))
		{
			println("The prime was: " + subStr);
		}
	}
}
void draw()
{
	rect(200, 200, 100, 100);
	textSize(10);
	text("Click to generate more primes with the bigger e!", 150, 150);
}

void mousePressed()
{
	if(mouseX >= 200 && mouseX <= 300 && mouseY >= 200 && mouseY <= 300)
	{
		e = "2.7182818284590452353602874713526624977572470936999595749669676277240766303535475945713821785251664274274663919320030599218174135966290435729003342952605956307381323286279434907632338298807531952510190115738341879307021540891499348841675092447614606680822648001684774118537423454424371075390777449920695517027618386062613313845830007520449338265602976067371132007093287091274437470472306969772093101416928368190";
		println();
		setup();
	}
}

public boolean isPrime(double dNum)
{
    if(dNum%2 == 0){return false;}
    else
    {
    	for(int i = 3; i <= Math.sqrt(dNum); i += 2)
    	{
    		if(dNum % i == 0){return false;}
    	}
    	return true;
    }
}