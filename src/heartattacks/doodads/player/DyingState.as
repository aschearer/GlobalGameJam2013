package heartattacks.doodads.player 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.graphics.Spritemap;
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
		}
		
		public function update(spritemap:Spritemap):void 
		{
		}
	}

}