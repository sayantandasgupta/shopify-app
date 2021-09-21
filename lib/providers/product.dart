import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id; //TODO Final for now will change to a server side id later
  final String productName;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void changeFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();

    /**
     * ! SImilar to SetState in StateFul Widgets. 
     * !notifyListeners helps the child widgets who are using the provider to listen to any
     * ! change in the data and update UI accordingly
     */
  }
}
