import 'package:cart/tambah.dart';
import 'package:flutter/material.dart';
import 'stock.dart';
import 'Up&De.dart';

class MyAdmin extends StatelessWidget {
  const MyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: ListView(
        children:<Widget>[
          Container(
                                                child:IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyAdmin(),
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
          ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8, 
          color: Colors.blueGrey, 
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyStock(),
                                ),
                              );
                            },
                            icon: Icon(Icons.shelves),
                          ),
                          Text("Penambahan Stock"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyTambah(),
                                ),
                              );
                            },
                            icon: Icon(Icons.food_bank),
                          ),
                          Text("Penambahan Barang"),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyUpDE(),
                                ),
                              );
                            },
                            icon: Icon(Icons.update),
                          ),
                          Text("Update & Delete"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ]
      ),

      )
    );
  }
}