package chronos.absolute.util
{
	import chronos.absolute.error.Assert;
	import chronos.absolute.error.PrivateConstructorError;

	public final class StringUtil
	{
		public static function substitute(message:String, ... rest):String
		{
			Assert.notNull(message, "'message' must not null");

			if (rest.length == 1 && rest[0] is Array) rest = rest[0];

			var length:int = rest.length;
			for (var i:int = 0; i < length; i++)
			{
				message = message.replace(new RegExp("\\{" + i + "\\}", "g"), rest[i]);
			}

			return message;
		}

		/** @private */
		public function StringUtil()
		{
			throw new PrivateConstructorError();
		}
	}
}
