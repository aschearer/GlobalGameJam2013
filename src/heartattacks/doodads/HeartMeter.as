package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import com.greensock.TweenLite;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class HeartMeter extends Entity
	{
		[Embed(source = "../../../res/spritesheets/HeartBeat.png")] private var HeartBeatImage:Class;
		
		private var spriteMap:Spritemap;
		private var label:Text;
		
		public function HeartMeter()
		{
			this.spriteMap = new Spritemap(HeartBeatImage, 120, 74);
			this.spriteMap.add("love", [ 0, 1, 2, 3, 4, 5, 6 ], 12, false);
			this.label = new Text("+100", 100, 50);
			this.graphic = new Graphiclist(this.spriteMap, this.label);
			this.graphic.visible = false;
		}
		
		public override function update():void
		{
			if (this.spriteMap.complete)
			{
				this.graphic.visible = false;
			}
		}
		
		public function beat(opacity:Number):void
		{
			this.graphic.visible = true;
			this.spriteMap.alpha = opacity;
			this.spriteMap.setAnimFrame("love", 0);
			this.spriteMap.play("love");
			
			this.label.y = 50;
			this.label.alpha = 1;
			TweenLite.to(this.label, 1, { y: 30, alpha: 0 } );
		}
	}
}