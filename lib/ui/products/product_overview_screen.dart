import 'package:flutter/material.dart';
import 'products_grid.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop'),
        actions: <Widget>[buildProductFilterMenu(), buildShoppingCartIcon()],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }

  Widget buildShoppingCartIcon() {
    return IconButton(
      onPressed: () => {},
      icon:const Icon(Icons.shopping_cart),
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('only favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('show all'),
        )
      ],
    );
  }
}
