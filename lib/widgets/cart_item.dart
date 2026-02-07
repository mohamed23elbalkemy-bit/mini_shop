import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'quantity_control.dart';

class CartItem extends StatelessWidget {
  final String id;
  const CartItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final product = cart.product(id);
    final qty = cart.items[id]!;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Image.asset(product.image, width: 60),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${product.price.toInt()} EGP'),
              ],
            ),
          ),
          QuantityControl(productId: id),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => cart.remove(id),
          ),
        ],
      ),
    );
  }
}
