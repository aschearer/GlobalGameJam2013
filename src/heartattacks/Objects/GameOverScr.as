package heartattacks.Objects 
{
	import heartattacks.doodads.Music;
    import net.flashpunk.FP;
    import flash.geom.Rectangle;
	import heartattacks.states.MenuState;
	import heartattacks.states.PlayState;
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
	public class GameOverScr extends Entity
	{ 
		[Embed(source = "../../../res/Buttons/gameOver.png")] protected var OverImage:Class;
		private var gameOver:Image;
		
		public function GameOverScr(x:Number,y:Number) 
		{
			super(x, y);
			this.gameOver = new Image(OverImage);
			this.graphic = this.gameOver;
	
		}
		
		
		override public function render():void
		{
			super.render();
		}
		
	}

}