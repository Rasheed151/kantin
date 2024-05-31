// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class CartProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _cartItems = [];

//     final TextEditingController nama = TextEditingController();
//     final TextEditingController Stock = TextEditingController();
//     final TextEditingController tanggal = TextEditingController();
//    DateTime currentDate = DateTime.now();
//     Future kirimData() async {
//       var url = Uri.http("localhost", "flutter/keluar.php", {'q': '{http}'});
//       var respon = await http.post(url, body: {
//         "nama": cartItems,
//         "Stock": ,
//          "tanggal": currentDate.toString(),
//       });

//       var data = json.decode(respon.body);
//       if (data.toString() == "Berhasil") {
//         print("Gass");
//       } else {
//         print("Gagal");
//       }
//     }

//   double get totalPrice {
//     double total = 0.0;
//     for (var item in _cartItems) {
//       total += double.parse(item['Harga'].toString()) * item['quantity'];
//     }
//     return total;
//   }

//   List<Map<String, dynamic>> get cartItems => _cartItems;

//   // void addToCart(Map<String, dynamic> item) {
//   //   bool itemExists = false;
//   //   for (var cartItem in _cartItems) {
//   //     if (cartItem['nama'] == item['nama']) {
//   //       cartItem['quantity'] += 1;
//   //       itemExists = true;
//   //       break;
//   //     }
//   //   }
//   //   if (!itemExists) {
//   //     item['quantity'] = 1;
//   //     _cartItems.add(item);
//   //   }
//   //   notifyListeners();
//   // }
//     void addToCart(Map<String, dynamic> item) {
//     bool itemExists = false;
//     for (var cartItem in _cartItems) {
//       if (cartItem['nama'] == item['nama']) {
//         cartItem['quantity'] += 1;
//         itemExists = true;
//         break;
//       }
//     }
//     if (!itemExists) {
//       item['quantity'] = 1;
//       _cartItems.add(item);
//     }
//     notifyListeners();
//   }

//   void removeFromCart(Map<String, dynamic> item) {
//     _cartItems.removeWhere((cartItem) => cartItem['nama'] == item['nama']);
//     notifyListeners();
//   }

//   void increaseQuantity(Map<String, dynamic> item) {
//     for (var cartItem in _cartItems) {
//       if (cartItem['nama'] == item['nama']) {
//         cartItem['quantity'] += 1;
//         break;
//       }
//     }
//     notifyListeners();
//   }

//   void decreaseQuantity(Map<String, dynamic> item) {
//     for (var cartItem in _cartItems) {
//       if (cartItem['nama'] == item['nama']) {
//         if (cartItem['quantity'] > 1) {
//           cartItem['quantity'] -= 1;
//         } else {
//           _cartItems.remove(cartItem);
//         }
//         break;
//       }
//     }
//     notifyListeners();
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  final TextEditingController nama = TextEditingController();
  final TextEditingController Stock = TextEditingController();
  final TextEditingController tanggal = TextEditingController();
  DateTime currentDate = DateTime.now();

  Future kirimData1() async {

    int totalQuantity = 0;
    for (var item in _cartItems) {

      int quantity = item['quantity'] ?? 0;
      totalQuantity += quantity;
    }

    var url = Uri.http("localhost", "flutter/keluar.php", {'q': '{http}'});
    var respon = await http.post(url, body: {
      "nama": jsonEncode(_cartItems), 
      "Stock": totalQuantity.toString(),
      "tanggal": currentDate.toString(),
    });

    var data = json.decode(respon.body);
    if (data.toString() == "Berhasil") {
      print("Gass");
    } else {
      print("Gagal");
    }
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += double.parse(item['Harga'].toString()) * (item['quantity'] ?? 1);
    }
    return total;
  }

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
    bool itemExists = false;
    for (var cartItem in _cartItems) {
      if (cartItem['nama'] == item['nama']) {
        cartItem['quantity'] = (cartItem['quantity'] ?? 0) + 1;
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
        cartItem['quantity'] = (cartItem['quantity'] ?? 0) + 1;
        break;
      }
    }
    notifyListeners();
  }

  void decreaseQuantity(Map<String, dynamic> item) {
    for (var cartItem in _cartItems) {
      if (cartItem['nama'] == item['nama']) {
        if ((cartItem['quantity'] ?? 0) > 1) {
          cartItem['quantity'] = (cartItem['quantity'] ?? 0) - 1;
        } else {
          _cartItems.remove(cartItem);
        }
        break;
      }
    }
    notifyListeners();
  }
}

