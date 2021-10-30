import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/widgets/app_drawer.dart';

import '../providers/orders.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final orderList = orderData.getOrder.toList();
          return OrderCard(order: orderList[index]);
        },
        itemCount: orderData.getOrder.length,
      ),
    );
  }
}
