import 'package:flutter/material.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavrites;
  const ProductsGrid(this.showFavrites, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager=ProductsManager();
    final products =
        showFavrites ? productsManager.favoriteItems : productsManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (itx, i) => ProducGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
      ),
    );
  }
}
