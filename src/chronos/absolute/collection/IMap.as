package chronos.absolute.collection
{
	import chronos.absolute.core.lang.ICloneable;
	import chronos.absolute.core.lang.IDisposable;

	public interface IMap extends ICloneable, IDisposable
	{
		/*
		 * Returns true if this map contains a mapping for the specified key.
		 */
		function containsKey(key:*):Boolean;

		/*
		 * Returns true if this map maps one or more keys to the specified value.
		 */
		function containsValue(value:*):Boolean;

		/*
		 * Associates the specified value with the specified key in this map.
		 */
		function put(key:*, value:*):void;

		/*
		 * Removes the mapping for a key from this map if it is present.
		 */
		function remove(key:*):void;

		/*
		 * Returns the value to which the specified key is mapped, or null if this map contains no mapping for the key.
		 */
		function getValue(key:*):*;

		/*
		 * Returns a Set view of the keys contained in this map.
		 */
		function getKeys():ISet;

		/*
		 * Returns a Collection view of the values contained in this map.
		 */
		function getValues():ICollection;

		/*
		 * Removes all of the mappings from this map.
		 */
		function clear():void;

		/*
		 * Returns true if this map contains no key-value mappings.
		 */
		function get isEmpty():Boolean;

		/*
		 * Returns the number of key-value mappings in this map.
		 */
		function get size():int;
	}
}
