package chronos.absolute.util
{
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;

	import flash.display.Sprite;

	[RunWith("org.flexunit.runners.Parameterized")]
	public class TestClassUtil
	{
		public static function get constructorArgsData():Array
		{
			var data:Array = [];
			data.push([]);
			data.push([1]);
			data.push([1, 2]);
			data.push([1, 2, 3]);
			data.push([1, 2, 3, 4]);
			data.push([1, 2, 3, 4, 5]);
			data.push([1, 2, 3, 4, 5, 6]);
			data.push([1, 2, 3, 4, 5, 6, 7]);
			data.push([1, 2, 3, 4, 5, 6, 7, 8]);
			return data;
		}

		public function TestClassUtil(... args)
		{
		}

		[Test(expects="chronos.absolute.error.PrivateConstructorError")]
		public function constructor():void
		{
			new ClassUtil();
		}

		[Test(expects="chronos.absolute.error.NullPointerError")]
		public function createByNameNull():void
		{
			ClassUtil.createByName(null);
		}

		[Test(expects="ArgumentError")]
		public function createByNameWithMore8Params():void
		{
			ClassUtil.createByName("chronos.absolute.util.TestClassUtil", 1, 2, 3, 4, 5, 6, 7, 8, 9);
		}

		[Test(expects="ArgumentError")]
		public function createByNameWithArrayMore8Params():void
		{
			ClassUtil.createByName("chronos.absolute.util.TestClassUtil", [1, 2, 3, 4, 5, 6, 7, 8, 9]);
		}

		[Test(dataProvider="constructorArgsData")]
		public function createByName(... args):void
		{
			args.unshift("chronos.absolute.util.TestClassUtil");
			assertThat(ClassUtil.createByName.apply(this, args), isA(TestClassUtil));
		}

		[Test(dataProvider="constructorArgsData")]
		public function createByNameWithArray(... args):void
		{
			assertThat(ClassUtil.createByName("chronos.absolute.util.TestClassUtil", args), isA(TestClassUtil));
		}

		[Test(expects="chronos.absolute.error.NullPointerError")]
		public function createNewInstanceNull():void
		{
			ClassUtil.createNewInstance(null);
		}

		[Test(expects="ArgumentError")]
		public function createNewInstanceWithMore8Params():void
		{
			ClassUtil.createNewInstance(TestClassUtil, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
		}

		[Test(expects="ArgumentError")]
		public function createNewInstanceWithArrayMore8Params():void
		{
			ClassUtil.createNewInstance(TestClassUtil, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
		}

		[Test(dataProvider="constructorArgsData")]
		public function createNewInstance(... args):void
		{
			args.unshift(TestClassUtil);
			assertThat(ClassUtil.createNewInstance.apply(this, args), isA(TestClassUtil));
		}

		[Test(dataProvider="constructorArgsData")]
		public function createNewInstanceWithArray(... args):void
		{
			assertThat(ClassUtil.createNewInstance(TestClassUtil, args), isA(TestClassUtil));
		}

		[Test]
		public function getName():void
		{
			assertThat(ClassUtil.getName(String), equalTo("String"));
			assertThat(ClassUtil.getName(Sprite), equalTo("flash.display.Sprite"));
			assertThat(ClassUtil.getName(TestClassUtil), equalTo("chronos.absolute.util.TestClassUtil"));
		}

		[Test]
		public function getSimpleName():void
		{
			assertThat(ClassUtil.getSimpleName(String), equalTo("String"));
			assertThat(ClassUtil.getSimpleName(Sprite), equalTo("Sprite"));
			assertThat(ClassUtil.getSimpleName(TestClassUtil), equalTo("TestClassUtil"));
		}
	}
}

