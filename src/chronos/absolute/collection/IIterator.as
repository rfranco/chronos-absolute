package chronos.absolute.collection
{
	import chronos.absolute.core.lang.IDisposable;

	public interface IIterator extends IDisposable
	{
		/**
		 * Returns true if the iteration has more elements.
		 * @return <code>Boolean</code>
		 */
		function hasNext():Boolean;

		/**
		 * Returns the next element in the iteration.
		 * @return <code>*</code>
		 */
		function next():*;

		/**
		 * Returns true if this list iterator has more elements when traversing the list in the reverse direction.
		 * @return <code>Boolean</code>
		 */
		function hasPrevious():Boolean;

		/**
		 * Returns the previous element in the list and moves the cursor position backwards.
		 * @return <code>*</code>
		 */
		function previous():*;

		/**
		 * Moves the iterator to the first item in the collection.
		 */
		function start():void;

		/**
		 * Moves the iterator to the last item in the collection.
		 */
		function end():void;

		/**
		 * Returns the index of the current element.
		 * @return <code>int</code>
		 */
		function get index():int;
	}
}
