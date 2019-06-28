/**
	Say hello.
	Example inspired by ruby's "executable" lib example
**/
class Drrf extends mcli.CommandLine
{
	/**
		Say it in uppercase?
	**/
	public var loud:Bool;

	/**
		Show this message.
	**/
	public function help()
	{
		Sys.println(this.showUsage());
		Sys.exit(0);
	}

	public function runDefault(?name:String)
	{
		if(name == null)
			name = "World";
		var msg = 'Hello, $name!';
		if (loud)
			msg = msg.toUpperCase();
		Sys.println(msg);
	}

	public static function main()
	{
		new mcli.Dispatch(Sys.args()).dispatch(new Drrf());
	}

}