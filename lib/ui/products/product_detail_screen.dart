import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen(this.product, {super.key});
  final Product product;
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(color: Colors.green, fontSize: 20),
          ),
          const SizedBox(
            width: 0.0,
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
