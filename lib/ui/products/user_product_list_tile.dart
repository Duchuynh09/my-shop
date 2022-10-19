import 'package:flutter/material.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';
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
      onPressed: () {
        context.read<ProductsManager>().deleteProduct(product.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(
            content: Text(
              'Xóa thành công!!!',
              textAlign: TextAlign.center,
            ),
          ));
      },
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
