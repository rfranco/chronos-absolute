package chronos.absolute.collection.iterator
{
	import chronos.absolute.collection.ICollection;
	import chronos.absolute.collection.IIterator;
	import chronos.absolute.core.lang.Disposable;

	[ExcludeClass]
	public class CollectionIterator extends Disposable implements IIterator
	{
		private var _field:Array;

		private var _n:int;

		private var _pointer:int;

		public function CollectionIterator(c:ICollection)
		{
			_field = c.toArray();
			_n = _field.length;
			_pointer = -1;
		}

		override public function dispose():void
		{
			_field = null;
			super.dispose();
		}

		public function hasNext():Boolean
		{
			return _pointer < _n - 1;
		}

		public function next():*
		{
			return _field[++_pointer];
		}

		public function hasPrevious():Boolean
		{
			return _pointer > 0;
		}

		public function previous():*
		{
			return _field[--_pointer];
		}

		public function start():void
		{
			_pointer = -1;
		}

		public function end():void
		{
			_pointer = _n;
		}

		public function get index():int
		{
			return _pointer;
		}
	}
}
