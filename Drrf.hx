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

/*
Recursive loop through all directories / files
function recursiveLoop(directory:String = "path/to/") {
  if (sys.FileSystem.exists(directory)) {
    trace("directory found: " + directory);
    for (file in sys.FileSystem.readDirectory(directory)) {
      var path = haxe.io.Path.join([directory, file]);
      if (!sys.FileSystem.isDirectory(path)) {
        trace("file found: " + path);
        // do something with file
      } else {
        var directory = haxe.io.Path.addTrailingSlash(path);
        trace("directory found: " + directory);
        recursiveLoop(directory);
      }
    }
  } else {
    trace('"$directory" does not exists');
  }
}

*/