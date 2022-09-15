import 'package:flutter/material.dart';
import '../../models/Product.dart';
import './product_detail_screen.dart';

class ProducGridTile extends StatelessWidget {
  const ProducGridTile(this.product, {super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          footer: buildGirdFooterBar(context),
          child: GestureDetector(
            onTap: () {
              print('go to product');
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  Widget buildGirdFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print('toggle a favorite');
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          print("Thêm vào giỏ hàng");
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
