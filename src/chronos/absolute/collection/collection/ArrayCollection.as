package chronos.absolute.collection.collection
{
	import chronos.absolute.collection.ICollection;
	import chronos.absolute.collection.IIterator;
	import chronos.absolute.collection.iterator.CollectionIterator;
	import chronos.absolute.core.lang.Disposable;

	public class ArrayCollection extends Disposable implements ICollection
	{
		protected var _list:Array;

		public function ArrayCollection(values:* = null)
		{
			switch(true)
			{
				case values is ICollection:
					_list = ICollection(values).toArray();
					break;
				case values is Array:
					_list = (values as Array).slice();
					break;
				default:
					_list = [];
			}
		}

		override public function dispose():void
		{
			_list = null;
			super.dispose();
		}

		public function clone():*
		{
			return new ArrayCollection(this);
		}

		public function add(o:*):Boolean
		{
			_list.push(o);
			return true;
		}

		public function addAll(c:ICollection):Boolean
		{
			if (!c || c.isEmpty) return false;

			var i:IIterator = c.getIterator();
			while (i.hasNext())
			{
				add(i.next());
			}
			return true;
		}

		public function remove(o:*):Boolean
		{
			var index:int = _list.indexOf(o);
			if (index == -1) return false;
			_list.splice(index, 1);
			return true;
		}

		public function removeAll(c:ICollection):Boolean
		{
			if (!c || c.isEmpty) return false;

			var i:IIterator = c.getIterator();
			while (i.hasNext())
			{
				if (!remove(i.next()))
				{
					return false;
				}
			}
			return true;
		}

		public function contains(o:*):Boolean
		{
			return _list.indexOf(o) != -1;
		}

		public function containsAll(c:ICollection):Boolean
		{
			if (!c || c.isEmpty) return false;

			var i:IIterator = c.getIterator();
			while (i.hasNext())
			{
				if (!contains(i.next()))
				{
					return false;
				}
			}
			return true;
		}

		public function getIterator():IIterator
		{
			return new CollectionIterator(this);
		}

		public function clear():void
		{
			_list.length = 0;
		}

		public function toArray():Array
		{
			return _list.slice();
		}

		public function get size():int
		{
			return _list.length;
		}

		public function get isEmpty():Boolean
		{
			return _list.length == 0;
		}

		public function toString():String
		{
			return "[ArrayCollection]";
		}
	}
}
