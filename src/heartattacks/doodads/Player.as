package heartattacks.doodads 
{
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
		
		private const Speed:Number = 0.8;
		private const Torque:Number = 128;
		private var MouseControlsEnabled:Boolean = true;
		private var ArrowControlsEnabled:Boolean = false;
		
		public var MovementSpeed:Number;
		public var TurningSpeed:Number;
		
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
			this.MovementSpeed = Speed;
			this.TurningSpeed = Torque;
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
			var distanceToGirl:Number = Math.sqrt(Math.pow((girl.x - this.x), 2) + Math.pow((girl.y - this.y), 2));
			if (distanceToGirl < this.radius)
			{
				currentSpeed *= 2;
			}
			this.moveBy(Math.sin(this.heading) * currentSpeed, Math.cos(this.heading) * -currentSpeed, "level");
			this.spritemap.angle = this.heading * 180 / Math.PI;
		}
		
		private function processMouseControls():void
		{
			if (Input.mouseDown && Input.mouseX)
			{
				var deltaX:Number = Input.mouseX < this.x ? -1 : 1;
				this.heading += deltaX * Math.PI / this.TurningSpeed;
			}
		}
		
		public override function render():void
		{
			super.render();
			Draw.circle(this.girl.centerX, this.girl.centerY, this.radius);
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