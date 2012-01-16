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

		public function insertAt(index:int, value:*):StringBuilder
		{
			Assert.inRange(index, 0, _buffer.length);
			_buffer.splice(index, 0, value);
			return this;
		}

		public function insertFirst(value:*):StringBuilder
		{
			_buffer.unshift(value);
			return this;
		}

		public function removeAt(index:int):StringBuilder
		{
			Assert.inRange(index, 0, _buffer.length - 1);
			_buffer.splice(index, 1);
			return this;
		}

		public function removeLast():StringBuilder
		{
			_buffer.pop();
			return this;
		}

		public function build():String
		{
			return _buffer.join("");
		}

		public function get length():int
		{
			return _buffer.length;
		}

		public function toString():String
		{
			return build();
		}
	}
}
