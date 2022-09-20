import '../../models/oder_item.dart';
// import '../../models/cart_item.dart';
import '../../ui/Cart/cart_manager.dart';

class OrderManager {
  final List<OrderItem> _orders = [
    OrderItem(
        dateTime: DateTime.now(),
        id: 'o1',
        amount: 59.98,
        products: CartManager().products),
  ];
  int get orderCount {
    return _orders.length;
  }

  List<OrderItem> get orders {
    return [..._orders];
  }
}
