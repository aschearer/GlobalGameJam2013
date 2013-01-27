package heartattacks.doodads.player 
{
	import heartattacks.doodads.states.IState;
	import heartattacks.states.Dead;
	import net.flashpunk.graphics.Spritemap;
	import com.greensock.TweenLite;
	import heartattacks.doodads.Music;
	import net.flashpunk.FP;
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
			Music.explosion.play();
			TweenLite.to(spritemap, 1, { alpha: 0, delay: 1, onComplete: this.ExitGame } );	
			
		}
		
		private function ExitGame():void 
		{   
			FP.world = new Dead();
			
		}
		
		public function update(spritemap:Spritemap):void 
		{
		}
	}

}