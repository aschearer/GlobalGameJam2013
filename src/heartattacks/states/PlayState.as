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
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
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
		private var level:Level;
		private var scoreLabel:Text;
		private var testGui:TestingGui;
		
		public override function begin():void
		{
			this.createLevel(null);
		}
		
		override public function update():void
		{
			super.update();
			this.scoreLabel.scrollX = 0;
			this.scoreLabel.scrollY = 0;
			this.scoreLabel.x = FP.width - this.scoreLabel.width - 10;
			this.scoreLabel.text = "Score: " + this.level.player.CurrentScore;
			
			if (Input.pressed(Key.F5))
			{
				FP.stage.removeChild(this.testGui);
				var oldPlayer:Player = this.level.player;
				this.removeAll();
				this.createLevel(oldPlayer);
			}
		}
		
		private function CanGirlSeePlayer():Boolean
		{
			var point:Point = new Point();
			var obstacle:Entity = this.collideLine(
				"level", 
				this.level.girl.x + this.level.girl.halfWidth, 
				this.level.girl.y + this.level.girl.halfHeight, 
				this.level.player.x + this.level.player.halfWidth, 
				this.level.player.y + this.level.player.halfHeight,
				1,
				point);
			
			return obstacle != null;
		}
		
		private function createLevel(oldPlayer:Player):void
		{
			this.camera.x = 0;
			this.camera.y = 0;
			this.level = new Level(MapImage, Map);
			this.add(this.level.player);
			this.add(this.level.girl);
			this.add(this.level);
			this.scoreLabel = new Text("Score: 0", FP.width - 100, 10);
			this.addGraphic(this.scoreLabel);
			if (oldPlayer != null)
			{
				this.level.player.MovementSpeed = oldPlayer.MovementSpeed;
				this.level.player.TurningSpeed = oldPlayer.TurningSpeed;
				this.level.player.SpeedBonus = oldPlayer.SpeedBonus;
				this.level.player.HeartRate = oldPlayer.HeartRate;
				this.level.player.ScorePerBeat = oldPlayer.ScorePerBeat;
				this.level.player.CameraSpeed = oldPlayer.CameraSpeed;
			}
			
			this.testGui = new TestingGui(this.level.player, this.level.girl);
			FP.stage.addChild(this.testGui);
		}
	}
}