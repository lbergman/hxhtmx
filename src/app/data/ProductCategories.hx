package app.data;

class ProductCategories {
	static public function get() {
		return [
			{name: 'Laptops', image: '/public/img/laptop_thumb.webp', id: 0},
			{name: 'Smartphones', image: '/public/img/smartphone_thumb.webp', id: 1},
			{name: 'Smart Home', image: '/public/img/smarthome_thumb.webp', id: 2},
		];
	}
}
