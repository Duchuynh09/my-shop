import 'package:flutter/material.dart';
import 'order_manager.dart';
import 'orders_item_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderMn = OrderManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng của bạn'),
      ),
      body: ListView.builder(
        itemCount: orderMn.orderCount,
        itemBuilder: (context, index) => OrderItemCard(orderMn.orders[index]),
      ),
    );
  }
}
