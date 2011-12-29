package chronos.absolute.collection.set
{
	import chronos.absolute.collection.ISet;

	import org.hamcrest.assertThat;

	public class TestArraySet
	{
		[Test(dataProvider="valuesData")]
		public function add(value:*):void
		{
			var c:ISet = new ArraySet();
			assertThat(c.add(value));
		}
	}
}
