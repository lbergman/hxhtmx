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
		trace('Generating styles...');
		final p = new Process('bunx tailwindcss -i ./src/styles.css -o ./public/styles.css');
		return macro null;
	}

	public static macro function copyVendor() {
		trace('Copy vendor...');

		final target = Path.of('public/vendor/');

		final source = Path.of('node_modules/htmx.org/dist/htmx.min.js');
		final htmxTarget = Path.of('$target/htmx.org');
		htmxTarget.toDir().create();
		source.toFile().copyTo('$htmxTarget/htmx.min.js', [OVERWRITE]);

		final flowbite = Path.of('node_modules/flowbite/dist/');
		final flowbiteTarget = Path.of('$target/flowbite');
		flowbiteTarget.toDir().create();
		flowbite.toDir().copyTo(flowbiteTarget, [OVERWRITE]);

		return macro null;
	}

	public static macro function copyAssets() {
		trace('Copy assets...');

		final source = Path.of('img');
		final target = Path.of('public/img');
		source.toDir().copyTo(target, [OVERWRITE]);
		return macro null;
	}
}
#end
