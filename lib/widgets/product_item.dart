import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/providers/cart.dart';

import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String productName;
  // final String imageUrl;

  // ProductItem({
  //   required this.id,
  //   required this.productName,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context);

    /**
     * ! Using Consumer Widget is an alternative to using the Provider.of<Type> method of calling data from the provider
     * ! Using Provider.of method, the entire widget tree gets built if the data changes in the provider
     * ! if you do not want that kind of latency, then use the Consumer Widget
     */
    final cart = Provider.of<Cart>(context,
        listen:
            false); //! We are keeping listen as false as we are not interested in any changes in Cart Provider
    //! We are simply going to add to the cart and not listen to any changes
    return Consumer<Product>(
      builder: (ctx, product, child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              onPressed: () {
                product.changeFavoriteStatus();
              },
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
            ),
            title: Text(
              "${product.productName}",
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(product.id, product.productName, product.price);
                //! We have added the product to the cart. Now we also need a way to display the products added to the cart. we are going to do that in the products overview page
                //! We can add a navigation drawer or an appBar action for this purpose. Let's go to Products Overview screen for this
              },
              icon: Icon(Icons.shopping_cart),
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
