package chronos.absolute.core.lang.builder
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	import chronos.absolute.core.StringBuilder;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestToStringStyle
	{
		public static function get targetData():Array
		{
			var data:Array = [];
			data.push(["String", new String()]);
			data.push(["Object", new Object()]);
			data.push(["Array", new Array()]);
			data.push(["Number", 1.1]);
			data.push(["int", 1]);
			data.push(["Date", new Date()]);
			return data;
		}

		public static function get fieldData():Array
		{
			var data:Array = [];
			data.push(["", ""]);
			data.push(["null", null]);
			data.push(["boolean", true]);
			data.push(["boolean", false]);
			data.push(["string", "abc"]);
			data.push(["zero", 0]);
			data.push(["int", 1]);
			data.push(["number", 1.1]);
			data.push(["int", -1]);
			return data;
		}

		public static function get toStringData():Array
		{
			var data:Array = [];
			data.push(["", ""]);
			data.push(["", "[]"]);
			data.push(["", "className[]"]);
			data.push(["s:a,", "className[s:a]"]);
			data.push(["s:a,n:1,", "className[s:a,n:1]"]);
			return data;
		}

		private var _builder:StringBuilder;

		private var _style:ToStringStyle = ToStringStyle.DEFAULT_STYLE;

		[Before]
		public function before():void
		{
			_builder = new StringBuilder();
		}

		[Test(dataProvider="targetData")]
		public function appendStart(name:String, target:Object):void
		{
			_style.appendStart(_builder, target);

			var result:String = name + _style.contentStart;
			assertThat(_builder.build(), equalTo(result));
		}

		[Test(dataProvider="fieldData")]
		public function append(name:String, value:*):void
		{
			_style.append(_builder, name, value);

			var result:String = name + _style.fieldNameValueSeparator + value + _style.fieldSeparator;
			assertThat(_builder.build(), equalTo(result));
		}

		[Test(dataProvider="fieldData")]
		public function appendEnd(name:String, value:*):void
		{
			_style.append(_builder, name, value);
			_style.appendEnd(_builder);

			var result:String = name + _style.fieldNameValueSeparator + value + _style.contentEnd;

			assertThat(_builder.build(), equalTo(result));
		}

		[Test(dataProvider="toStringData")]
		public function appendSuper(result:String, toString:String):void
		{
			_style.appendSuper(_builder, toString);
			assertThat(_builder.build(), equalTo(result));
		}

		[Test(dataProvider="toStringData")]
		public function appendToString(result:String, toString:String):void
		{
			_style.appendToString(_builder, toString);
			assertThat(_builder.build(), equalTo(result));
		}
	}
}
