import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, int> _items = {};
  final Map<String, Product> _products = {};

  Map<String, int> get items => _items;

  void add(Product product) {
    _items.update(
      product.id,
      (v) => v + 1,
      ifAbsent: () {
        _products[product.id] = product;
        return 1;
      },
    );
    notifyListeners();
  }

  void decrease(String id) {
    if (_items[id]! > 1) {
      _items[id] = _items[id]! - 1;
    } else {
      _items.remove(id);
      _products.remove(id);
    }
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    _products.remove(id);
    notifyListeners();
  }

  int get count => _items.values.fold(0, (a, b) => a + b);

  double get itemsTotal {
    double total = 0;
    _items.forEach((id, qty) {
      total += _products[id]!.price * qty;
    });
    return total;
  }

  Product product(String id) => _products[id]!;
}
