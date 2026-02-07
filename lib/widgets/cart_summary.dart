import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          _row('Items Total', cart.itemsTotal),
          _row('Shipping Fee', 0, free: true),
          const Divider(),
          _row('Total', cart.itemsTotal, bold: true),
        ],
      ),
    );
  }

  Widget _row(
    String title,
    double value, {
    bool bold = false,
    bool free = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            free ? 'Free' : '${value.toInt()} EGP',
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              color: free ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
