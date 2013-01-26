package heartattacks.states 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import heartattacks.doodads.Player;
	import heartattacks.Level;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	
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
		
		private var player:Player;
		private var level:Level;
		
		public function PlayState()
		{
			this.player = new Player(300, 500);
		    this.add(this.player);
			
			this.level = new Level(MapImage, Map);
			this.add(this.level);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}