package
{
	import suite.SuiteAll;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;
	import org.fluint.uiImpersonation.VisualTestEnvironmentBuilder;

	import flash.display.Sprite;

	[SWF(backgroundColor="#FFFFFF", frameRate="30", width="320", height="240")]
	public class Runner extends Sprite
	{
		private var core:FlexUnitCore;

		public function Runner()
		{
			VisualTestEnvironmentBuilder.getInstance(this);

			core = new FlexUnitCore();
			core.addListener(new TraceListener());
			core.run(SuiteAll);
		}
	}
}