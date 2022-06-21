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
		aniSound="*MOO*";
		aniType="*cow*";
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
