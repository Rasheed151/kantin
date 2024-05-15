import 'package:cart/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MyRegister extends StatelessWidget {
  const MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:_MyRegister(),
    );
  }
}

class _MyRegister extends StatelessWidget {
  _MyRegister({super.key});

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

    Future kirimData() async {
    var url = Uri.http("localhost", "flutter/register.php", {'q': '{http}'});
    var respon = await http.post(url,
    body: {
      "email": username.text,
      "password": password.text,
    });

    var data = json.decode(respon.body);
    if (data.toString() == "Berhasil") {
      print("Gass");
    } else {
      print("Gagal");
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
               Container(
                margin: const EdgeInsets.only(top: 70),
                padding: const EdgeInsets.all(10),
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 10),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 100),
                margin: const EdgeInsets.only(top: 10),
              child: TextField(
                controller:password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),
            ),

            //  const Spacer(),

            ElevatedButton(
              onPressed: () {
                kirimData();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
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

              child: Text("Selesai"),
            ),
          ],
        ),
      ),
    );
  }
}
