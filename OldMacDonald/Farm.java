class Farm 
{     
	private static Animal[] animals=new Animal[15];
	public Farm()
	{
		animals[0]=new Cow();
	}
	public String getType(int num)
	{
		return animals[num].getType();
	}
	public static String getSounds()
	{
		String returnThis="The "+animals[0].getType()+" says "+animals[0].getSound();
		for(int i=1; i<animals.length; i++)
		{
			returnThis+="";
		}
		return returnThis;
	}
}
