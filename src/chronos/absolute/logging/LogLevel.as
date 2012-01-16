package chronos.absolute.logging
{
	import chronos.absolute.core.Enum;
	import chronos.absolute.error.EnumError;

	[Enum]
	public final class LogLevel extends Enum
	{
		public static const OFF:LogLevel = new LogLevel(EnumRestrictor, "OFF", uint.MAX_VALUE);

		public static const FATAL:LogLevel = new LogLevel(EnumRestrictor, "FATAL", 6);

		public static const ERROR:LogLevel = new LogLevel(EnumRestrictor, "ERROR", 5);

		public static const WARN:LogLevel = new LogLevel(EnumRestrictor, "WARN", 4);

		public static const INFO:LogLevel = new LogLevel(EnumRestrictor, "INFO", 3);

		public static const DEBUG:LogLevel = new LogLevel(EnumRestrictor, "DEBUG", 2);

		public static const TRACE:LogLevel = new LogLevel(EnumRestrictor, "TRACE", 1);

		public function LogLevel(enumRestrictor:Class, name:String, value:uint)
		{
			super(name, value);
			if (EnumRestrictor != enumRestrictor) throw new EnumError();
		}
	}
}

internal class EnumRestrictor
{
}