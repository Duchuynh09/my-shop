import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/oder_item.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;
  const OrderItemCard(this.order, {Key? key}) : super(key: key);

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSummary(),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        height: min(widget.order.productCount * 20.0 + 10, 100),
        child: ListView(
          children: widget.order.products
              .map(
                (product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${product.quantity} x \$ ${product.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ));
  }

  Widget buildOrderSummary() {
    return ListTile(
      title: Text('\$${widget.order.amount}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(
          _expanded ? Icons.expand_less : Icons.expand_more,
        ),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}
