using StringTools;

/**
	Drrf - Delete Recursively Redundant Files
	Recersively run through a directory and deletes files with given extension 
	with the same name as the files with the extension you want to keep.

	Example: Drrf /path/to/dir rar mp4 
**/

class Drrf extends mcli.CommandLine
{
	/**
		Starting path to search
	**/
	public var path:String;
	/**
		Extension you want to keep
	**/
	public var keep:String;
	/**
		Extension you want to delete
	**/
	public var del:String;

	/**
		Show this message.
	**/
	public function help()
	{
		Sys.println(this.showUsage());
		Sys.exit(0);
	}

	public function runDefault(path:String, keep:String, del:String)
	{
		recursiveLoop(path, keep, del);
	}

	public static function main()
	{
		new mcli.Dispatch(Sys.args()).dispatch(new Drrf());
	}

	/*
	Recursive loop through all directories / files
	*/
	private function recursiveLoop(directory:String, keepExt:String, delExt:String) {
		if (sys.FileSystem.exists(directory)) {
			for (file in sys.FileSystem.readDirectory(directory)) {
				var path = haxe.io.Path.join([directory, file]);
				if (!sys.FileSystem.isDirectory(path)) {
					var fExt:String = getFileExtension(path);
					if(fExt == keepExt) {
						var delPath = path.replace("." + keepExt, "." + delExt);
						if (sys.FileSystem.exists(delPath)) {
							sys.FileSystem.deleteFile(delPath);
						}
					}
				} else {
					var directory = haxe.io.Path.addTrailingSlash(path);
					recursiveLoop(directory, keepExt, delExt);
				}
			}
		} else {
			trace('"$directory" does not exists');
		}
	}

	private function getFileExtension(fName:String) {
		return fName.substring(fName.lastIndexOf(".")+1);
	}

}