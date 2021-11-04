import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/screens/user_product_screen.dart';

import '../providers/orders.dart';
import '../screens/cart_screen.dart';
import '../screens/orders_screen.dart';
import '../providers/products_provider.dart';
import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';
import '../providers/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! Use change Notifier Provider wrapping over MaterialApp to register the provider you have used.
    //! If you are using Multiple Providers, use MultiProvider wrapping over the MaterialApp
    //! Use ChangeNotifierProvider and not the .value() method preferrably when you are declaring a new instance of a Provider Object
    //! Now we need to add the Order Provider to the project. Now the order provider is used in the CartScreen and will be used in the Orders Screen which has to be registered on the main.dart file
    //! Therefore it makes sense to register our Orders provider in the main.dart file
    //! The entire app does not get rebuild as we are not providing any listeners here.
    //! The listeners are provided in the respective screens where we need them. So that only that screen or that widget gets built

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Shopify App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepOrange,
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
        },
      ),
    );
  }
}
