package;

import flixel.FlxBasic;
import flixel.FlxG;

class VideoHandler extends FlxBasic
{
	public var finishCallback:Void->Void = null;

	public function new(path:String)
	{
		super();

		#if VIDEOS_ALLOWED
		var video:VideoHandler = new VideoHandler();
		video.canSkip = false;
		video.finishCallback = function()
		{
			if (finishCallback != null)
				finishCallback();
		}

		if (sys.FileSystem.exists(SUtil.getStorageDirectory() + path))
			video.playVideo(SUtil.getStorageDirectory() + path, false, false);
		else
		{
			if (finishCallback != null)
				finishCallback();
		}
		#else
		if (finishCallback != null)
			finishCallback();
		#end
	}
}
