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
		if((int)(Math.random()*2)==0)
		{
			aniSound="CHEEP";
		}
		else
		{
			aniSound="CLUCK";
		}
		aniType="*Chick*";
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
