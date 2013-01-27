package heartattacks.doodads 
{
	import com.greensock.TweenLite;
	import heartattacks.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Girl extends Entity
	{
		public var TimeTillNextMove:Number = 3.2;
		public var percentageToBoy:Number;
		
		[Embed(source = "../../../res/spritesheets/Girl.png")] protected var GirlImage:Class;
		private var spritemap:Spritemap;
		
		private var timeSinceLastMove:Number;
		private var timeTillMarker:Number = 0.1;
		private var timeToMarker:Number = 0;
		private var level:Level;
		
		public function Girl(level:Level) 
		{
			super(0, 0);
			this.level = level;
			this.spritemap = new Spritemap(GirlImage, 64, 128);
			this.spritemap.add("walk-forward", [1, 2, 3, 4, 5, 6], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(64, 128);
			this.layer = 2;
			this.timeSinceLastMove  = 0;
			this.percentageToBoy = 0;
		}
		
		override public function update():void
		{
			
			this.timeSinceLastMove += 1 / 60;
			var bonusModifier:Number = 1 - .1 * this.percentageToBoy;
			if (this.timeSinceLastMove >= this.TimeTillNextMove * bonusModifier)
			{
				var column:int = this.pickNewColumn();
				TweenLite.to(this, 0.5, { x: this.x + this.level.tileSize * column } );
				this.timeSinceLastMove -= this.TimeTillNextMove * bonusModifier;
			}
			
			this.timeToMarker -= 1 / 60;
			if (this.timeToMarker <= 0)
			{
				this.timeToMarker = this.timeTillMarker;
				var marker:Marker = new Marker(this.centerX, this.centerY);
				FP.world.add(marker);
			}
		}
		
		private function pickNewColumn():int
		{
			var column:int = this.x / this.level.tileSize;
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