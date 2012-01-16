package chronos.absolute.core.lang.builder
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class TestToStringBuilder
	{
		private var _builder:ToStringBuilder;

		private var _style:ToStringStyle;

		[Before]
		public function before():void
		{
			_builder = new ToStringBuilder(this);
			_style = ToStringBuilder.defaultStyle;
		}

		[Test]
		public function constructor():void
		{
			var result:String = "TestToStringBuilder";
			assertThat(_builder.build(), equalTo(result));
		}

		[Test]
		public function append():void
		{
			var appends:String = buildAppends(_builder);
			assertThat(_builder.build(), equalTo("TestToStringBuilder" + appends));
		}

		[Test]
		public function appendSupper():void
		{
			var appends:String = buildAppends(new ToStringBuilder(null));
			_builder.appendSupper("Super" + appends);
			assertThat(_builder.build(), equalTo("TestToStringBuilder" + appends));
		}

		private function buildAppends(builder:ToStringBuilder):String
		{
			var result:String = _style.contentStart;

			result += buildAppend(builder, "string", "abc");
			result += _style.fieldSeparator;

			result += buildAppend(builder, "int", 1);
			result += _style.fieldSeparator;

			result += buildAppend(builder, "number", 1.5);
			result += _style.contentEnd;

			return result;
		}

		private function buildAppend(builder:ToStringBuilder, fieldName:String, value:*):String
		{
			builder.append(fieldName, value);
			var result:String = fieldName + _style.fieldNameValueSeparator + value;
			return result;
		}
	}
}
