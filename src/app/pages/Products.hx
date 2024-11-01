package app.pages;

@:hhp('index.html')
class Products extends hhp.Template {
	public final menu = hhp.Hhp.render('menu/products.html');
	public var category:Null<Int>;
}
