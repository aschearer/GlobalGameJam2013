package heartattacks.Objects 
{
	import heartattacks.doodads.Music;
    import net.flashpunk.FP;
    import flash.geom.Rectangle;
	import heartattacks.states.MenuState;
	import heartattacks.states.PlayState;
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
	public class VictoryMov extends Entity
	{
		[Embed(source = "../../../res/Cutscenes/endingframe.png")] private var endingMov:Class;
		private var spritemap:Spritemap;
		
		public function VictoryMov(x:Number, y:Number) 
		{
			super(x, y);
			this.spritemap = new Spritemap(endingMov, 800, 600);
			this.spritemap.add("end", [0, 1, 2, 3, 4, 5, 6, 7], 0.6, false)
			this.graphic = this.spritemap;
			this.setHitbox(800, 600);
			this.layer = 2;
		    Music.gameover.play();
		}
		
		override public function render():void 
		{
			super.render();
			
			this.spritemap.play("end")
		}
		
		override public function update():void
		{
			super.update();
			
			if (spritemap.frame == 7 && Input.mousePressed)
			{
			
				FP.world = new MenuState();
			}
	
    	}
	}

}