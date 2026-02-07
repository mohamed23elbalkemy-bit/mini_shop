import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/product_card.dart';
import '../cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      id: '1',
      title: 'Samsung 65-Inch Neo QLED 4K Smart TV QA6...',
      price: 32899,
      image: 'assets/images/samsung65.png',
      rating: 4.5,
    ),
    Product(
      id: '2',
      title: 'Apple 2025 MacBook Air 13-inch Laptop with...',
      price: 51000,
      image: 'assets/images/Apple2025.png',
      rating: 4.5,
    ),
    Product(
      id: '3',
      title: 'POLAR Ignite 3 GPS Smartwatch iphone ...',
      price: 19500,
      image: 'assets/images/POLAR.png',
      rating: 4.5,
    ),
    Product(
      id: '4',
      title: 'Soundcore by Anker Life Q30 Hybrid Active Noise...',
      price: 3950,
      image: 'assets/images/Soundcore.png',
      rating: 4.5,
    ),
    Product(
      id: '5',
      title: 'HONOR 400 5G smartphone, 200MP Al...',
      price: 21999,
      image: 'assets/images/HONOR_400_5G.png',
      rating: 4.5,
    ),
    Product(
      id: '6',
      title: 'JBL Go 4 portable Bluetooth Speaker with l...',
      price: 1899,
      image: 'assets/images/JBL.png',
      rating: 4.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/images/app_logo.png',
          height: 40,
          fit: BoxFit.contain,
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),

              if (cart.count > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      cart.count.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const Text(
              'Recommendations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.63,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
