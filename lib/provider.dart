import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item['Harga'].toString()) * item['quantity'];
    }
    return total;
  }

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // void addToCart(Map<String, dynamic> item) {
  //   bool itemExists = false;
  //   for (var cartItem in _cartItems) {
  //     if (cartItem['nama'] == item['nama']) {
  //       cartItem['quantity'] += 1;
  //       itemExists = true;
  //       break;
  //     }
  //   }
  //   if (!itemExists) {
  //     item['quantity'] = 1;
  //     _cartItems.add(item);
  //   }
  //   notifyListeners();
  // }
    void addToCart(Map<String, dynamic> item) {
    bool itemExists = false;
    for (var cartItem in _cartItems) {
      if (cartItem['nama'] == item['nama']) {
        cartItem['quantity'] += 1;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      item['quantity'] = 1;
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    _cartItems.removeWhere((cartItem) => cartItem['nama'] == item['nama']);
    notifyListeners();
  }

  void increaseQuantity(Map<String, dynamic> item) {
    for (var cartItem in _cartItems) {
      if (cartItem['nama'] == item['nama']) {
        cartItem['quantity'] += 1;
        break;
      }
    }
    notifyListeners();
  }

  void decreaseQuantity(Map<String, dynamic> item) {
    for (var cartItem in _cartItems) {
      if (cartItem['nama'] == item['nama']) {
        if (cartItem['quantity'] > 1) {
          cartItem['quantity'] -= 1;
        } else {
          _cartItems.remove(cartItem);
        }
        break;
      }
    }
    notifyListeners();
  }
}
