List<Product> products = <Product>[Product(title: 'Burger', price: 550.50, imagePath: 'assets/images/burger.png'),
  Product(title: 'Zinger Burger', price: 870.00, imagePath: 'assets/images/bigburger.png'),
  Product(title: 'Nuggets', price: 650, imagePath: 'assets/images/nuggets.png'),
  Product(title: 'Pasta', price: 400, imagePath: 'assets/images/pasta.png'),
  Product(title: 'Pizza', price: 2200, imagePath: 'assets/images/pizza.png'),
  Product(title: 'Showarma', price: 250, imagePath: 'assets/images/showarma.png'),
  Product(title: 'Wings', price: 490, imagePath: 'assets/images/wings.png')
];

class Product {
  String title;
  double price;
  String? description;
  String imagePath;

  Product(
      {required this.title,
        required this.price,
        required this.imagePath,
        this.description = 'Very testy product! you can confirm eith Habibi'});
}
