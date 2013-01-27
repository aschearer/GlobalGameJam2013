package heartattacks.doodads.girl 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.FP;
	import heartattacks.doodads.Player;
	import heartattacks.doodads.Girl;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class StartledState implements IState
	{
		private var timeToLetDownGaurd:Number = 0;
		private var callback:Function;
		private var girl:Girl;
		private var strikeTimer:Number = 0;
		
		public function StartledState(girl:Girl)
		{
			this.girl = girl;
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;}
		
		public function onEnter(spritemap:Spritemap):void 
		{
			this.timeToLetDownGaurd = .25;
			this.strikeTimer = .20;
			spritemap.play("startled-backward");
		}
		
		public function update(spritemap:Spritemap):void 
		{
			this.lookForBadGuys();
			
			this.timeToLetDownGaurd -= 1 / 60;
			if (this.timeToLetDownGaurd <= 0)
			{
				this.callback("walking-state");
			}
		}
		
		private function lookForBadGuys():void
		{
			var player:Player = Player(FP.world.getInstance("player"));
			var distance:Number = Math.sqrt(Math.pow(player.x - this.girl.x, 2) + Math.pow(player.y - this.girl.y, 2));
			if (distance < 200)
			{
				this.strikeTimer -= 1 / 60;
				if (this.strikeTimer <= 0)
				{
					this.callback("angry-state");
				}
			}
		}
		
	}

}