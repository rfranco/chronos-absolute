package chronos.absolute.core.lang
{
	public class Disposable implements IDisposable
	{
		private var _isDisposed:Boolean;

		public function Disposable()
		{
		}

		public function dispose():void
		{
			_isDisposed = true;
		}

		public final function get isDisposed():Boolean
		{
			return _isDisposed;
		}
	}
}