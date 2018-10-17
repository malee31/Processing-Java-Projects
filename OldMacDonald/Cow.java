class Cow implements Animal 
{     
    private String aniSound;
	private String aniType;
	public Cow(String type, String sound)
	{
		aniSound=sound;
		aniType=type;
	}
	public Cow()
	{
		aniSound="<Insert Sound Here>";
		aniType="<Insert Type Here>";
	}
    public String getSound()
    {
    	return aniSound;
    }
    public String getType()
    {
    	return aniType;
    }
}
