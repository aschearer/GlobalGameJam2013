package heartattacks.doodads.girl 
{
	import heartattacks.doodads.states.IState;
	import heartattacks.doodads.Girl;
	import com.greensock.TweenLite;
	import heartattacks.doodads.Player;
	import net.flashpunk.FP;
	import heartattacks.Level;
	import heartattacks.doodads.Marker;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class WalkingState implements IState
	{
		public var TimeTillNextMove:Number = 3.2;
		
		private var timeSinceLastMove:Number = 0;
		private var timeTillMarker:Number = 0.1;
		private var timeToMarker:Number = 0;
		private var girl:Girl;
		private var level:Level;
		private var callback:Function;
		
		public function WalkingState(girl:Girl, level:Level)
		{
			this.girl = girl;
			this.level = level;
		}
		
		public function onEnter():void
		{
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		public function get animationName():String
		{
			return "walk-forward";
		}
		
		public function update():void
		{
			this.emitMarker();
			this.lookForBadGuys();
			this.changeColumns();
		}
		
		private function lookForBadGuys():void
		{
			var player:Player = Player(FP.world.getInstance("player"));
			var distance:Number = Math.sqrt(Math.pow(player.x - this.girl.x, 2) + Math.pow(player.y - this.girl.y, 2));
			if (distance < 200)
			{
				if (Math.random() > .9)
				{
					this.timeSinceLastMove = this.TimeTillNextMove;
				}
				else
				{
					this.callback("nervous-state");
				}
			}
			
			if (Math.random() > .99)
			{
				this.callback("startled-state");
			}
		}
		
		private function changeColumns():void
		{
			this.timeSinceLastMove += 1 / 60;
			var bonusModifier:Number = 1 - .1 * this.girl.percentageToBoy;
			if (this.timeSinceLastMove >= this.TimeTillNextMove * bonusModifier)
			{
				var column:int = this.pickNewColumn();
				TweenLite.to(this.girl, 0.5, { x: this.girl.x + this.level.tileSize * column } );
				this.timeSinceLastMove -= this.TimeTillNextMove * bonusModifier;
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
		
		private function pickNewColumn():int
		{
			var column:int = this.girl.x / this.level.tileSize;
			var r:Number = Math.random();
			if (r < .6)
			{
				if (r < .3 && column > this.level.gutterLeft + 1)
				{
					return -1;
				}
				else if (column < this.level.numColumns - this.level.gutterRight - 1)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
			else
			{
				if ((r - .6) < .2 && column > this.level.gutterLeft + 1)
				{
					return -2;
				}
				else if (column < this.level.numColumns - this.level.gutterRight - 2)
				{
					return 2;
				}
				else
				{
					return 0;
				}
			}
		}
	}
}