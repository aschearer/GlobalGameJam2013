package heartattacks.states 
{
	import heartattacks.doodads.Music;
	import heartattacks.Objects.CreditScreen;
	import heartattacks.Objects.GameOverScr;
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
	public class Dead extends World
	{
		private var gameOver:GameOverScr;
		private var resume:Resume;
		
		public function Dead() 
		{
			this.gameOver = new GameOverScr(0, 0);
			this.add(this.gameOver);
			
			this.resume = new Resume(300, 400);
			this.add(this.resume);
					
			Music.gameplay.stop();
			Music.heartbeat.stop();
			Music.gameover.loop();
		}
		
	}

}