package heartattacks.doodads.player 
{
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
			if (this.girl.isWatching)
			{
				this.callback("scared-state");
			}
		}
		
		private function processInput(spritemap:Spritemap):void
		{
			if (Input.mouseDown)
			{
				var dx:Number = Input.mouseX - this.player.centerX;
				var dy:Number = Input.mouseY - this.player.centerY;
				var theta:Number = Math.atan2(dy, dx);
				this.player.heading = theta;
				if (this.player.heading < Math.PI / 2 - Math.PI / 8)
				{
					spritemap.flipped = false;
					spritemap.play("walk-side");
				}
				else if (this.player.heading > Math.PI / 2 + Math.PI / 8)
				{
					spritemap.flipped = true;
					spritemap.play("walk-side");
				}
				else if (spritemap.currentAnim != "walk-forward")
				{
					spritemap.flipped = false;
					spritemap.play("walk-forward");
				}
			}
			else
			{
				this.player.heading = Math.PI / 2;
				if (spritemap.currentAnim != "walk-forward")
				{
					spritemap.play("walk-forward");
				}
			}
		}
	}

}