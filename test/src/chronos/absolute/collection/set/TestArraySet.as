package chronos.absolute.collection.set
{
	import chronos.absolute.collection.ISet;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.isTrue;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestArraySet
	{
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
		
		[Ignore]
		[Test(dataProvider="valuesData")]
		public function add(value:*):void
		{
			var c:ISet = new ArraySet();
			assertThat(c.add(value), isTrue());
		}
	}
}
