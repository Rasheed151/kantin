import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'admin.dart';

class MyTambah extends StatelessWidget {
  const MyTambah({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nama = TextEditingController();
    final TextEditingController Harga = TextEditingController();
    final TextEditingController Stock = TextEditingController();
    final TextEditingController info = TextEditingController();
    Future kirimData() async {
      var url = Uri.http("localhost", "flutter/barang.php", {'q': '{http}'});
      var respon = await http.post(url, body: {
        "nama": nama.text,
        "Harga":Harga.text,
        "Stock": Stock.text,
        "info":info.text,
      });

      var data = json.decode(respon.body);
      if (data.toString() == "Berhasil") {
        print("Gass");
      } else {
        print("Gagal");
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
               alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:[
                  Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: nama,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Barang',
                ),
              ),
            ),
                              Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: Harga,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Harga Barang',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: Stock,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Jumlah stock',
                ),
              ),
            ),
                             Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: info,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Informasi Barang',
                ),
              ),
            ),
                ]
                
              ),
            ),
            ElevatedButton(
                        onPressed: () {
                kirimData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAdmin(),
                  ),
                );
              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                    top: 26,
                    bottom: 26,
                    left: 50,
                    right: 50
                  ), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  primary: const Color.fromARGB(255, 112, 91, 222), 
                        ),
                        child: Text("Masuk")),
          ],
        ),
      ),
    );
  }
}