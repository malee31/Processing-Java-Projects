public void setup()
{
  String lines[] = loadStrings("palindromes.txt");
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) 
  {
    if(palindrome(lines[i])==true)
    {
      println(lines[i] + " IS a palindrome.");
    }
    else
    {
      println(lines[i] + " is NOT a palindrome.");
    }
  }
}
public boolean palindrome(String word)
{
  if(removeSpecial(word).toLowerCase().equals(reverse(word)))
  {
    return true;
  }
  return false;
}
public String reverse(String str)
{
    String sNew = new String();
    str=str.toLowerCase();
    str=removeSpecial(str);
    for(int cur=0; cur<str.length(); cur++)
    {
      sNew+=str.substring(str.length()-1-cur,str.length()-cur);
    }
    return sNew;
}
public String removeSpecial(String word)
{
  //Takes a word/string and removes the following:' !,.
  String result="";
  for(int i=0; i<word.length(); i++)
  {
    if(Character.isLetter(word.charAt(i))||Character.isDigit(word.charAt(i)))
    {
      result+=word.substring(i,i+1);
    }
  }
  return result;
}