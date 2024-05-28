import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cart/admin.dart';
import 'package:flutter/src/material/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class MyAdmin extends StatefulWidget {
//   const MyAdmin({super.key});

//   @override
//   State<MyAdmin> createState() => _MyAdminState();
// }

// class _MyAdminState extends State<MyAdmin> {
//   TextEditingController nama = TextEditingController();
//   TextEditingController Harga = TextEditingController();
//   TextEditingController Stock = TextEditingController();
//   TextEditingController info = TextEditingController();

//   String? selectedNama;
//   List<String> namaList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchNama();
//   }

//   Future<void> fetchNama() async {
//     var url = Uri.http("localhost", "flutter/read.php");
//     var response = await http.get(url);

//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       setState(() {
//         namaList = List<String>.from(data.map((item) => item['nama']));
//       });
//     } else {
//       print("Failed to load data");
//     }
//   }

//   Future<void> kirimData() async {
//     var url = Uri.http("localhost", "flutter/masuk.php", {'q': '{http}'});
//     var response = await http.post(url, body: {
//       "nama": selectedNama,
//       "Stock": Stock.text,
//        "tanggal": currentDate.toString(),
//     });

//     var data = json.decode(response.body);
//     if (data.toString() == "Berhasil") {
//       print("Gass");
//     } else {
//       print("Gagal");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(20),
//               child: DropdownButtonFormField<String>(
//                 value: selectedNama,
//                 items: namaList.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     selectedNama = newValue!;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Nama Barang',
//                 ),
                
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(20),
//               child: TextField(
//                 controller: Stock,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Jumlah stock',
//                 ),
//               ),
//             ),

//             ElevatedButton(
//               onPressed: () {
//                 kirimData();
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyAdmin(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 fixedSize: Size(20.0, 100.0),
//               ),
//               child: Text("Selesai"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class MyAdmin extends StatefulWidget {
  const MyAdmin({super.key});

  @override
  State<MyAdmin> createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nama = TextEditingController();
    final TextEditingController Stock = TextEditingController();
    final TextEditingController tanggal = TextEditingController();
   DateTime currentDate = DateTime.now();
    Future kirimData() async {
      var url = Uri.http("localhost", "flutter/barang.php", {'q': '{http}'});
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
                fixedSize: Size(20.0, 100.0),
              ),
              child: Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}
