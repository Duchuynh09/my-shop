import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_token.dart';

import '../models/product.dart';

import 'FirebaseService.dart';

class ProductsService extends FirebaseService {
  ProductsService([AuthToken? authToken]) : super(authToken);

  Future<List<Product>> fetchProducts([bool filterByUser = false]) async {
    final List<Product> products = [];
    try {
      final filters =
          filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
      final productsUrl =
          Uri.parse('$databaseUrl/products.json?auth=$token&$filters');
      final response = await http.get(productsUrl);
      final productMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        // Kiểm tra nếu không có dữ liệu của người dùng
        return products;
      }
      final userFavoritesUrl =
          Uri.parse('$databaseUrl/userFavorites/$userId.json?auth=$token');
      final userFavoriteResponse = await http.get(userFavoritesUrl);
      final userFavoriteMap = json.decode(userFavoriteResponse.body);

      productMap.forEach((productId, product) {
        final isFavorite = (userFavoriteMap == null)
            ? false
            : (userFavoriteMap[productId] ?? false);
        product.add(Product.fromJson({
          'id': productId,
          ...product,
        }).copyWith(isFavorite: isFavorite));
      });
      return products;
    } catch (e) {
      return products;
    }
  }

  Future<Product?> addProduct(Product product) async {
    try {
      final url = Uri.parse('$databaseUrl/products.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(product.toJson()..addAll({'creatorId': userId})),
      );
      print(response);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return product.copyWith(id: json.decode(response.body)['name']);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
