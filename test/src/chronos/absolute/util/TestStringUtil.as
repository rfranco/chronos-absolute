package chronos.absolute.util
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestStringUtil
	{
		public static function substituteData():Array
		{
			var data:Array = [];
			data.push(["", "", []]);
			data.push(["", "", [1, 2, 3]]);
			data.push(["Anull", "A{0}", [null]]);
			data.push(["Aundefined", "A{0}", [undefined]]);
			data.push(["A1-b2-c3", "A{0}-b{1}-c{2}", [1, 2, 3]]);
			data.push(["A3-b2-c1", "A{2}-b{1}-c{0}", [1, 2, 3]]);
			data.push(["A-b-c", "A-b-c", [1, 2, 3]]);
			data.push(["A{4}-b-c", "A{4}-b-c", [1, 2, 3]]);
			return data;
		}

		[Test(expects="chronos.absolute.error.PrivateConstructorError")]
		public function constructor():void
		{
			new StringUtil();
		}

		[Test(expects="chronos.absolute.error.NullPointerError")]
		public function substituteNull():void
		{
			StringUtil.substitute(null);
		}

		[Test(dataProvider="substituteData")]
		public function substitute(result:String, message:String, rest:Array):void
		{
			rest.unshift(message);
			assertThat(StringUtil.substitute.apply(this, rest), equalTo(result));
		}

		[Test(dataProvider="substituteData")]
		public function substituteWithArray(result:String, message:String, rest:Array):void
		{
			assertThat(StringUtil.substitute(message, rest), equalTo(result));
		}
	}
}