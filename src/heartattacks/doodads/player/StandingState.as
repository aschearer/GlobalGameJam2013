package heartattacks.doodads.player 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class StandingState implements IState
	{
		private var callback:Function;
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter(spritemap:Spritemap):void 
		{
			var r:Number = Math.random();
			if (r < .66)
			{
				spritemap.play("stand-forward");
			}
			else if (r <= 83)
			{
				spritemap.play("stand-side");
				spritemap.flipped = true;
			}
			else
			{
				spritemap.play("stand-side");
				spritemap.flipped = false;
			}
		}
		
		public function update(spritemap:Spritemap):void 
		{
			if (!Input.mouseDown)
			{
				this.callback("walking-state");
			}
		}
	}

}