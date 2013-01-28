package heartattacks.doodads.player 
{
	import com.greensock.TweenLite;
	
	import heartattacks.doodads.Girl;
	import heartattacks.doodads.Player;
	import heartattacks.doodads.states.IState;
	
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class MovingState implements IState
	{
		private var callback:Function;
		private var player:Player;
		private var girl:Girl;
		
		public function MovingState(player:Player, girl:Girl)
		{
			this.player = player;
			this.girl = girl;
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter(spritemap:Spritemap):void 
		{
		}
		
		public function update(spritemap:Spritemap):void 
		{
			this.processInput(spritemap);
			if (this.player.IsHappy)
			{
				this.player.yVelocity = 0.5;
			}
			else
			{
				this.player.yVelocity = -1.5;
			}
			
			
			if (this.girl.isWatching)
			{
				this.callback("dying-state");
			}
			
			if (this.player.isDead)
			{
				this.player.xVelocity = 0;
				this.player.yVelocity = 0;
			}
		}
		
		private function processInput(spritemap:Spritemap):void
		{
			if (Input.mouseDown)
			{
				var deltaX:Number = this.player.centerX - Input.mouseX;
				if (deltaX < -10)
				{
					this.player.xVelocity = 5;
					spritemap.flipped = false;
					spritemap.play(this.player.IsHappy ? "walk-side-happy" : "walk-side");
					this.player.heading = Math.PI / 2 - Math.PI / 4;
					
				}
				else if (deltaX > 10)
				{
					this.player.xVelocity = -5;
					spritemap.flipped = true;
					spritemap.play(this.player.IsHappy ? "walk-side-happy" : "walk-side");
					this.player.heading = Math.PI / 2 - Math.PI / 4;
					this.player.heading = Math.PI / 2 + Math.PI / 4;
				}
				else
				{
					this.player.xVelocity = 0;
					spritemap.play(this.player.IsHappy ? "walk-forward-happy" : "walk-forward");
					this.player.heading = Math.PI / 2;
				}
			}
			else
			{
				this.player.xVelocity = 0;
				spritemap.play(this.player.IsHappy ? "walk-forward-happy" : "walk-forward");
				this.player.heading = Math.PI / 2;
			}
		}
	}

}