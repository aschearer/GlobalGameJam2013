package heartattacks.states 
{
	import heartattacks.Objects.CreditScreen;
	import heartattacks.Objects.Resume;
	import net.flashpunk.World;
	import heartattacks.Objects.CreditsButton;
	import heartattacks.Objects.MenuScreen;
	import net.flashpunk.World;
    import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class CreditWorld extends World
	{
		private var creditScreen:CreditScreen;
		private var resume:Resume;
		
		public function CreditWorld() 
		{
			this.creditScreen = new CreditScreen(0, 0);
			this.add(this.creditScreen);
			
			this.resume = new Resume(300, 500);
			this.add(this.resume);
			
		}
		
	}

}