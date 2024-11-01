package app;

import app.components.ProductSidebar;
import app.pages.Aboutus;
import app.pages.Downloads;
import app.pages.Home;
import app.pages.Products;
import app.pages.Technology;
import http.HTTPRequest;
import http.HTTPServer;

using thx.Strings;

class App {
	public function new() {
		final http = new HTTPServer('127.0.0.1', 3000, false);
		http.start();
		http.blocking = false;
		final goHome = (req:HTTPRequest) -> {
			req.mime = 'text/html';
			if (req.param.header('HX-Request') != null) {
				// If hx request just send fragment
				req.send(hhp.Hhp.render('./pages/home.html'));
			} else {
				// If direct request send whole page
				final tpl = new Home();
				req.send(tpl.execute());
			}
		}
		// Redirect to home
		http.route.addRoute('/', req -> {
			goHome(req);
			true;
		});
		// Serve static content from public
		http.route.addRoute('/public', req -> {
			req.sendFile('./${req.path}');
			true;
		});
		// Landing page
		http.route.addRoute('/home', req -> {
			goHome(req);
			true;
		});

		http.route.addRoute('/products/home', req -> {
			if(isHxReq(req)) {
				req.send(hhp.Hhp.render('./pages/products/products_home.html'));
			} else {
				final tpl = new Products();
				req.send(tpl.execute());
			}
			true;
		});
		var currCat:Null<Int> = null;
		// Products page
		http.route.addRoute('/products', req -> {
			req.mime = 'text/html';
			final category = Std.parseInt(req.param.getFields().get('cat'));
		trace('req.param.getFields(): ${req.param.getFields()}');
			if (isHxReq(req)) {
				//final categoryData = ProductCategories.get().find(c -> c.id == category);
				//trace('category:$category categoryData: ${categoryData}');
				req.send(switch category {
					case 0: hhp.Hhp.render('./pages/products/category_0.html');
					case 1: hhp.Hhp.render('./pages/products/category_1.html');
					case 2: hhp.Hhp.render('./pages/products/category_2.html');
					default: hhp.Hhp.render('pages/products.html', {
							category: currCat,
						});
				});
				currCat = null;
			} else {
				trace('category: ${category}');

				final tpl = new Products();
				tpl.category = category;
				req.send(tpl.execute());
				currCat = category;
			}

			true;
		});
		http.route.addRoute('/products', req -> {
			req.mime = 'text/html';
			final category = Std.parseInt(req.param.getFields().get('cat'));
		trace('req.param.getFields(): ${req.param.getFields()}');
			if (isHxReq(req)) {
				//final categoryData = ProductCategories.get().find(c -> c.id == category);
				//trace('category:$category categoryData: ${categoryData}');
				req.send(switch category {
					case 0: hhp.Hhp.render('./pages/products/category_0.html');
					case 1: hhp.Hhp.render('./pages/products/category_1.html');
					case 2: hhp.Hhp.render('./pages/products/category_2.html');
					default: hhp.Hhp.render('pages/products.html', {
							category: currCat,
						});
				});
				currCat = null;
			} else {
				trace('category: ${category}');

				final tpl = new Products();
				tpl.category = category;
				req.send(tpl.execute());
				currCat = category;
			}

			true;
		});
		// Downloads page
		http.route.addRoute('/downloads', req -> {
			req.mime = 'text/html';
			if (isHxReq(req)) {
				req.send(hhp.Hhp.render('./pages/downloads.html'));
			} else {
				final tpl = new Downloads();
				req.send(tpl.execute());
			}
			true;
		});
		// Technology page
		http.route.addRoute('/technology', req -> {
			req.mime = 'text/html';
			if (isHxReq(req)) {
				req.send(hhp.Hhp.render('./pages/technology.html'));
			} else {
				final tpl = new Technology();
				req.send(tpl.execute());
			}
			true;
		});
		// Aboutus page
		http.route.addRoute('/aboutus', req -> {
			req.mime = 'text/html';
			if (isHxReq(req)) {
				req.send(hhp.Hhp.render('./pages/aboutus.html'));
			} else {
				final tpl = new Aboutus();
				req.send(tpl.execute());
			}
			true;
		});
		// Products sidebar
		http.route.addRoute('/products/sidebar', req -> {
			final category = Std.parseInt(req.param.getFields().get('cat'));

			final tpl = new ProductSidebar();
			trace('category: ${category}');
			tpl.category = category;
			req.send(tpl.execute());
			true;
		});

		// Menu
		http.route.addRoute('/menu', req -> {
			final category = req.param.getFields().get('cat');
			req.send(switch category {
				case 'products': hhp.Hhp.render('./menu/products.html');
				case 'technology': hhp.Hhp.render('./menu/technology.html');
				case 'downloads': hhp.Hhp.render('./menu/downloads.html');
				case 'aboutus': hhp.Hhp.render('./menu/aboutus.html');
				case _: hhp.Hhp.render('./menu/home.html');
			});
			true;
		});
	}

	inline function isHxReq(req) {
		return req.param.header('HX-Request') != null;
	}
}
