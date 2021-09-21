import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widgets/products_grid.dart';
import '../providers/product.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop",
          style: kAppBarTitleStyle,
        ),
      ),
      body: ProductsGrid(),
    );
  }
}
