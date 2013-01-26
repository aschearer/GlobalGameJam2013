package heartattacks 
{
	import flash.utils.ByteArray;
	import heartattacks.doodads.Girl;
	import heartattacks.doodads.Player;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class Level extends Entity
	{
		private var tiles:Tilemap;
		private var grid:Grid;
		private var tileSize:int = 64;
		public var levelWidth:Number;
		public var levelHeight:Number;
		public var player:Player;
		public var girl:Girl;
		
		public function Level(tileset:Class, levelData:Class)
		{
			this.girl = new Girl();
			this.player = new Player(this.girl);
			var level:XML = new XML(new levelData());
			this.tiles = new Tilemap(tileset, level.@width, level.@height, tileSize, tileSize);
			this.graphic = this.tiles;
			
			this.grid = new Grid(level.@width, level.@height, tileSize, tileSize);
			this.mask = this.grid;
			
			this.type = "level";
			this.layer = 10;
			this.loadLevel(level);
			this.levelWidth = level.@width;
			this.levelHeight = level.@height;
		}
		
		private function loadLevel(level:XML):void
		{
			var dataList:XMLList = level.Layer1.tile;
			var dataElement:XML;
			for each (dataElement in dataList)
			{
				var column:uint = int(dataElement.@x);
				var row:uint = int(dataElement.@y);
				var index:uint = int(dataElement.@id);
				
				if (index == 10)
				{
					player.x = column * tileSize - (player.width - tileSize) / 2;
					player.y = row * tileSize - (player.height - tileSize) / 2;
					continue;
				}
				else if (index == 14)
				{
					girl.x = column * tileSize - (girl.width - tileSize) / 2;
					girl.y = row * tileSize - (girl.height - tileSize) / 2;
					continue;
				}
				
				this.tiles.setTile(
					column, 
					row, 
					index);
					
				this.grid.setTile(
					column,
					row,
					index < 7);
			}
		}
	}

}