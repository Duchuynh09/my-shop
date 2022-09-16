import 'package:flutter/material.dart';
import '../../models/product.dart';

class UserProductListTile extends StatelessWidget {
  const UserProductListTile(this.product, {Key? key}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          product.imageUrl,
        ),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            delButton(context),
            editButton(context),
          ],
        ),
      ),
    );
  }

  Widget delButton(BuildContext context) {
    return IconButton(
      onPressed: () async => {},
      icon: const Icon(Icons.delete_outline),
      color: Theme.of(context).errorColor,
    );
  }

  Widget editButton(BuildContext context) {
    return IconButton(
      onPressed: () async => {},
      icon: const Icon(Icons.edit_outlined),
      color: Theme.of(context).primaryColor,
    );
  }
}
