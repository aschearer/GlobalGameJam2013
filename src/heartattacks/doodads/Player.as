package heartattacks.doodads 
{
	import flash.geom.Rectangle;
	import heartattacks.doodads.player.DyingState;
	import heartattacks.doodads.player.MovingState;
	import heartattacks.doodads.player.ScaredState;
	import heartattacks.doodads.player.StandingState;
	import heartattacks.doodads.states.StateMachine;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Graphiclist;

	
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Monster.png")] private var PlayerImage:Class;
		[Embed(source = "../../../res/sprites/Arrow.png")] private var ArrowImage:Class;
		
		public var MovementSpeed:Number = .7;
		public var TurningSpeed:Number = 100;
		public var SpeedBonus:Number = 3.4;
		public var HorizontalBoost:Number = 8;
		public var CurrentScore:uint = 0;
		public var HeartRate:Number = 1;
		public var ScorePerBeat:int = 100;
		public var MinCameraSpeed:Number = 3;
		public var MaxCameraSpeed:Number = 8;
		public var TurningSensitivity:Number = 60;
		
		public var HeartBeatCallback:Function;
		private var timeTillNextHeartBeat:Number = 0;
		private var spritemap:Spritemap;
		public var heading:Number = Math.PI / 2;
		private var radius:Number = 100;
		private var girl:Girl;
		private var heart:HeartMeter;
		private var runTime:Number = 0;
		private var timeTillBonusExpires:Number = 2;
		private var states:StateMachine;
	    public var distanceTraveled:Number;
		private var arrow:Image;
		
		public function Player(girl:Girl, heart:HeartMeter) 
		{
			super(0, 0);
			this.girl = girl;
			this.heart = heart;
			this.heading = Math.PI / 2;
			this.spritemap = new Spritemap(PlayerImage, 128, 128);
			this.spritemap.add("walk-forward", [13, 14, 15, 16], 12, true);
			this.spritemap.add("walk-side", [18, 19, 20, 21], 12, true);
			this.spritemap.add("walk-forward-happy", [51,52,53,54], 12, true);
			this.spritemap.add("walk-side-happy", [56,57,58,59], 12, true);
			this.spritemap.add("stand-forward", [7, 8, 9, 10, 11], 12, true);
			this.spritemap.add("stand-side", [1, 2, 3, 4, 5], 12, true);
			this.spritemap.add("scared", [23, 24, 25, 26, 27, 28, 29, 30], 12, true);
			this.spritemap.add("dying", [32, 33, 34, 35, 36, 37, 38, 39], 12, false);
			this.spritemap.play("walk-forward");
			this.arrow = new Image(ArrowImage);
			this.arrow.centerOrigin();
			this.arrow.x = 60;
			this.arrow.y = 120;
			
			this.graphic = new Graphiclist(this.arrow, this.spritemap);
			this.setHitbox(128, 128);
			this.layer = 2;
			this.name = "player";
			this.states = new StateMachine(this.spritemap);
			this.states.addState("walking-state", new MovingState(this, girl));
			this.states.addState("standing-state", new StandingState());
			this.states.addState("scared-state", new ScaredState());
			this.states.addState("dying-state", new DyingState());
		}
	
		public function get IsHappy():Boolean
		{
			return this.timeTillBonusExpires > 0;
		}
		/*
		override public function render():void 
		{
			super.render();
			var dx:Number = Math.cos(this.heading) * 50 + FP.camera.x + this.centerX;
			var dy:Number = Math.sin(this.heading) * 50 + FP.camera.y + this.centerY;
			Draw.line(this.centerX + FP.camera.x, this.centerY + FP.camera.y, dx, dy);
		}
		*/
		
		public function get isDead():Boolean
		{
			return this.states.state == "dying-state";
		}
		
		public function get CurrentTurningSensitivity():Number
		{
			return (1 - this.percentageToGirl()) * this.TurningSensitivity;
		}
			
			
		
		override public function update():void
		{
			this.states.update();
			if (this.timeTillBonusExpires > 0)
			{
				this.timeTillBonusExpires -= 1 / 60;
			}
			
			this.testForMarkers();
			this.girl.percentageToBoy = this.percentageToGirl();
			var adjustedTime:Number = 1 / 60 + 2 / 60 * this.percentageToGirl();
			
			this.timeTillNextHeartBeat += adjustedTime;
			if (this.states.state != "dying-state" && this.timeTillNextHeartBeat >= this.HeartRate)
			{
				this.timeTillNextHeartBeat -= this.HeartRate;
				this.CurrentScore += this.ScorePerBeat;
				this.heart.beat(0.5);
				if (this.HeartBeatCallback != null)
				{
					this.HeartBeatCallback();
				}
				
				Music.heartbeat.play();
			}
			
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
			distanceTraveled = FP.camera.y;

			if (this.states.state != "scared-state" && this.states.state != "dying-state")
			{
				var bonus:Number = this.timeTillBonusExpires > 0 ? this.SpeedBonus : 1;
				this.moveBy(
					this.HorizontalBoost * Math.cos(this.heading) * playerSpeed * bonus,
					sign * Math.sin(this.heading) * playerSpeed * bonus, 
					"level");
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
			
			this.arrow.angle = -(this.heading - Math.PI / 2) * 180 / Math.PI;
			
			if (this.timeTillBonusExpires > 0)
			{
				if (this.spritemap.currentAnim == "walk-forward")
				{
					this.spritemap.play("walk-forward-happy");
				}
				else if (this.spritemap.currentAnim == "walking-side")
				{
					this.spritemap.play("walk-side-happy");
				}
			}
			else
			{
				if (this.spritemap.currentAnim == "walk-forward-happy")
				{
					this.spritemap.play("walk-forward");
				}
				else if (this.spritemap.currentAnim == "walking-side-happy")
				{
					this.spritemap.play("walk-side");
				}
			}
		}
		
		public function percentageToGirl():Number
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
	}
}