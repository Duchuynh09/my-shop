import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'order_manager.dart';
import 'orders_item_card.dart';
import '../shared/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng của bạn'),
      ),
      drawer: const AppDrawer(),
      body: Consumer<OrderManager>(
        builder: (ctx, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
          );
        },
      ),
    );
  }
}
