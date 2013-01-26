package heartattacks.doodads 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Monster.png")] private var PlayerImage:Class;
		
		private var MouseControlsEnabled:Boolean = false;
		private var ArrowControlsEnabled:Boolean = false;
		
		public var MovementSpeed:Number = -1;
		public var TurningSpeed:Number = 128;
		public var SpeedBonus:Number = 4;
		public var CurrentScore:uint = 0;
		public var HeartRate:Number = 70 / 60;
		public var ScorePerBeat:int = 100;
		
		private var timeTillNextHeartBeat:Number = 0;
		private var spritemap:Spritemap;
		private var heading:Number;
		private var radius:Number = 100;
		private var girl:Girl;
		
		public function Player(x:Number, y:Number, girl:Girl) 
		{
			super(x, y);
			this.girl = girl;
			this.heading = 0;
			this.spritemap = new Spritemap(PlayerImage, 128, 128);
			this.spritemap.add("walk-forward", [13, 14, 15, 16], 12, true);
			this.spritemap.add("walk-side", [18,19,20,21], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(128, 128);
			this.layer = 2;
		}
		
		override public function update():void
		{
			this.timeTillNextHeartBeat += 1 / 60;
			if (this.timeTillNextHeartBeat >= this.HeartRate)
			{
				this.timeTillNextHeartBeat -= this.HeartRate;
				this.CurrentScore += this.ScorePerBeat;
			}
			
			if (Input.pressed(Key.SPACE))
			{
				ArrowControlsEnabled = !ArrowControlsEnabled;
			}
			
			if (ArrowControlsEnabled)
			{
				this.processArrowControls();
			}
			else if (MouseControlsEnabled)
			{
				this.processMouseControls();
			}
			
			var currentSpeed:Number = this.MovementSpeed;
			
			if (this.isInGirlsTrail())
			{
				currentSpeed *= -1;
			}
			
			var playerDistanceFromCenter:Number = FP.halfHeight - this.centerY;
			var girlDistanceFromCenter:Number = FP.halfHeight - this.girl.centerY;
			//this.moveBy(Math.sin(this.heading) * currentSpeed, Math.cos(this.heading) * currentSpeed, "level");
			this.moveBy(0, playerDistanceFromCenter / FP.halfHeight * currentSpeed, "level");
			this.girl.moveBy(0, girlDistanceFromCenter / FP.halfHeight * currentSpeed, "level");
			//FP.camera.y += currentSpeed * 1.5;
		}
		
		private function isInGirlsTrail():Boolean
		{
			var rect:Rectangle = new Rectangle(
				this.girl.centerX - this.girl.TrailWidth / 2,
				this.girl.y - this.girl.TrailLength,
				this.girl.TrailWidth,
				this.girl.TrailLength);
				
			return rect.contains(this.centerX, this.centerY);
		}
		
		private function processMouseControls():void
		{
			if (Input.mouseDown && Input.mouseX)
			{
				var deltaX:Number = Input.mouseX < this.x ? -1 : 1;
				this.heading += deltaX * Math.PI / this.TurningSpeed;
				if (this.heading > Math.PI / 6)
				{
					this.spritemap.flipped = false;
					this.spritemap.play("walk-side");
				}
				else if (this.heading < -Math.PI / 6)
				{
					this.spritemap.flipped = true;
					this.spritemap.play("walk-side");
				}
				else
				{
					this.spritemap.flipped = false;
					this.spritemap.play("walk-forward");
				}
			}
		}
		
		private function processArrowControls():void
		{
			var deltaX:Number = 0;
			var deltaY:Number = 0;
			if (Input.check(Key.LEFT))
			{
				deltaX -= 2;
			}
			if (Input.check(Key.RIGHT))
			{
				deltaX += 2;
			}
			if (Input.check(Key.UP))
			{
				deltaY -= 2;
			}
			if (Input.check(Key.DOWN))
			{
				deltaY += 2;
			}
			
			this.moveBy(deltaX, deltaY, "level");
		}
	}
}