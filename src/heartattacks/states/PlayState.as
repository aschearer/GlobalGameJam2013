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
		[Embed(source = "../../../res/tilesets/Tiles.png")]
		private var MapImage:Class;
		
		[Embed(source = "../../../res/tilemaps/TestLevel.oel", mimeType = "application/octet-stream")]
		private var Map:Class;
		private var girl:Girl;
		private var player:Player;
		private var level:Level;
		
		public function PlayState()
		{
			this.girl = new Girl(300, 500);
			this.add(this.girl);
			this.player = new Player(300, 500, girl);
			this.add(this.player);
			this.level = new Level(MapImage, Map, this.player, this.girl);
			this.add(this.level);
		}
		
		public override function begin():void
		{
			FP.stage.addChild(new TestingGui(this.player));
		}
		
		override public function update():void
		{
			super.update();
			this.cameraMove();
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
		
		public function cameraMove():void {
			//SX e DX
			if (player.x > FP.width * 0.5 && player.x < this.level.levelWidth - FP.width * 0.5)
				FP.camera.x = player.x - FP.width * 0.5;
			else {
				if (player.x <= FP.width * 0.5)
					FP.camera.x = 0;
				if (player.x >= this.level.levelWidth - FP.width * 0.5)
					FP.camera.x = this.level.levelWidth -FP.width;
			}
			
			//Sotto
			if (player.y < this.level.levelHeight - FP.height * 0.5)
				FP.camera.y = player.y - FP.height *0.5;
			else
				FP.camera.y = this.level.levelHeight - FP.height;
			
		}
	}
}