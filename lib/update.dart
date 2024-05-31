

import 'package:cart/admin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cart/admin.dart';
import 'package:cart/Up&De.dart';

class Update extends StatefulWidget {
  final String nama;

  const Update({Key? key, required this.nama, required Map<String, dynamic> data}) : super(key: key);

  @override
  _UpdateDataPageState createState() => _UpdateDataPageState();
}

class _UpdateDataPageState extends State<Update> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController HargaController = TextEditingController();
  final TextEditingController StockController = TextEditingController();
  final TextEditingController infoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: HargaController,
                decoration: InputDecoration(labelText: 'Harga'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Anda tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: StockController,
                decoration: InputDecoration(labelText: 'Stock'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Anda tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: infoController,
                decoration: InputDecoration(labelText: 'informasi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga Anda tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateData();
                  }
                },
                child: Text('Update'),
              ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                   style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                   ),
                  child: Text(
                    'Kembali',
                  style: TextStyle(

                    fontWeight: FontWeight.normal,
                  ),
                  ),
                   
                  
                ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> updateData() async {
  var url = Uri.parse("http://localhost/flutter/edit.php");
  var response = await http.post(url, body: {
    "nama": widget.nama,
    "Harga": HargaController.text,
    "Stock": StockController.text,
    "info": infoController.text,
  });
  
  print('Status code: ${response.statusCode}');
  print('Response body: ${response.body}');
  
  if (response.statusCode == 500) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Success'),
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyUpDE(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Failed to update data'),
    ));
  }
}

}

