import 'package:flutter/material.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';
import '../shared/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/UserProductsScreen';
  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm của bạn'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => {},
        child: buildUserProductListView(productsManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productsManager) {
    return ListView.builder(
      itemCount: productsManager.itemCount,
      itemBuilder: (context, index) => Column(
        children: [
          UserProductListTile(
            productsManager.items[index],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return IconButton(
      icon: const Icon(Icons.add_to_photos),
      onPressed: () => {},
    );
  }
}
