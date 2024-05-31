import 'dart:async';
import 'dart:convert';
import 'package:cart/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cart/cart.dart';
import 'package:cart/provider.dart';
import 'delete.dart';

class MyUpDE extends StatefulWidget {
  const MyUpDE({Key? key}) : super(key: key);

  @override
  State<MyUpDE> createState() => _MyUpDEState();
}

class _MyUpDEState extends State<MyUpDE> {
  StreamController<dynamic> streamController = StreamController<dynamic>();
  Timer? _timer;
  final List<String> items = [
    'lib/images/tahu.png',
    'lib/images/tempe.png',
    'lib/images/telur.png',
    'lib/images/risol.png'
  ];

  Future<void> _ambilData() async {
    var response = await http.get(Uri.parse('http://localhost/flutter/read.php'));
    var data = jsonDecode(response.body);
    streamController.add(data);
  }

  @override
  void initState() {
    _ambilData();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => _ambilData());
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyCart()),
        ),
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_cart),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 100,
                  right: 100,
                ),
                child: Image(
                  image: AssetImage('lib/images/open.png'),
                ),
              ),
              StreamBuilder<dynamic>(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List dataList = snapshot.data;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          child: ListTile(
                            // leading: Image.asset(items[index],
                            //     width: 200, height: 200),
                            title: Text('${dataList[index]['nama']}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text('Harga: ${dataList[index]['Harga']}'),
                                SizedBox(height: 4),
                                Text('Stock: ${dataList[index]['Stock']}'),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Update(
  nama: dataList[index]['nama'][0], 
  data: {
    "Harga": dataList[index]["Harga"],
    "Stock": dataList[index]["Stock"],
    "info": dataList[index]["info"],
  },
),
                
              ),
            );
          },
          child: Text('Update'),
          
        ),
                                    SizedBox(width: 5),
ElevatedButton(
  onPressed: () {
    String nama = dataList[index]['id'].toString();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => delete(nama: nama),
      ),
    );
  },
  child: Text("delete"),
),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
