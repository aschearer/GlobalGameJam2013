package heartattacks.doodads.player 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class ScaredState implements IState
	{
		private var timeToLetDownGaurd:Number = 0;
		private var callback:Function;
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter(spritemap:Spritemap):void 
		{
			this.timeToLetDownGaurd = 1.5;
			spritemap.play("scared");
		}
		
		public function update(spritemap:Spritemap):void 
		{
			this.timeToLetDownGaurd -= 1 / 60;
			if (this.timeToLetDownGaurd <= 0)
			{
				this.callback("walking-state");
			}
		}
	}

}