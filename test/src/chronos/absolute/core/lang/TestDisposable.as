package chronos.absolute.core.lang
{
	import org.hamcrest.object.equalTo;
	import org.hamcrest.assertThat;

	public class TestDisposable
	{
		[Test]
		public function isNotDisposed():void
		{
			var disposable:IDisposable = new Disposable();
			assertThat(disposable.isDisposed, equalTo(false));
		}

		[Test]
		public function isDisposed():void
		{
			var disposable:IDisposable = new Disposable();
			disposable.dispose();
			assertThat(disposable.isDisposed, equalTo(true));
		}
	}
}
