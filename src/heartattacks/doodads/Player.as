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

	
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Monster.png")] private var PlayerImage:Class;
		
		public var MovementSpeed:Number = 0.7;
		public var TurningSpeed:Number = 30;
		public var SpeedBonus:Number = 4;
		public var CurrentScore:uint = 0;
		public var HeartRate:Number = 1;
		public var ScorePerBeat:int = 100;
		public var MinCameraSpeed:Number = 1;
		public var MaxCameraSpeed:Number = 3;
		
		private var timeTillNextHeartBeat:Number = 0;
		private var spritemap:Spritemap;
		private var heading:Number = Math.PI / 2;
		private var radius:Number = 100;
		private var girl:Girl;
		private var heart:HeartMeter;
		private var runTime:Number = 0;
		public var isWaiting:Boolean;
		private var timeTillBonusExpires:Number = 2;
		
		public function Player(girl:Girl, heart:HeartMeter) 
		{
			super(0, 0);
			this.girl = girl;
			this.heart = heart;
			this.heading = Math.PI / 2;
			this.spritemap = new Spritemap(PlayerImage, 128, 128);
			this.spritemap.add("walk-forward", [13, 14, 15, 16], 12, true);
			this.spritemap.add("walk-side", [18, 19, 20, 21], 12, true);
			this.spritemap.add("stand-forward", [7, 8, 9, 10, 11], 12, true);
			this.spritemap.add("stand-side", [1, 2, 3, 4, 5], 12, true);
			this.spritemap.add("scared", [23, 24, 25, 26, 27, 28, 29, 30], 12, true);
			this.spritemap.add("death", [32, 33, 34, 35, 36, 37, 38, 39], 12, false);
			this.graphic = this.spritemap;
			this.spritemap.play("walk-forward");
			this.setHitbox(128, 128);
			this.layer = 2;
			this.name = "player";
		}
		
		override public function update():void
		{
			if (this.timeTillBonusExpires > 0)
			{
				this.timeTillBonusExpires -= 1 / 60;
			}
			
			this.testForMarkers();
			this.girl.percentageToBoy = this.percentageToGirl();
			var adjustedTime:Number = 1 / 60 + 2 / 60 * this.percentageToGirl();
			if (this.girl.isWaiting)
			{
				if (this.isWaiting)
				{
					this.spritemap.play("scared");
					adjustedTime += 2 / 60;
				}
				else if (this.girl.isWatching)
				{
					this.spritemap.play("death");
					this.isWaiting = true;
				}
			}
			
			this.timeTillNextHeartBeat += adjustedTime;
			if (this.timeTillNextHeartBeat >= this.HeartRate)
			{
				this.timeTillNextHeartBeat -= this.HeartRate;
				this.CurrentScore += this.ScorePerBeat;
				this.heart.beat(0.5);
				Music.heartbeat.play();
			}
			
			this.processMouseControls();
			
			this.runTime += 1 / 60;
			var currentSpeed:Number = this.MovementSpeed;
			var sign:Number = this.timeTillBonusExpires > 0 ? 1 : -1;
			
			var playerDistanceFromCenter:Number = FP.halfHeight - this.centerY;
			var playerSpeed:Number = playerDistanceFromCenter / FP.halfHeight * currentSpeed;
			var girlDistanceFromCenter:Number = FP.halfHeight - this.girl.centerY;
			var girlSpeed:Number = girlDistanceFromCenter / FP.halfHeight * currentSpeed;
			var distanceToGirl:Number = Math.pow(this.girl.x - this.x, 2) + Math.pow(this.girl.y - this.y, 2);
			var totalDistance:Number = FP.height * FP.height;
			var percentToGirl:Number = Math.min(1, Math.max(0, (totalDistance - distanceToGirl) / totalDistance));
			var deltaSpeed:Number = this.MaxCameraSpeed - this.MinCameraSpeed;			
			var cameraSpeed:Number = currentSpeed * ((deltaSpeed * this.percentageToGirl()) + this.MinCameraSpeed);
			if (this.girl.isWaiting)
			{
				cameraSpeed = 0;
			}
			
			FP.camera.y += cameraSpeed;
			if (!this.isWaiting)
			{
				this.moveBy(8 * Math.cos(this.heading) * playerSpeed, sign * Math.sin(this.heading) * playerSpeed, "level");
			}
			else
			{
				this.moveBy(0, -cameraSpeed, "level");
			}
			
			if (!this.girl.isWaiting)
			{
				this.girl.moveBy(0, sign * girlSpeed, "level");
			}
			else
			{
				this.girl.moveBy(0, -cameraSpeed, "level");
			}
			
			this.graphic.scrollY = 0;
			this.girl.graphic.scrollY = 0;
			this.heart.x = this.x;
			this.heart.y = this.y - 40;
			this.heart.graphic.scrollY = 0;
		}
		
		private function percentageToGirl():Number
		{
			var distanceToGirl:Number = Math.pow(this.girl.x - this.x, 2) + Math.pow(this.girl.y - this.y, 2);
			var totalDistance:Number = FP.height * FP.height;
			return Math.min(1, Math.max(0, (totalDistance - distanceToGirl) / totalDistance));
		}
		
		private function testForMarkers():void
		{
			var marker:Entity = this.collide("marker", this.x + FP.camera.x, this.y + FP.camera.y);
			if (marker != null)
			{
				FP.world.remove(marker);
				this.timeTillBonusExpires = 2;
			}
		}
		
		private function processMouseControls():void
		{
			if (Input.mouseDown)
			{
				if (this.isWaiting || this.collidePoint(this.x, this.y, Input.mouseX, Input.mouseY))
				{
					if (this.spritemap.currentAnim != "stand-forward" &&
						this.spritemap.currentAnim != "stand-side")
					{
						if (Math.random() > 0.33)
						{
							this.spritemap.play("stand-forward");
						}
						else
						{
							if (Math.random() > 0.5)
							{
								this.spritemap.flipped = true;
							}
							
							this.spritemap.play("stand-side");
						}
						this.isWaiting = true;
					}
				}
				else
				{
					this.isWaiting = false;
					var dx:Number = Input.mouseX - this.centerX;
					var dy:Number = Input.mouseY - this.centerY;
					var theta:Number = Math.atan2(dy, dx);
					this.heading = theta;
					if (this.heading < Math.PI / 2 - Math.PI / 8)
					{
						this.spritemap.flipped = false;
						this.spritemap.play("walk-side");
					}
					else if (this.heading > Math.PI / 2 + Math.PI / 8)
					{
						this.spritemap.flipped = true;
						this.spritemap.play("walk-side");
					}
					else if (this.spritemap.currentAnim != "walk-forward")
					{
						this.spritemap.flipped = false;
						this.spritemap.play("walk-forward");
					}
				}
			}
			else
			{
				this.isWaiting = false;
				this.heading = Math.PI / 2;
				if (this.spritemap.currentAnim != "walk-forward")
				{
					this.spritemap.play("walk-forward");
				}
			}
		}
	}
}