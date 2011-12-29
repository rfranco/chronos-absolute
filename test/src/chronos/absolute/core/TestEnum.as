package chronos.absolute.core
{
	import org.hamcrest.object.equalTo;
	import org.hamcrest.assertThat;

	public class TestEnum
	{
		[Test]
		public function constructor():void
		{
			var name:String = "enumTest";
			var value:int = 1;

			var enum:Enum = new Enum(name, value);

			assertThat(enum.name, equalTo(name));
			assertThat(enum.value, equalTo(value));
		}
	}
}
