int[] lineWordcount = new int[0];

public void setup() 
{
	wordsTxt();
	lowellHymn();
}

public void wordsTxt()
{
	//load text lines into array of strings
	String[] lines = loadStrings("words.txt");

	System.out.println("There are " + lines.length + " lines in the basic text");
	
	for(int i = 0 ; i < lines.length; i++) 
	{
		System.out.println(pigLatin(lines[i]));
	}
}

public void lowellHymn()
{
	//load lines
	String[] hymn = loadStrings("LowellHymn.txt");

	System.out.println("\nThere are " + hymn.length + " lines in the Lowell Hymn\n");
	
	hymn = separateWords(hymn);

	int tracker = 0;
	int tracker2 = 0;
	for(int i = 0 ; i < hymn.length; i++) 
	{
		if(tracker == lineWordcount[tracker2])
		{
			System.out.println("");
			tracker2++;
			tracker = 0;
			if(tracker == lineWordcount[tracker2])
			{
				System.out.println("");
				tracker2++;
				tracker = 0;
			}
		}
		System.out.print(fixCase(pigLatin(hymn[i]))+" ");
		tracker++;
	}
	System.out.println("");
}

public void draw(){/*not used*/}

public int findFirstVowel(String sWord)
{
	//precondition: sWord is a valid String of length greater than 0.
	//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	int firstVowel = hasAEIOU(sWord);
	if(firstVowel >= 0)
	{
		return firstVowel;
	}
	return -1;
}

public String fixCase(String word)
{
	if(!word.toLowerCase().equals(word))
	{
		word = Character.toUpperCase(word.charAt(0)) + word.substring(1, word.length()).toLowerCase();
	}
	if(word.indexOf("-") != -1)
	{
		word = word.substring(0, word.indexOf("-") + 1) + Character.toUpperCase(word.charAt(word.indexOf("-") + 1)) + word.substring(word.indexOf("-") + 2, word.length());
	}
	return word;
}

public String pigLatin(String sWord)
{
	//precondition: sWord is a valid String of length greater than 0
	//postcondition: returns the pig latin equivalent of sWord
	char last = sWord.charAt(sWord.length()-1);
	if(sWord.length()>2 && sWord.substring(0,2).equals("qu"))
	{

		if(last == '.' || last == ',')
		{
			return sWord.substring(2,sWord.length()-1)+"quay"+sWord.substring(sWord.length()-1);
		}
		return sWord.substring(2)+"quay";
	}
	int firstVow = findFirstVowel(sWord);
	switch(firstVow)
	{
		case -1:
			if(last == '.' || last == ',')
			{
				return sWord.substring(0,sWord.length()-1)+"ay"+sWord.substring(sWord.length()-1);
			}
			return sWord + "ay";
		case 0:
			if(last == '.' || last == ',')
			{
				return sWord.substring(0,sWord.length()-1)+"way"+sWord.substring(sWord.length()-1);
			}
			return sWord+"way";
		default:
			if(last == '.' || last == ',')
			{
				return sWord.substring(firstVow,sWord.length()-1)+sWord.substring(0,firstVow)+"ay"+sWord.substring(sWord.length()-1);
			}
			return sWord.substring(firstVow)+sWord.substring(0, firstVow)+"ay";
	}
}

public int hasAEIOU(String testMe)
{
	for(int i = 0; i<testMe.length(); i++)
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
	ArrayList<String> result = new ArrayList<String>();

	//counts words per line, starts by filling it with 0
	int[] wordcounts = new int[line.length];
	for(int i = 0; i<wordcounts.length; i++)
	{
		wordcounts[i] = 0;
	}

	//loops through each line and starts separating words and pushing them into the array
	for(int lineIter = 0; lineIter<line.length; lineIter++)
	{
		//used to keep track of where to substring
		int start = 0, end = 0;

		//loops through each letter in each string to look for words
		for(int wordIter = 0; wordIter<line[lineIter].length(); wordIter++)
		{
			if(line[lineIter].charAt(wordIter) == ' ')
			{
				end = wordIter;
				result.add(line[lineIter].substring(start, end));
				//skips over the space
				start = end + 1;
				wordcounts[lineIter]++;
			}
			//Includes last word of each line
			if(lineIter == line.length-1 && wordIter == line[lineIter].length()-1)
			{
				result.add(line[lineIter].substring(start,line[lineIter].length()));
				wordcounts[lineIter]++;
			}
		}
	}
	//moves all values from ArrayList to array and returns it
	String[] res = new String[result.size()];
	//makes it so println works kinda
	lineWordcount = new int[result.size()];
	for(int ix = 0; ix<result.size(); ix++)
	{
		res[ix] = result.get(ix);
	}
	lineWordcount = new int[wordcounts.length];
	lineWordcount = wordcounts;
	result.clear();
	return res;
}
