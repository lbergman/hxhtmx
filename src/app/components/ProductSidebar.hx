package app.components;

import app.data.ProductCategories;

@:hhp('components/product_sidebar.html')
class ProductSidebar extends hhp.Template {
	public final categories = ProductCategories.get();
	public var category:Null<Int>;
}
