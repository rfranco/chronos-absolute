package chronos.absolute.collection
{
	import chronos.absolute.core.lang.ICloneable;
	import chronos.absolute.core.lang.IDisposable;

	public interface ICollection extends ICloneable, IIterable, IDisposable
	{
		/**
		 * Ensures that this collection contains the specified element.
		 * @param o
		 * @return <code>Boolean</code>
		 */
		function add(o:*):Boolean;

		/**
		 * Adds all of the elements in the specified collection to this collection.
		 * @return <code>Boolean</code>
		 */
		function addAll(c:ICollection):Boolean;

		/**
		 * Removes a single instance of the specified element from this collection, if it is present
		 * @return <code>Boolean</code>
		 */
		function remove(o:*):Boolean

		/**
		 * Removes all of this collection's elements that are also contained in the specified collectio
		 * @return <code>Boolean</code>
		 */
		function removeAll(c:ICollection):Boolean;

		/**
		 * Returns true if this collection contains the specified element.
		 * @param o
		 * @return <code>Boolean</code>
		 * 
		 */
		function contains(o:*):Boolean;

		/**
		 * Returns true if this collection contains all of the elements in the specified collection.
		 * @return <code>Boolean</code>
		 */
		function containsAll(c:ICollection):Boolean;

		/**
		 * Removes all of the elements from this collection.
		 */
		function clear():void;

		/**
		 * Returns an array containing all of the elements in this collection.
		 * @return <code>Array</code>
		 */
		function toArray():Array;

		/**
		 * Returns the number of elements in this collection.
		 * @default 0
		 */
		function get size():int;

		/**
		 * Returns true if this collection contains no elements.
		 * @return <code>Boolean</code>
		 */
		function get isEmpty():Boolean;
	}
}
