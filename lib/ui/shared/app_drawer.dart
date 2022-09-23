import 'package:flutter/material.dart';
import '../oders/order_screen.dart';
import '../products/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Menu nè'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.shop,
            ),
            title: const Text(
              'Cửa hàng',
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text(
              'Đặt hàng',
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.edit,
            ),
            title: const Text(
              'Quản lý sản phẩm',
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
