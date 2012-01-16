package chronos.absolute.collection.collection
{
	import chronos.absolute.collection.ICollection;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestArrayCollection
	{
		public static function get collectionsData():Array
		{
			var data:Array = [];
			data.push([new ArrayCollection([1])]);
			data.push([new ArrayCollection([1, 2])]);
			data.push([new ArrayCollection([1, "a", 3])]);
			data.push([new ArrayCollection([1, "a", 3, "b"])]);
			return data;
		}

		public static function get arraysData():Array
		{
			var data:Array = [];
			data.push([[]]);
			data.push([[1]]);
			data.push([[1, 2]]);
			data.push([[1, "a", 3]]);
			return data;
		}

		public static function get valuesData():Array
		{
			var data:Array = [];
			data.push([null]);
			data.push([undefined]);
			data.push([1]);
			data.push([2]);
			data.push(["a"]);
			data.push(["b"]);
			return data;
		}

		public static function get constructorArgsData():Array
		{
			return arraysData.concat(collectionsData);
		}

		[Test(dataProvider="constructorArgsData")]
		public function constructor(values:*):void
		{
			var c:ICollection = new ArrayCollection(values);
			if (values is ICollection) values = ICollection(values).toArray();
			assertThat(c.toArray(), equalTo(values));
		}
		
		[Test]
		public function dispose():void
		{
			var c:ICollection = new ArrayCollection();
			c.dispose();
			assertThat(c.isDisposed);
		}

		[Test(dataProvider="constructorArgsData")]
		public function clone(values:*):void
		{
			var c:ICollection = new ArrayCollection(values);
			var clone:ICollection = c.clone();
			assertThat(c.toArray(), equalTo(clone.toArray()));
		}

		[Test(dataProvider="valuesData")]
		public function add(value:*):void
		{
			var c:ICollection = new ArrayCollection();
			assertThat(c.add(value));
		}

		[Test(dataProvider="collectionsData")]
		public function addAll(collection:ICollection):void
		{
			var c:ICollection = new ArrayCollection();
			assertThat(c.addAll(collection));
		}

		[Test(dataProvider="valuesData")]
		public function remove(value:*):void
		{
			var c:ICollection = new ArrayCollection();
			c.add(value);
			assertThat(c.remove(value));
		}

		[Test(dataProvider="collectionsData")]
		public function removeAll(collection:ICollection):void
		{
			var c:ICollection = new ArrayCollection();
			c.addAll(collection);
			assertThat(c.removeAll(collection));
		}

		[Test(dataProvider="valuesData")]
		public function contains(value:*):void
		{
			var c:ICollection = new ArrayCollection();
			c.add(value);
			assertThat(c.contains(value));
		}

		[Test(dataProvider="collectionsData")]
		public function containsAll(collection:ICollection):void
		{
			var c:ICollection = new ArrayCollection();
			c.addAll(collection);
			assertThat(c.containsAll(collection));
		}

		[Test(dataProvider="constructorArgsData")]
		public function clear(values:*):void
		{
			var c:ICollection = new ArrayCollection(values);
			c.clear();
			assertThat(c.size, equalTo(0));
		}

		[Test(dataProvider="constructorArgsData")]
		public function size(values:*):void
		{
			var c:ICollection = new ArrayCollection(values);

			var size:uint = 0;
			if (values is Array) size = (values as Array).length;
			if (values is ICollection) size = ICollection(values).size;

			assertThat(c.size, equalTo(size));
		}
	}
}
