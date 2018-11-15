public void setup() 
{
	String[] lines = loadStrings("words.txt");
	String[] lines2=loadStrings("LowellHymn.txt");
	lines2=separateWords(lines2);
	System.out.println("There are " + lines.length + " lines in the basic text");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
	System.out.println("and there are " + lines2.length + " lines in the Lowell Hymn");
	for (int i = 0 ; i < lines2.length; i++) 
	{
	  System.out.println(pigLatin(lines2[i]));
	}
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
	if(sWord.length()>2&&sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2,sWord.length())+"quay";
	}
	int firstVow=findFirstVowel(sWord);
	switch(firstVow)
	{
		case -1:
			return sWord + "ay";
		case 0:
			return sWord+"way";
		default:
			return sWord.substring(firstVow,sWord.length())+sWord.substring(0,firstVow)+"ay";
	}
	/*else{return "ERROR!";}*/
}
public int hasAEIOU(String testMe)
{
	for(int i=0;i<testMe.length();i++)
	{
		switch(testMe.charAt(i))
		{
			case 'a':
			case 'e':
			case 'i':
			case 'o':
			case 'u':
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


	//start separating words and push it to the array
	//used to keep track of where to substring
	int start=0;
	int end=0;
	for(int lineIter=0;lineIter<line.length;lineIter++)
	{
		//loops through each line
		for(int wordIter=0;wordIter<line[lineIter].length();wordIter++)
		{
			//loops through each letter in each string
			start=0;
			end=0;
			if(line[lineIter].substring(wordIter,wordIter+1).equals(" "))
			{
				end=wordIter;
				result.add(line[lineIter].substring(start,end));
				start=end+1;
			}
		}
	}




	//moves all values from ArrayList to array and returns it
	String[] res=new String[result.size()];
	for(int ix=0;ix<result.size();ix++)
	{
		res[ix]=result.get(ix);
	}
	result.clear();
	return res;
}