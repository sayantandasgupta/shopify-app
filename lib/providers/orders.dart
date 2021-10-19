//! To handle the orders for users, we are creating a Provider for Orders which
//! shall be used to handle changes to Orders

import 'package:flutter/widgets.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> cartItems;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.total,
    required this.cartItems,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get getOrder {
    return [..._orders];
  }

  //! addOrder function adds a new OrderItem to the _orders list.
  //! We want to showcase the most recent orders first
  //! Therefore we are pushing the OrderItems to index 0 of _orders list
  void addOrder(List<CartItem> cartItems, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        total: total,
        cartItems: cartItems,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
