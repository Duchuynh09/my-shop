import '../../models/cart_item.dart';
import '../products/products_manager.dart';

class CartManager {
  final Map<String, CartItem> _items = {
    'p1': CartItem(
      id: 'c1',
      title: 'Red Shirt',
      quantity: 1,
      price: 29.99,
    ),
  };
  int get producCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }
  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmout {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
}
