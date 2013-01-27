package heartattacks.states 
{
	import heartattacks.doodads.Music;
	import heartattacks.Objects.Button;
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
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class MenuState extends World
	{
		[Embed(source = "../../../res/Buttons/title_screen.png")] private var BackgroundImage:Class;
		[Embed(source = "../../../res/Buttons/howtoplay_button_down.png")] private var HelpButtonImage:Class;
		
		private var bButtons:MenuScreen;
		private var credits:CreditsButton;
		private var faceBook:FaceBook;
		private var twitter:Twitter;

		
		public function MenuState() 
		{
			this.addGraphic(new Image(BackgroundImage));
			this.credits = new CreditsButton(300, 380);
			this.add(this.credits);
			
			this.bButtons = new MenuScreen(300, 300);
			this.add(this.bButtons);
			
			var helpButton:Button = new Button(HelpButtonImage, 300, 460);
			helpButton.Callback = this.OnHelpClicked;
			this.add(helpButton);
			
			this.faceBook = new FaceBook(600, 380);
			this.add(this.faceBook);
			
			this.twitter = new Twitter(600, 300);
			this.add(this.twitter);
		
			
			Music.lobby.loop();
			Music.gameover.stop();
			
		}
		
		private function OnHelpClicked():void 
		{
			FP.world = new HelpState();
		}
		
		
		
	}

}