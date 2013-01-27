package heartattacks.doodads.states 
{
	
	/**
	 * ...
	 * @author The Heart Attacks
	 */
	public interface IState 
	{
		function setCallback(callback:Function):void;
		function get animationName():String;
		function onEnter():void;
		function update():void;
	}
	
}