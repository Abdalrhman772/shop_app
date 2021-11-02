import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String? id, title, imgUrl, description;
  double price;
  bool isFav, inCart;

  Product({
    this.id,
    this.title,
    this.imgUrl,
    this.description,
    this.price = 0,
    this.isFav = false,
    this.inCart = false,
  });
}

class ProductsDetails with ChangeNotifier {
  double totalPrice = 0;
  final List<Product> _favoriteProducts = [];

  List<Product> get getFav => [..._favoriteProducts];

  void addToFav(String id) {
    _favoriteProducts
        .add(_dummyProducts.firstWhere((element) => element.id == id));
    notifyListeners();
  }

  void removeFav(String id) {
    _favoriteProducts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  final List<Product> _cartProducts = [];
  List<Product> get getCartProducts => [..._cartProducts];

  void addProdTOCart(String id) {
    _cartProducts.add(_dummyProducts.firstWhere((element) => element.id == id));
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartProducts.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  double get getTotalPrice {
    for (var item in _cartProducts) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  List<Product> get getDummyProducts => [..._dummyProducts];

  final List<Product> _customProduct = [];
  List<Product> get getCustomProduct => [..._customProduct];

  void removeCustomProd(String id) {
    _customProduct.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void addCustomProd(String id, String title, String imgUrl, String description,
      double price) {
    _customProduct.add(
      Product(
          id: id,
          title: title,
          imgUrl: imgUrl,
          description: description,
          price: price),
    );
    notifyListeners();
  }

  final List<Product> _dummyProducts = [
    Product(
      id: 'p1',
      imgUrl: 'https://m.media-amazon.com/images/I/51SE-aY2RQL._AC_UL320_.jpg',
      title: 'Black Hoodie',
      description: 'Cool black Hoodie',
      price: 49.99,
    ),
    Product(
      id: 'p2',
      imgUrl: 'https://m.media-amazon.com/images/I/416drT2-EgL._AC_UL320_.jpg',
      title: 'V T-Shirt',
      description: 'Cotton V Neck T-Shirt',
      price: 24.99,
    ),
    Product(
      id: 'p3',
      imgUrl: 'https://m.media-amazon.com/images/I/A1rmBaXCFqL._AC_UL320_.jpg',
      title: 'Sweater Casual',
      description: 'beautiful Casual Sweater ',
      price: 59.99,
    ),
    Product(
      id: 'p4',
      imgUrl: 'https://m.media-amazon.com/images/I/91oIWwA8aEL._AC_UL320_.jpg',
      title: 'Pullover',
      description: 'classic Pullover',
      price: 64.99,
    ),
    Product(
      id: 'p5',
      imgUrl: 'https://m.media-amazon.com/images/I/71t8x5aMTZS._AC_UL320_.jpg',
      title: 'Hoodie',
      description: 'Cool Hoodie',
      price: 79.99,
    ),
  ];
}
