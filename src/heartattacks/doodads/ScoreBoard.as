package heartattacks.doodads 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.FP;
	import com.greensock.TweenMax;

	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class ScoreBoard extends Entity
	{
		[Embed(source = "../../../res/sprites/ScorePanel.png")] private var ScorePanelImage:Class;
		[Embed(source = "../../../res/sprites/HeartBox.png")] private var HeartBoxImage:Class;
		[Embed(source = "../../../res/sprites/Heart.png")] private var HeartImage:Class;
		
		private var label:Text;
		private var background:Image;
		private var heartBox:Image;
		private var heart:Image;
		private var player:Player;
		
		public function ScoreBoard(player:Player) 
		{
			this.player = player;
			this.player.HeartBeatCallback = this.OnHeartBeat;
			this.label = new Text("1,234", 12, 9, { "size": 24 });
			this.background = new Image(ScorePanelImage);
			this.heartBox = new Image(HeartBoxImage);
			this.heartBox.originX = this.heartBox.width / 2;
			this.heartBox.originY = this.heartBox.height / 2;
			this.heartBox.x = 60;
			this.heartBox.y = 80;
			this.heart = new Image(HeartImage);
			this.heart.originX = this.heart.width / 2;
			this.heart.originY = this.heart.height / 2;
			this.heart.x = 60;
			this.heart.y = 80;
			this.graphic = new Graphiclist(this.background, this.label, this.heartBox, this.heart);
			this.x = 800 - 119;
			this.y = 10;
		}
		
		private function OnHeartBeat():void
		{
			var percent:Number = this.player.percentageToGirl() / 3;
			TweenMax.to(this.heart, 0.1, { scale: 1.1 + percent, yoyo: true, repeat: 1 } );
			TweenMax.to(this.heartBox, 0.1, { scale: 1.1 + percent, yoyo: true, repeat: 1 });
		}
		
		override public function update():void 
		{
			this.label.text = this.player.CurrentScore.toString();
			this.graphic.scrollY = 0;
		}
	}

}