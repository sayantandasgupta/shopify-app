import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  ProductsGrid({required this.showFavorites});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final loadedProducts =
        showFavorites ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        //! Use the ChangeNotifierProvider.value() only when you are providing a value of an existing object
        return ChangeNotifierProvider.value(
          value: loadedProducts[
              index], //! We are interested in only one Product. Therefore we have to provide only a single Product item as provider
          //! And Since we are using Providers , we don't need any arguments to pass into ProductItem
          child: ProductItem(
              // id: loadedProducts[index].id,
              // productName: loadedProducts[index].productName,
              // imageUrl: loadedProducts[index].imageUrl,
              ),
        );
      },
    );
  }
}
