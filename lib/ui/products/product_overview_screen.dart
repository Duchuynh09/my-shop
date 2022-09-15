import 'package:flutter/material.dart';
import 'products_grid.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My shop'),
        actions: <Widget>[],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
  Widget buildShoppingCartIcon(){
    return IconButton(onPressed: ()=>{
      print('haha')
    }, icon: Icon(Icons.shopping_cart),);
  }
  Widget buildProductFilterMenu(){
    return PopupMenuButton(
      itemBuilder: (ctx)=> [
      const PopupMenuItem(child: Text('only favorites'),
      value: FilterOptions.favorites,
      ),
      const PopupMenuItem(child: Text('show all'),
      value: FilterOptions.all,)
    ],
    );
  }
}
