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
		
		public var MovementSpeed:Number = 2;
		public var TurningSpeed:Number = 128;
		public var SpeedBonus:Number = 4;
		public var CurrentScore:uint = 0;
		public var HeartRate:Number = 60 / 60;
		public var ScorePerBeat:int = 100;
		public var CameraSpeed:Number = 1.5;
		
		private var timeTillNextHeartBeat:Number = 0;
		private var spritemap:Spritemap;
		private var heading:Number = Math.PI / 2;
		private var radius:Number = 100;
		private var girl:Girl;
		private var heart:HeartMeter;
		
		public function Player(girl:Girl, heart:HeartMeter) 
		{
			super(0, 0);
			this.girl = girl;
			this.heart = heart;
			this.heading = Math.PI / 2;
			this.spritemap = new Spritemap(PlayerImage, 128, 128);
			this.spritemap.add("walk-forward", [13, 14, 15, 16], 12, true);
			this.spritemap.add("walk-side", [18,19,20,21], 12, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(128, 128);
			this.layer = 2;
		}
		
		override public function render():void
		{
			super.render();
			var dx:Number = centerX + Math.cos(this.heading) * 100;
			var dy:Number = centerY + Math.sin(this.heading) * 100;
			Draw.line(this.centerX, this.centerY + FP.camera.y, dx, dy + FP.camera.y);
		}
		
		override public function update():void
		{
			this.timeTillNextHeartBeat += 1 / 60;
			if (this.timeTillNextHeartBeat >= this.HeartRate)
			{
				this.timeTillNextHeartBeat -= this.HeartRate;
				this.CurrentScore += this.ScorePerBeat;
				this.heart.beat(0.5);
			}
			
			if (Input.pressed(Key.SPACE))
			{
				MouseControlsEnabled = !MouseControlsEnabled;
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
			var sign:Number = this.isInGirlsTrail() ? 1 : -1;
			
			var playerDistanceFromCenter:Number = FP.halfHeight - this.centerY;
			var playerSpeed:Number = playerDistanceFromCenter / FP.halfHeight * currentSpeed;
			var girlDistanceFromCenter:Number = FP.halfHeight - this.girl.centerY;
			var girlSpeed:Number = girlDistanceFromCenter / FP.halfHeight * currentSpeed;
			this.moveBy(Math.cos(this.heading) * playerSpeed, sign * Math.sin(this.heading) * playerSpeed, "level");
			this.girl.moveBy(0, sign * girlSpeed, "level");
			FP.camera.y += currentSpeed * this.CameraSpeed;
			this.graphic.scrollY = 0;
			this.girl.graphic.scrollY = 0;
			this.heart.x = this.x;
			this.heart.y = this.y - 40;
			this.heart.graphic.scrollY = 0;
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
				var deltaX:Number = Input.mouseX < this.x ? 1 : -1;
				this.heading += deltaX * Math.PI / this.TurningSpeed;
				if (this.heading < Math.PI / 2 - Math.PI / 6)
				{
					this.spritemap.flipped = false;
					this.spritemap.play("walk-side");
				}
				else if (this.heading > Math.PI / 2 + Math.PI / 6)
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