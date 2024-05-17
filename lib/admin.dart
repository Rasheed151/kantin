import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAdmin extends StatefulWidget {
  const MyAdmin({super.key});

  @override
  State<MyAdmin> createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController idBarang = TextEditingController();
    final TextEditingController nama = TextEditingController();
    final TextEditingController Harga = TextEditingController();
    final TextEditingController Stock = TextEditingController();
    final TextEditingController info = TextEditingController();

      Future kirimData() async {
    var url = Uri.http("localhost", "flutter/barang.php", {'q': '{http}'});
    var respon = await http.post(url,
    body: {
      "idBarang": idBarang.text,
      "nama": nama.text,
      "Harga": Harga.text,
      "Stock": Stock.text,
      "info": info.text
    });

    var data = json.decode(respon.body);
    if (data.toString() == "Berhasil") {
      print("Gass");
    } else {
      print("Gagal");
    }
  }


    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          
        ),
      ),
    );
  }
}