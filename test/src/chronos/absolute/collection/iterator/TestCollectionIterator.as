package chronos.absolute.collection.iterator
{
	import chronos.absolute.collection.ICollection;
	import chronos.absolute.collection.IIterator;
	import chronos.absolute.collection.collection.ArrayCollection;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestCollectionIterator
	{
		[Parameters]
		public static function get valuesData():Array
		{
			var data:Array = [];
			data.push([[]]);
			data.push([[1]]);
			data.push([[1, 2]]);
			data.push([[1, 2, 3]]);
			data.push([["a"]]);
			data.push([["a", "b"]]);
			data.push([["a", "b", "c"]]);
			data.push([[1, "a", 3, "b"]]);
			data.push([[1, 2.2, "a", null, undefined]]);
			return data;
		}

		private var _c:ICollection;

		private var _args:Array;

		public function TestCollectionIterator(values:Array)
		{
			_args = values;
			_c = new ArrayCollection(values);
		}

		[Test]
		public function dispose():void
		{
			var i:IIterator = _c.getIterator();
			i.dispose();
			assertThat(i.isDisposed, equalTo(true));
		}

		[Test]
		public function hasNext():void
		{
			var i:IIterator = _c.getIterator();

			var count:int = 0;
			while (i.hasNext())
			{
				i.next();
				count++;
			}
			assertThat(_c.size, equalTo(count));
		}

		[Test]
		public function next():void
		{
			var i:IIterator = _c.getIterator();

			var result:Array = [];
			while (i.hasNext())
			{
				result.push(i.next());
			}
			assertThat(result, equalTo(_args));
		}

		[Test]
		public function hasPrevious():void
		{
			var i:IIterator = _c.getIterator();
			i.end();

			var count:int = 0;
			while (i.hasPrevious())
			{
				i.previous();
				count++;
			}
			assertThat(_c.size, equalTo(count));
		}

		[Test]
		public function previous():void
		{
			var i:IIterator = _c.getIterator();
			i.end();

			var result:Array = [];
			while (i.hasPrevious())
			{
				result.unshift(i.previous());
			}
			assertThat(result, equalTo(_args));
		}

		[Test]
		public function index():void
		{
			var i:IIterator = _c.getIterator();
			var count:int = -1;

			while (i.hasNext())
			{
				i.next();
				count++;
				assertThat(i.index, equalTo(count));
			}

			while (i.hasPrevious())
			{
				i.previous();
				count--;
				assertThat(i.index, equalTo(count));
			}
		}
	}
}
