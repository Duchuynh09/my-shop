import 'package:flutter/material.dart';
// import 'package:myshop/ui/Cart/cart_manager.dart';
// import 'package:myshop/ui/Cart/cart_screen.dart';
import 'package:myshop/ui/oders/order_screen.dart';

// import 'ui/products/user_products_screen.dart';
// import 'ui/products/product_overview_screen.dart';
// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/products_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blueGrey),
      ),
      home: const SafeArea(
        child: OrdersScreen(),
      ),
    );
  }
}
