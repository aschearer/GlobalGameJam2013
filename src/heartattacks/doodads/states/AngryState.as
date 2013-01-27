package heartattacks.doodads.states 
{
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class AngryState implements IGirlState
	{
		private var timeToLetDownGaurd:Number = 0;
		private var callback:Function;
		
		public function get animationName():String 
		{
			return "notice-backward";
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter():void 
		{
			this.timeToLetDownGaurd = .5;
		}
		
		public function update():void 
		{
			this.timeToLetDownGaurd -= 1 / 60;
			if (this.timeToLetDownGaurd <= 0)
			{
				this.callback("walking-state");
			}
		}
		
	}

}