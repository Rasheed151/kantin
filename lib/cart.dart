import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/provider.dart';

class MyCart extends StatelessWidget {
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
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout action
                  },
                  child: Text('Checkout'),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
