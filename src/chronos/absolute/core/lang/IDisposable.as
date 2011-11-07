package chronos.absolute.core.lang
{
	/**
	 * Interface that every class has to implement if memory management is important.
	 */
	public interface IDisposable
	{
		/**
		 * free memory for garbage collection.
		 */
		function dispose():void;

		function get isDisposed():Boolean;
	}
}