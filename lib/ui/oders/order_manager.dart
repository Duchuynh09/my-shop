import 'package:flutter/foundation.dart';
import 'package:myshop/models/cart_item.dart';

import '../../models/oder_item.dart';

class OrderManager with ChangeNotifier {
  final List<OrderItem> _orders = [];
  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
          id: 'o${DateTime.now().toIso8601String()}',
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now()),
    );
    notifyListeners();
  }

  int get orderCount {
    return _orders.length;
  }

  List<OrderItem> get orders {
    return [..._orders];
  }
}
