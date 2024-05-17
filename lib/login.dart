import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cart/home.dart';
import 'package:cart/admin.dart';


void main() => runApp(MaterialApp(
      home: LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future _login() async {
    print("\n=======|> memanggil fungsi _login() ");

    var url = Uri.http("localhost", "flutter/login.php", {'q': '{http}'});
    var response = await http.post(
      url, 
      body: {
        "email" : email.text,
        "password" : password.text
        });
    var data = json.decode(response.body);
    
    if ( data.toString() == "Success") {
      print("Data 'log in' ditemukan!\n");
      setState(() {
        email.clear();
        password.clear();
      });

      Navigator.push(context,
       MaterialPageRoute(builder: (context) => MyHome()
       ));
    } else if(data.toString() == "Atmin"){
        print("Atmin Udah dateng!\n");
      setState(() {
        email.clear();
        password.clear();
      });

      Navigator.push(context,
       MaterialPageRoute(builder: (context) => MyAdmin()
       ));
    }else {
      print("Data tidak ada...\n"+data.toString());

      setState(() {
        password.clear();
      });
    }
        
  }



  

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         // ignore: prefer_const_literals_to_create_immutables
          //         colors: [
          //       Colors.deepOrangeAccent,
          //       Colors.red,
          //       Colors.redAccent
          //     ])),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(10),
                // child: error? Errormsg(Errormsg)  : Container(),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                      label: Text("Username"), icon: Icon(Icons.person)),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      label: Text("Kata Sandi"), icon: Icon(Icons.key)),
                  onChanged: (value) {},
                ),
              ),
              Container(
                child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                           _login();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                    top: 26,
                    bottom: 26,
                    left: 100,
                    right: 100
                  ), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), 
                  ),
                  primary: const Color.fromARGB(255, 112, 91, 222), 
                        ),
                        child: Text("Masuk"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
