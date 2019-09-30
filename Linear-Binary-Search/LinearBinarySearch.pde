private Item[] store = 
{
	new Item(184, 14), 
	new Item(196, 60), 
	new Item(206, 31), 
	new Item(2370, 65), 
	new Item(7282, 73), 
	new Item(8303, 90), 
	new Item(12328, 63), 
	new Item(12705, 14), 
	new Item(13066, 8), 
	new Item(14088, 92), 
	new Item(15320, 82), 
	new Item(15814, 60), 
	new Item(15917, 51), 
	new Item(17911, 96), 
	new Item(18061, 3), 
	new Item(18410, 56), 
	new Item(18465, 27), 
	new Item(18618, 64), 
	new Item(18871, 69), 
	new Item(19967, 45)
};

public boolean inbound(int index)
{
	return index>=0 && index<store.length;
}

public int linearSearch(int catNumToFind)
{
	for(int i=0; i<store.length; i++)
	{
		if(store[i].getCatNum()==catNumToFind)
		{
			return store[i].getInventory();
		}
	}
	return -1;
}

public int recursiveLinearSearch(int catNumToFind, int startIndex)
{
	if(store[startIndex].getCatNum()==catNumToFind) return store[startIndex].getInventory();
	if(store[startIndex].getCatNum()<catNumToFind && store.length>startIndex+1) return recursiveLinearSearch(catNumToFind, startIndex+1);
	return -1;
}

public int binarySearch(int catNumToFind)
{
	int cur=0;
	int last=store.length;
	int add=store.length/2;
	while(true)
	{
		if(Math.abs(last-cur)==1) break;
		if(inbound(cur) && store[cur].getCatNum()==catNumToFind) return cur;
		else if(inbound(cur) && store[cur].getCatNum()<catNumToFind)
		{
			cur+=add;
		}
		else
		{
			cur-=add;
		}
			last=cur;
			add/=2;
		}
	}
	return -1;
}

public int recursiveBinarySearch(int catNumToFind, int nLow, int nHigh)
{
	int cur=(nLow+nHigh)/2;
	int add=Math.abs((nLow+nHigh)/2);
	if(store[cur].getCatNum()==catNumToFind) return store[cur].getInventory();
	if(nHigh-nLow==1) return -1; //May cause problems if it's 1 away from value
	if(store[cur].getCatNum()<catNumToFind)
	{
		return recursiveBinarySearch(catNumToFind, nLow+add, nHigh);
	}
	else
	{
		return recursiveBinarySearch(catNumToFind, nLow, nHigh+add);
	}
	return -1;
}

public void setup()
{
	int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
	
	System.out.println("\nTesting Non-Recursive Linear Search\n=====================");
	for (int i = 0; i < tests.length; i++)
	{
		if (linearSearch(tests[i]) != -1)
			System.out.println("Catalog #"+tests[i]+" has "+linearSearch(tests[i]) + " in stock");
		else
			System.out.println("Catalog #"+tests[i]+" not found");
	}
	System.out.println("\nTesting Recursive Linear Search\n=====================");
	for (int i = 0; i < tests.length; i++)
	{
		if (recursiveLinearSearch(tests[i],0) != -1)
			System.out.println("Catalog #"+tests[i]+" has "+recursiveLinearSearch(tests[i],0) + " in stock");
		else
			System.out.println("Catalog #"+tests[i]+" not found");
	}
	System.out.println("\nTesting Non-Recursive Binary Search\n===================================");
	for (int i = 0; i < tests.length; i++)
	{
		if (binarySearch(tests[i]) != -1)
			System.out.println("Catalog #"+tests[i]+" has "+binarySearch(tests[i]) + " in stock");
		else
			System.out.println("Catalog #"+tests[i]+" not found");
	}
	System.out.println("\nTesting Recursive Binary Search\n===============================");
	for (int i = 0; i < tests.length; i++)
	{
		if (recursiveBinarySearch(tests[i], 0, store.length - 1) != -1)
			System.out.println("Catalog #"+tests[i]+" has "+recursiveBinarySearch(tests[i], 0, store.length - 1) + " in stock");
		else
			System.out.println("Catalog #"+tests[i]+" not found");
	}
}

public void draw(){ /*Unnecessary*/ }