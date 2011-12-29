package chronos.absolute.core
{
	import org.hamcrest.object.equalTo;
	import org.hamcrest.assertThat;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestStringBuilder
	{
		public static function get buildData():Array
		{
			var data:Array = [];
			data.push(["", ""]);
			data.push(["null", null]);
			data.push(["null", undefined]);
			data.push(["true", true]);
			data.push(["false", false]);
			data.push(["abc", "abc"]);
			data.push(["0", 0]);
			data.push(["1", 1]);
			data.push(["1.1", 1.1]);
			data.push(["-1", -1]);
			return data;
		}

		[Test(dataProvider="buildData")]
		public function constructor(result:String, value:*):void
		{
			var builder:StringBuilder = new StringBuilder(value);
			assertThat(builder.build(), equalTo(result));
		}

		[Test(dataProvider="buildData")]
		public function append(result:String, value:*):void
		{
			var builder:StringBuilder = new StringBuilder();
			builder.append(value);
			assertThat(builder.build(), equalTo(result));
		}

		[Test(dataProvider="buildData")]
		public function appendMutliTimes(result:String, value:*):void
		{
			var builder:StringBuilder = new StringBuilder();
			var resultMutli:String = "";

			var mutli:int = Math.random() * 5;
			for (var i:int = 0; i < mutli; i++)
			{
				builder.append(value);
				resultMutli += result;
			}

			assertThat(builder.build(), equalTo(resultMutli));
		}

		[Test(expects="RangeError")]
		public function insertAfterRange():void
		{
			new StringBuilder().insert(1, "");
		}

		[Test(expects="RangeError")]
		public function insertBeforeRange():void
		{
			new StringBuilder().insert(-1, "");
		}

//		[Test(dataProvider="buildData")]
//		public function insert(result:String, value:*):void
//		{
//			var builder:StringBuilder = new StringBuilder();
//			var resultMutli:String = "";
//
//			var mutli:int = Math.random() * 5;
//			for (var i:int = 0; i < mutli; i++)
//			{
//				builder.append(value);
//				resultMutli += result;
//			}
//
//			assertThat(builder.build(), equalTo(resultMutli));
//		}

		[Test(expects="RangeError")]
		public function removeAfterRange():void
		{
			new StringBuilder().remove(1);
		}

		[Test(expects="RangeError")]
		public function removeBeforeRange():void
		{
			new StringBuilder().remove(-1);
		}
		//
		// [Test(dataProvider="buildData")]
		// public function remove(result:String, value:*):void
		// {
		// var builder:StringBuilder = new StringBuilder();
		// var resultMutli:String = "";
		//
		// var mutli:int = Math.random() * 5;
		// for (var i:int = 0; i < mutli; i++)
		// {
		// builder.append(value);
		// resultMutli += result;
		// }
		//
		// assertThat(builder.build(), equalTo(resultMutli));
		// }
	}
}
