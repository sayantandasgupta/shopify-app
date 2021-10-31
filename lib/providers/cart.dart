import 'package:flutter/widgets.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  /*
   ! We can create a list of CartItem objects for our shopping cart.
   ! But for this case we are going to map each CartItem to the ProductID of the Product we are adding to the cart
   ! Note that this ProductID is not the same as the CartItem ID
  */
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get numItems {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });

    return total;
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // _items[productId]!.quantity++;
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }

    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingProd) => CartItem(
            id: existingProd.id,
            title: existingProd.title,
            quantity: existingProd.quantity - 1,
            price: existingProd.price),
      );
    } else {
      _items.removeWhere((key, value) => key == productId);
    }

    notifyListeners();
  }

  //! After the Orders have been placed, we need to clear our cart
  //! Since we are controlling the Cart from this Provider, therefore we shall clear the _items Map after Order has been placed
  //! The following function on being called, assigns as empty map to _items and notifies its Listeners

  void clear() {
    _items = {};
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
