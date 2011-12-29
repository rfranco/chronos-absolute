package chronos.absolute.collection.set
{
	import chronos.absolute.collection.ISet;
	import chronos.absolute.collection.collection.ArrayCollection;

	public class ArraySet extends ArrayCollection implements ISet
	{
		public function ArraySet(values:* = null)
		{
			super(values);
		}

		override public function add(o:*):Boolean
		{
			return contains(o) ? super.add(o) : false;
		}

		override public function clone():*
		{
			return new ArraySet(this);
		}
	}
}
