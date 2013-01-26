package heartattacks 
{
	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Panel;
	import com.bit101.components.Slider;
	import flash.events.Event;
	import heartattacks.doodads.Girl;
	import heartattacks.doodads.Player;
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public class TestingGui extends Panel
	{
		private var movementSpeedSlider:HUISlider;
		private var player:Player;
		private var girl:Girl;
		
		public function TestingGui(player:Player, girl:Girl) 
		{
			this.player = player;
			this.girl = girl;
			
			this.width = 240;
			this.height = 180;
			
			this.AddSlider(
				"Movement Speed",
				10,
				10,
				0.2,
				3,
				this.player.MovementSpeed,
				this.OnMovementSpeed);
				
			this.AddSlider(
				"Turning Speed",
				10,
				30,
				100,
				500,
				600 - this.player.TurningSpeed,
				this.OnTurningSpeed);
				
			this.AddSlider(
				"Speed Bonus",
				10,
				50,
				2,
				10,
				this.player.SpeedBonus,
				this.OnSpeedBonus);
				
			this.AddSlider(
				"Trail Width",
				10,
				70,
				10,
				60,
				this.girl.TrailWidth,
				this.OnTrailWidth);
				
			this.AddSlider(
				"Trail Length",
				10,
				90,
				40,
				440,
				this.girl.TrailLength,
				this.OnTrailLength);
		}
		
		private function AddSlider(label:String, x:int, y:int, min:Number, max:Number, current:Number, handler:Function):void
		{
			var slider:HUISlider  = new HUISlider(null, x, y, label, handler);
			slider.minimum = min;
			slider.maximum = max;
			slider.value = current;
			this.addChild(slider);
		}
		
		private function OnMovementSpeed(e:Event):void
		{
			var slider:HUISlider = HUISlider(e.target);
			this.player.MovementSpeed = slider.value;
		}
		
		private function OnSpeedBonus(e:Event):void
		{
			var slider:HUISlider = HUISlider(e.target);
			this.player.SpeedBonus = slider.value;
		}
		
		private function OnTurningSpeed(e:Event):void
		{
			var slider:HUISlider = HUISlider(e.target);
			this.player.TurningSpeed = 600 - slider.value;
		}
		
		private function OnTrailWidth(e:Event):void
		{
			var slider:HUISlider = HUISlider(e.target);
			this.girl.TrailWidth = slider.value;
		}
		
		private function OnTrailLength(e:Event):void
		{
			var slider:HUISlider = HUISlider(e.target);
			this.girl.TrailLength = slider.value;
		}
	}
}