import 'package:flutter/material.dart';
import 'package:myshop/ui/screens.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';
import 'user_product_list_tile.dart';
import '../shared/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);
  static const routeName = '/UserProductsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sản phẩm của bạn'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async => {},
        child: buildUserProductListView(),
      ),
    );
  }

  Widget buildUserProductListView() {
    return Consumer<ProductsManager>(
      builder: (context, productsManager, child) {
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
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.add_to_photos),
        onPressed: () => {
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
                arguments: null,
              ),
            });
  }
}
