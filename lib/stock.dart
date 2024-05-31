import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cart/stock.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'admin.dart';


class MyStock extends StatefulWidget {
  const MyStock({super.key});

  @override
  State<MyStock> createState() => _MyStockState();
}

class _MyStockState extends State<MyStock> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nama = TextEditingController();
    final TextEditingController Stock = TextEditingController();
    final TextEditingController tanggal = TextEditingController();
   DateTime currentDate = DateTime.now();
    Future kirimData() async {
      var url = Uri.http("localhost", "flutter/tambah.php", {'q': '{http}'});
      var respon = await http.post(url, body: {
        "nama": nama.text,
        "Stock": Stock.text,
         "tanggal": currentDate.toString(),
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
                  labelText: 'Nama',
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
              child: Text(
                "Date: ${currentDate.day}-${currentDate.month}-${currentDate.year}",
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
