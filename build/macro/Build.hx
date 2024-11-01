package build.macro;

import hx.files.Path;
import sys.io.Process;

#if macro
class Build {
	public static macro function clean() {
		Path.of('public').toDir().delete(true);
		Path.of('public').toDir().create();
		return macro null;
	}

	public static macro function generateStyles() {
		final p = new Process('bunx tailwindcss -i ./src/styles.css -o ./public/styles.css');
		return macro null;
	}

	public static macro function copyVendor() {
		final source = Path.of('node_modules/htmx.org/dist/htmx.min.js');
		final target = Path.of('public/htmx.org/');
		target.toDir().create();
		source.toFile().copyTo('$target/htmx.min.js', [OVERWRITE]);
		return macro null;
	}

	public static macro function copyAssets() {
		final source = Path.of('img');
		final target = Path.of('public/img');
		source.toDir().copyTo(target, [OVERWRITE]);
		return macro null;
	}
}
#end
