//! In this page, the user can add or manage their custom products

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/widgets/app_drawer.dart';
import 'package:shopify_app/widgets/user_product_item.dart';

import '../providers/products_provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    //! Add Provider Listener here
    final productsData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Product"),
        actions: [
          IconButton(
            onPressed: () {
              //TODO go to new page where we can add new products
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            //! We are going to build a UserProduct Item for this ListView. Therefore let's create a separate widget for that
            final product = productsData.items[idx];
            return Column(
              children: [
                UserProductItem(
                  productName: product.productName,
                  imageUrl: product.imageUrl,
                ),
                Divider()
              ],
            );
          },
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
