import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../providers/products_provider.dart';
import '../utils/constants.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: kAppBarTitleStyle,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions newValue) {
              setState(() {
                if (newValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text("Favorites"), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text("Show all"), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child!,
              value: cart.numItems.toString(),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ProductsGrid(showFavorites: _showOnlyFavorites),
    );
  }
}
