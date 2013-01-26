package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	 
	public class Player extends Entity
	{
		[Embed(source = "../../../res/spritesheets/Sheet.png")] private var PlayerImage:Class;
		

		private const Torque:Number = 128;	
		private var spritemap:Spritemap;
		private var heading:Number;
		private var radius:Number = 30;
		private var girl:Girl;
		private var Speed:Number = 0.8;
		
		
		public function Player(x:Number, y:Number ) 
		{
			super(x, y);
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
			if (Input.mouseDown && Input.mouseX)
			{
				var deltaX:Number = Input.mouseX < this.x ? -1 : 1;
				this.heading += deltaX * Math.PI / Torque;
			}
			
			this.moveBy(Math.sin(this.heading) * Speed, Math.cos(this.heading) * -Speed, "level");
			
			var girl:Girl = collide("Girl", x, y) as Girl;
			
			if(girl != null && girl.distanceToPoint(x,y,true)<=25)
			{
				this.Speed * 2;
				
				if(girl != null && girl.distanceToPoint(x, y, true) > 25 )
				{
					this.Speed = 0.8;
					}
				
		    }
			
			
			
		}
		
		
	
			
	}

}