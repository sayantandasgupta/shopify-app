import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopify_app/providers/orders.dart';

class OrderCard extends StatelessWidget {
  OrderCard({required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$ ${order.total}',
            ),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.expand_more),
            ),
          ),
        ],
      ),
    );
  }
}
