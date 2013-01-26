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
		public var levelWidth:Number;
		public var levelHeight:Number;
		
		public function Level(tileset:Class, levelData:Class, player:Player, girl:Girl)
		{
			var level:XML = new XML(new levelData());
			this.tiles = new Tilemap(tileset, level.@width, level.@height, 50, 50);
			this.graphic = this.tiles;
			
			this.grid = new Grid(level.@width, level.@height, 50, 50);
			this.mask = this.grid;
			
			this.type = "level";
			this.layer = 10;
			this.loadLevel(level, player, girl);
			this.levelWidth = level.@width;
			this.levelHeight = level.@height;
		}
		
		private function loadLevel(level:XML, player:Player, girl:Girl):void
		{
			var dataList:XMLList = level.Layer1.tile;
			var dataElement:XML;
			for each (dataElement in dataList)
			{
				var column:uint = int(dataElement.@x);
				var row:uint = int(dataElement.@y);
				var index:uint = int(dataElement.@id);
				
				if (index == 11)
				{
					player.x = column * 50 - (player.width - 50) / 2;
					player.y = row * 50 - (player.height - 50) / 2;
					continue;
				}
				else if (index == 10)
				{
					girl.x = column * 50 - (girl.width - 50) / 2;
					girl.y = row * 50 - (girl.height - 50) / 2;
					continue;
				}
				
				this.tiles.setTile(
					column, 
					row, 
					index);
					
				this.grid.setTile(
					column,
					row,
					index > 1);
			}
		}
	}

}