import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String productName;
  final String imageUrl;

  UserProductItem({required this.productName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(productName),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: FractionallySizedBox(
        widthFactor: 0.3,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                //TODO Add editing functionalities
                Navigator.of(context).pushNamed('/editProduct');
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                //TODO Add Deleting Functionalities
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
