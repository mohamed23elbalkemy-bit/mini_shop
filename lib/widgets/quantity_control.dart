import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class QuantityControl extends StatelessWidget {
  final String productId;

  const QuantityControl({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final qty = cart.items[productId] ?? 0;

    return Row(
      children: [
        _qtyButton(
          icon: Icons.remove,
          onTap: () => cart.decrease(productId),
          color: Colors.grey.shade300,
          iconColor: Colors.black,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            qty.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),

        _qtyButton(
          icon: Icons.add,
          onTap: () => cart.add(cart.product(productId)),
          color: Colors.blue,
          iconColor: Colors.white,
        ),
      ],
    );
  }

  Widget _qtyButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
