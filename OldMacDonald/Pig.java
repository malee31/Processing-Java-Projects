class Pig implements Animal 
{     
    private String aniSound;
	private String aniType;
	public Pig(String type, String sound)
	{
		aniSound=sound;
		aniType=type;
	}
	public Pig()
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