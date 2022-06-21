public void setup()
{
	String lines[] = loadStrings("palindromes.txt");
	println("There are " + lines.length + " lines");
	for(int i = 0; i < lines.length; i++) 
	{
		println(lines[i] + (palindrome(lines[i]) ? " IS " : " is NOT ") + "a palindrome.");
		/*if(palindrome(lines[i]) == true)
		{
			println(lines[i] + " IS a palindrome.");
		}
		else
		{
			println(lines[i] + " is NOT a palindrome.");
		}*/
	}
}

public boolean palindrome(String word)
{
	word = removeSpecial(word);
	return word.equals(reverse(word));
	/*if(removeSpecial(word).toLowerCase().equals(reverse(word)))
	{
		return true;
	}
	return false;*/
}

public String reverse(String str)
{
		String sNew = "";
		for(int cur = 0; cur < str.length(); cur++)
		{
			sNew+=str.substring(str.length() - cur - 1, str.length() - cur);
		}
		return sNew;
}

public String removeSpecial(String word)
{
	//Removes special characters and whitespace from word and sets it to lowercase
	return word.replaceAll("\\W", "").replaceAll("\\s", "").toLowerCase();
	/*String result = "";
	for(int i = 0; i < word.length(); i++)
	{
		if(Character.isLetter(word.charAt(i)) || Character.isDigit(word.charAt(i)))
		{
			result += word.substring(i, i + 1);
		}
	}
	return result;*/
}
