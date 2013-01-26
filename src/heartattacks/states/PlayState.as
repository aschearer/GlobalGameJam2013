package heartattacks.states 
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import heartattacks.doodads.Player;
	import heartattacks.doodads.Girl;
	import heartattacks.Level;
	import heartattacks.TestingGui;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import com.bit101.components.Slider;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class PlayState extends World
	{
		[Embed(source = "../../../res/tilesets/CityTiles.png")]
		private var MapImage:Class;
		
		[Embed(source = "../../../res/tilemaps/TestLevel.oel", mimeType = "application/octet-stream")]
		private var Map:Class;
		private var girl:Girl;
		private var player:Player;
		private var level:Level;
		private var scoreLabel:Text;
		
		public function PlayState()
		{
			this.girl = new Girl();
			this.add(this.girl);
			this.player = new Player(girl);
			this.add(this.player);
			this.level = new Level(MapImage, Map, this.player, this.girl);
			this.add(this.level);
			this.scoreLabel = new Text("Score: 0", FP.width - 100, 10);
			this.addGraphic(this.scoreLabel);
		}
		
		public override function begin():void
		{
			FP.stage.addChild(new TestingGui(this.player, this.girl));
		}
		
		override public function update():void
		{
			super.update();
			this.scoreLabel.scrollX = 0;
			this.scoreLabel.scrollY = 0;
			this.scoreLabel.x = FP.width - this.scoreLabel.width - 10;
			this.scoreLabel.text = "Score: " + this.player.CurrentScore;
		}
		
		private function CanGirlSeePlayer():Boolean
		{
			var point:Point = new Point();
			var obstacle:Entity = this.collideLine(
				"level", 
				this.girl.x + this.girl.halfWidth, 
				this.girl.y + this.girl.halfHeight, 
				this.player.x + this.player.halfWidth, 
				this.player.y + this.player.halfHeight,
				1,
				point);
			
			return obstacle != null;
		}
	}
}