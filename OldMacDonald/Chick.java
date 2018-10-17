class Chick implements Animal 
{
	private String aniSound;
	private String aniType;
	public Chick(String type, String sound)
	{
		aniSound=sound;
		aniType=type;
	}
	public Chick()
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
