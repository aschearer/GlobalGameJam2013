package heartattacks.doodads.girl 
{
	import heartattacks.doodads.states.IState;
	import net.flashpunk.FP;
	import heartattacks.doodads.Player;
	import heartattacks.doodads.Girl;
	import net.flashpunk.graphics.Spritemap;
	import heartattacks.doodads.Marker;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class NervousState implements IState
	{
		public var TimeTillNextMove:Number = 3.2;
		
		private var timeSinceLastMove:Number = 0;
		private var timeTillMarker:Number = 0.1;
		private var timeToMarker:Number = 0;
		
		private var timeToLetDownGaurd:Number = 0;
		private var strikeTimer:Number = 0;
		private var callback:Function;
		private var girl:Girl;
		
		public function NervousState(girl:Girl)
		{
			this.girl = girl;
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function onEnter(spritemap:Spritemap):void 
		{
			this.timeToLetDownGaurd = .5;
			this.strikeTimer = .35;
			spritemap.play("notice-forward");
		}
		
		public function update(spritemap:Spritemap):void 
		{
			this.lookForBadGuys();
			this.emitMarker();
			
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
			if (distance < this.girl.SensitiveArea && !player.isDead)
			{
				this.strikeTimer -= 1 / 60;
				if (this.strikeTimer <= 0)
				{
					this.callback("angry-state");
				}
			}
		}
		
		private function emitMarker():void
		{
			this.timeToMarker -= 1 / 60;
			if (this.timeToMarker <= 0)
			{
				this.timeToMarker = this.timeTillMarker;
				var marker:Marker = new Marker(this.girl.centerX, this.girl.centerY);
				FP.world.add(marker);
			}
		}
	}

}