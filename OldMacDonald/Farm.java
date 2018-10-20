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
				returnThis+="Old Mac Donald had a Farm\nE-I-E-I-O!\nAnd on that farm he had a "+animals[i].getType()+"\nE-I-E-I-O\nWith a "+animals[i].getSound()+" "+animals[i].getSound()+" here\nAnd a "+animals[i].getSound()+" "+animals[i].getSound()+" there \nHere a "++animals[i].getSound()+"\nThere a "+animals[i].getSound()+"\nEverywhere "+animals[i].getSound()+" "+animals[i].getSound()+"\nOld Mac Donald had a farm\nE-I-E-I-O!";
			}
		}
		return returnThis;
	}
}
