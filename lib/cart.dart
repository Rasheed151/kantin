import 'package:cart/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCart extends StatelessWidget {
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Belanja'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              var item = cartProvider.cartItems[index];
              return ListTile(
                leading: Image.asset('lib/images/open.png'),
                title: Text(item['nama']),
                subtitle: Text('Harga: ${item['Harga']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        cartProvider.decreaseQuantity(item);
                      },
                    ),
                    Text(item['quantity'].toString()),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cartProvider.increaseQuantity(item);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        cartProvider.removeFromCart(item);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                            Container(
              child: Text(
                "Date: ${currentDate.day}-${currentDate.month}-${currentDate.year}",
              ),
            ),
                ElevatedButton(
                  onPressed: () async {
                    // Panggil metode kirimData dari CartProvider
                    await cartProvider.kirimData1();
                    // Navigasi ke halaman berikutnya
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHome(),
                      ),
                    );
                  },
                  child: Text('Checkout'),
                  style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



// import 'package:cart/home.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cart/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyCart extends StatelessWidget {
//   @override
  
//   Widget build(BuildContext context) {
//     var cartProvider = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Keranjang Belanja'),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.white,
//       body: Consumer<CartProvider>(
//         builder: (context, cartProvider, child) {
//           return ListView.builder(
//             itemCount: cartProvider.cartItems.length,
//             itemBuilder: (context, index) {
//               var item = cartProvider.cartItems[index];
//               return ListTile(
//                 leading: Image.asset('lib/images/open.png'),
//                 title: Text(item['nama']),
//                 subtitle: Text('Harga: ${item['Harga']}'),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.remove),
//                       onPressed: () {
//                         cartProvider.decreaseQuantity(item);
//                       },
//                     ),
//                     Text(item['quantity'].toString()),
//                     IconButton(
//                       icon: Icon(Icons.add),
//                       onPressed: () {
//                         cartProvider.increaseQuantity(item);
//                       },
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () {
//                         cartProvider.removeFromCart(item);
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: Consumer<CartProvider>(
//         builder: (context, cartProvider, child) {
//           return Container(
//             padding: EdgeInsets.all(16.0),
//             color: Colors.green,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                 KirimData1();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyHome(),
//                   ),
//                 );
//                   },
//                   child: Text('Checkout'),
//                   style: ElevatedButton.styleFrom(primary: Colors.white),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
