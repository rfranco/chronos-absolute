package chronos.absolute.logging
{
	import chronos.absolute.error.Assert;
	import chronos.absolute.error.SingletonError;
	import chronos.absolute.logging.appender.ILogAppender;

	import flash.utils.Dictionary;

	[Singleton]
	public final class LogContext
	{
		private static  var LOG:Logger;

		private static  var _instance:LogContext;

		public static function get instance():LogContext
		{
			if (!_instance) _instance = new LogContext(SingletonEnforcer);
			return _instance;
		}

		public static function getLogger(target:*):Logger
		{
			return instance.getLogger(target);
		}

		private var _rootLogLevel:LogLevel;

		private var _appenders:Vector.<ILogAppender>;

		private var _loggers:Dictionary;

		private var _logLevels:Dictionary;

		public function LogContext(singleton:Class)
		{
			if (SingletonEnforcer != singleton) throw new SingletonError();

			_instance = this;
			_appenders = new Vector.<ILogAppender>();
			_loggers = new Dictionary();
			_logLevels = new Dictionary();
			_rootLogLevel = LogLevel.TRACE;

			LOG = getLogger(LogContext);
		}

		public function getLogger(target:*):Logger
		{
			var targetName:String = LogUtil.getLoggerName(target);

			var logger:Logger;
			if (targetName in _loggers)
			{
				return _loggers[targetName];
			}
			else
			{
				logger = createLogger(targetName);
			}
			return logger;
		}

		public function addAppender(appender:ILogAppender):void
		{
			Assert.notNull(appender, "'appender' must not null");
			_appenders.push(appender);
			LOG.info("addAppender({0})", [appender]);
		}

		public function removeAppender(appender:ILogAppender):void
		{
			Assert.notNull(appender, "'appender' must not null");
			var index:int = _appenders.indexOf(appender);
			if (index != -1)
			{
				_appenders.splice(index, 1);
				LOG.info("removeAppender({0})", [appender]);
			}
		}

		public function addLogLevel(name:Object, level:LogLevel):void
		{
			Assert.notNull(level, "'level' must not null");
			var loggerName:String = LogUtil.getLoggerName(name);
			_logLevels[loggerName] = level;
			LOG.info("addLogLevel({0})", [loggerName, level]);
		}

		public function removeLogLevel(name:Object, level:LogLevel):void
		{
			Assert.notNull(level, "'level' must not null");
			var loggerName:String = LogUtil.getLoggerName(name);
			delete _logLevels[loggerName];
			LOG.info("removeLogLevel({0})", [loggerName, level]);
		}

		public function refresh():void
		{
			for each (var logger:Logger in _loggers)
			{
				logger.level = findLevel(logger.name);
			}
		}

		private function createLogger(name:String):Logger
		{
			var level:LogLevel = findLevel(name);
			var logger:Logger = new Logger(name, level);
			_loggers[name] = logger;
			return logger;
		}

		private function findLevel(name:String):LogLevel
		{
			if (_logLevels[name]) return _logLevels[name];
			var parentNS:String = getParentNamespace(name);
			if (parentNS) return findLevel(parentNS);
			return _rootLogLevel;
		}

		private function getParentNamespace(name:String):String
		{
			var indexOf:int = name.lastIndexOf(".");
			if (indexOf == -1) return null;
			return name.substring(0, indexOf);
		}

		internal function dispatchLog(log:Log):void
		{
			var length:int = _appenders.length;
			for (var i:int = 0; i < length; i++)
			{
				_appenders[i].appendLog(log);
			}
		}

		public function get rootLogLevel():LogLevel
		{
			return _rootLogLevel;
		}

		public function set rootLogLevel(level:LogLevel):void
		{
			Assert.notNull(level, "'level' must not null");
			_rootLogLevel = level;
			LOG.info("rootLogLevel({0})", [level]);
		}

		public function toString():String
		{
			return "[LogContext]";
		}
	}
}

internal class SingletonEnforcer
{
}

