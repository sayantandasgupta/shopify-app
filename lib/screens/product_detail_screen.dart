import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/providers/products_provider.dart';
import 'package:shopify_app/utils/constants.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String productName;

  // ProductDetailScreen({required this.productName});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments;

    //! Since we are using a Provider, it gives us the option of not listening
    //! to any change made in the Provider data. Since we are calling on fixed data, there is no need for the widget to build again if any data happens to change.

    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findProductById(productId.toString());

    /**
     * ! Instead of getting the entire list, we are getting a particular 
     * ! Product from the list by creating a method inside the Products Provider
     */

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${loadedProduct.productName}",
          style: kAppBarTitleStyle,
        ),
      ),
    );
  }
}
