class NamedCow extends Cow
{
	private String aniName;
	public NamedCow(String type, String sound, String name)
	{
		aniName=name;
	}
	public String getName()
	{
		return aniName;
	}
}