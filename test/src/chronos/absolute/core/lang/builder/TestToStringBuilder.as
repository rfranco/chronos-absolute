package chronos.absolute.core.lang.builder
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class TestToStringBuilder
	{
		[Test]
		public function constructor():void
		{
			var builder:ToStringBuilder = new ToStringBuilder(this);
			assertThat(builder.toString(), equalTo("[TestToStringBuilder]"));
		}
	}
}
