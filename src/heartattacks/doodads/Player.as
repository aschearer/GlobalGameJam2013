package heartattacks.doodads 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Sheet.png")] private var PlayerImage:Class;
		
		private var MouseControlsEnabled:Boolean = true;
		private var ArrowControlsEnabled:Boolean = false;
		
		public var MovementSpeed:Number = 0.8;
		public var TurningSpeed:Number = 128;
		public var SpeedBonus:Number = 2;
		
		private var spritemap:Spritemap;
		private var heading:Number;
		private var radius:Number = 100;
		private var girl:Girl;
		
		public function Player(x:Number, y:Number, girl:Girl) 
		{
			super(x, y);
			this.girl = girl;
			this.heading = 0;
			this.spritemap = new Spritemap(PlayerImage, 25, 29);
			this.spritemap.add("walk", [0, 1], 4, true);
			this.graphic = this.spritemap;
			this.spritemap.play("walk");
			this.setHitbox(25, 29);
			this.layer = 2;
		}
		
		override public function update():void
		{
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
				currentSpeed *= this.SpeedBonus;
			}
			
			this.moveBy(Math.sin(this.heading) * currentSpeed, Math.cos(this.heading) * currentSpeed, "level");
			this.spritemap.angle = this.heading * 180 / Math.PI;
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