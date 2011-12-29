package chronos.absolute.core
{
	import chronos.absolute.error.Assert;

	public final class StringBuilder
	{
		private var _buffer:Vector.<String>;

		public function StringBuilder(... rest)
		{
			_buffer = new Vector.<String>();

			if (rest.length == 1 && rest[0] is Array) rest = rest[0];

			var length:int = rest.length;
			for (var i:int = 0; i < length; i++)
			{
				append(rest[i]);
			}
		}

		public function append(value:*):StringBuilder
		{
			_buffer.push(value);
			return this;
		}

		public function insert(index:int, value:*):StringBuilder
		{
			Assert.inRange(index, 0, _buffer.length);
			_buffer.splice(index, 0, value);
			return this;
		}

		public function remove(index:int):StringBuilder
		{
			Assert.inRange(index, 0, _buffer.length);
			_buffer.splice(index, 1);
			return this;
		}

		public function build():String
		{
			return _buffer.join("");
		}

		public function toString():String
		{
			return build();
		}
	}
}
