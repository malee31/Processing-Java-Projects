class Farm 
{     
	private static Animal[] animals=new Animal[3];
	public Farm()
	{
		animals[0]=new Cow("cow", "moo");
		animals[1]=new Chick(/*"chick", "cluck"*/);
		animals[2]=new Pig("pig", "oink");
	}
	public String getType(int num)
	{
		return animals[num].getType();
	}
	public static String getSounds()
	{
		String returnThis="";
		for(int i=0; i<animals.length; i++)
		{
			if(animals[i]!=null)
			{
				if(i==0)
				{
					returnThis+="The ";
				}
				else
				{
					returnThis+=" and the ";
				}
				returnThis+=animals[i].getType()+" says "+animals[i].getSound();
			}
		}
		return returnThis;
	}
}
