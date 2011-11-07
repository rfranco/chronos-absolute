package chronos.absolute.collection
{
	public interface IList extends ICollection
	{
		/**
		 * Inserts the specified element at the specified position in this list.
		 * @return <code>int</code>
		 */
		function addAt(index:int, o:*):Boolean;

		/**
		 * Inserts all of the elements in the specified collection into this list at the specified position.
		 * @return <code>Boolean</code>
		 */
		function addAllAt(index:int, c:ICollection):Boolean;

		/**
		 * Removes the element at the specified position in this list.
		 * @param index
		 * @return <code>Boolean</code>
		 */
		function removeAt(index:int):Boolean;

		/**
		 * Removes the elements from the specified position to outher in this list.
		 * @param index
		 * @return <code>Boolean</code>
		 */
		function removeRange(index:int, deleteCount:uint):Boolean

		/**
		 * Returns the element at the specified position in this list.
		 * @param index - index of the element to return
		 * @return the element at the specified position in this list
		 */
		function getAt(index:int):*;

		/**
		 * Replaces the element at the specified position in this list with the specified element.
		 * @param index
		 * @return <code>Boolean</code>
		 */
		function setAt(index:int, o:*):Boolean;

		/**
		 * Returns the index of the first occurrence of the specified element in this list, or -1 if this list does not contain the element.
		 * @return <code>int</code>
		 */
		function indexOf(o:*, fromIndex:uint = 0):int;

		/**
		 * Returns the index of the last occurrence of the specified element in this list, or -1 if this list does not contain the element.
		 * @return <code>int</code>
		 */
		function lastIndexOf(o:*, fromIndex:uint = uint.MAX_VALUE):int;
	}
}
