package heartattacks.states 
{
	import heartattacks.Objects.CreditsButton;
	import heartattacks.Objects.FaceBook;
	import heartattacks.Objects.MenuScreen;
	import heartattacks.Objects.Twitter;
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
	public class MenuState extends World
	{
		private var bButtons:MenuScreen;
		private var credits:CreditsButton;
		private var faceBook:FaceBook;
		private var twitter:Twitter;
		
		public function MenuState() 
		{
			this.credits = new CreditsButton(300, 380);
			this.add(this.credits);
			
			this.bButtons = new MenuScreen(300, 300);
			this.add(this.bButtons);
			
			this.faceBook = new FaceBook(600, 380);
			this.add(this.faceBook);
			
			this.twitter = new Twitter(600, 300);
			this.add(this.twitter);
			
		}
		
	}

}