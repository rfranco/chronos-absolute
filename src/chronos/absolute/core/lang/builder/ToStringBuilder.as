package chronos.absolute.core.lang.builder
{
	public final class ToStringBuilder
	{
		static private var _defaultStyle:ToStringStyle = ToStringStyle.DEFAULT_STYLE;

		static public function get defaultStyle():ToStringStyle
		{
			return _defaultStyle;
		}

		static public function set defaultStyle(defaultStyle:ToStringStyle):void
		{
			_defaultStyle = defaultStyle;
		}

		private var _target:Object;

		private var _style:ToStringStyle;

		public function ToStringBuilder(target:Object, style:ToStringStyle = null)
		{
			_target = target;
			_style = style || _defaultStyle;
		}

		public function append(fieldName:String, value:*):ToStringBuilder
		{	
			return this;
		}

		public function appendSupper(superToString:String):ToStringBuilder
		{
			return this;
		}

		public function build():String
		{
			return "";
		}

		public function toString():String
		{
			return build();
		}
	}
}
