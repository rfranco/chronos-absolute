package chronos.absolute.logging
{
	import chronos.absolute.error.PrivateConstructorError;
	import chronos.absolute.util.ClassUtil;

	public final class LogUtil
	{
		public static function getLoggerName(object:*):String
		{
			if (object is Class)
			{
				return ClassUtil.getName(object);
			}
			return object["toString"]();
		}

		/** @private */
		public function LogUtil()
		{
			throw new PrivateConstructorError();
		}
	}
}
