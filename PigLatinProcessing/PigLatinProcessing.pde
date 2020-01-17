int[] lineWordcount=new int[0];
public void setup() 
{
	String[] lines = loadStrings("words.txt");
	String[] lines2=loadStrings("LowellHymn.txt");
	System.out.println("There are " + lines.length + " lines in the basic text");
	for (int i = 0 ; i < lines.length; i++) 
	{
		System.out.println(pigLatin(lines[i]));
	}
	System.out.println("\nand there are " + lines2.length + " lines in the Lowell Hymn\n");
	lines2=separateWords(lines2);
	int tracker=0;
	int tracker2=0;
	for (int i = 0 ; i < lines2.length; i++) 
	{
		if(tracker==lineWordcount[tracker2])
		{
			System.out.println("");
			tracker2++;
			tracker=0;
			if(tracker==lineWordcount[tracker2])
			{
				System.out.println("");
				tracker2++;
				tracker=0;
			}
		}
		System.out.print(pigLatin(lines2[i])+" ");
		tracker++;
	}
	System.out.println("");
}
public void draw(){/*not used*/}
public int findFirstVowel(String sWord)
{
	//precondition: sWord is a valid String of length greater than 0.
	//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	int firstVowel=hasAEIOU(sWord);
	if(firstVowel>=0)
	{
		return firstVowel;
	}
	return -1;
}

public String pigLatin(String sWord)
{
	//precondition: sWord is a valid String of length greater than 0
	//postcondition: returns the pig latin equivalent of sWord
	char last=sWord.charAt(sWord.length()-1);
	if(sWord.length()>2&&sWord.substring(0,2).equals("qu"))
	{

		if(last=='.'||last==',')
		{
			return sWord.substring(2,sWord.length()-1)+"quay"+sWord.substring(sWord.length()-1);
		}
		return sWord.substring(2)+"quay";
	}
	int firstVow=findFirstVowel(sWord);
	switch(firstVow)
	{
		case -1:
			if(last=='.'||last==',')
			{
				return sWord.substring(0,sWord.length()-1)+"ay"+sWord.substring(sWord.length()-1);
			}
			return sWord + "ay";
		case 0:
			if(last=='.'||last==',')
			{
				return sWord.substring(0,sWord.length()-1)+"way"+sWord.substring(sWord.length()-1);
			}
			return sWord+"way";
		default:
			if(last=='.'||last==',')
			{
				return sWord.substring(firstVow,sWord.length()-1)+sWord.substring(0,firstVow)+"ay"+sWord.substring(sWord.length()-1);
			}
			return sWord.substring(firstVow)+sWord.substring(0,firstVow)+"ay";
	}
}
public int hasAEIOU(String testMe)
{
	for(int i=0;i<testMe.length();i++)
	{
		switch(testMe.substring(i,i+1).toLowerCase())
		{
			case "a":
			case "e":
			case "i":
			case "o":
			case "u":
				return i;
		}
	}
	return -1;
}
public String[] separateWords(String line[])
{
	//Pre: a string array that has lines with a space assumed to be between each line (no partial words like cut offs using -)
	//Post: a string array is returned with each word as a value in it
	ArrayList<String> result=new ArrayList<String>();
	//counts words per line, starts by filling it with 0
	int[] wordcount=new int[line.length];
	for(int i=0; i<wordcount.length; i++)
	{
		wordcount[i]=0;
	}
	//start separating words and push it to the array
	//used to keep track of where to substring
	int start=0;
	int end=0;
	for(int lineIter=0;lineIter<line.length;lineIter++)
	{
		//loops through each line
		start=0;
		end=0;
		for(int wordIter=0;wordIter<line[lineIter].length();wordIter++)
		{
			//loops through each letter in each string
			if(line[lineIter].substring(wordIter,wordIter+1).equals(" "))
			{
				end=wordIter;
				result.add(line[lineIter].substring(start,end));
				start=end+1;
				wordcount[lineIter]++;
			}
			//this if statement includes "High." into the arraylist which normally isn't included as the last word isn't counted in the loops for some reason
			if(lineIter==line.length-1&&wordIter==line[lineIter].length()-1)
			{
				result.add(line[lineIter].substring(start,line[lineIter].length()));
				wordcount[lineIter]++;
			}
		}
	}
	//moves all values from ArrayList to array and returns it
	String[] res=new String[result.size()];
	//makes it so println works kinda
	lineWordcount=new int[result.size()];
	for(int ix=0;ix<result.size();ix++)
	{
		res[ix]=result.get(ix);
	}
	lineWordcount=new int[wordcount.length];
	lineWordcount=wordcount;
	result.clear();
	return res;
}