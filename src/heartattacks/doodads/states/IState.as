package heartattacks.doodads.states 
{
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public interface IState 
	{
		function setCallback(callback:Function):void;
		function onEnter(spritemap:Spritemap):void;
		function update(spritemap:Spritemap):void;
	}
	
}