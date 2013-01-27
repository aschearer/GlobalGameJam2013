package heartattacks.doodads.player 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.graphics.Spritemap;
	import com.greensock.TweenLite;
	import heartattacks.doodads.Music;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class DyingState implements IState
	{
		private var callback:Function;
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter(spritemap:Spritemap):void 
		{
			spritemap.play("dying");
			TweenLite.to(spritemap, 1, { alpha: 0, delay: 1 } );
			Music.explosion.play();
		}
		
		public function update(spritemap:Spritemap):void 
		{
		}
	}

}