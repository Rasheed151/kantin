import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cart/cart.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  StreamController<dynamic> streamController = StreamController<dynamic>();
  Timer? _timer;
  final List<String> items = [
    '/Users/mrasheed/cart/lib/images/tahu.png',
    '/Users/mrasheed/cart/lib/images/tempe.png',
    '/Users/mrasheed/cart/lib/images/telur.png',
    '/Users/mrasheed/cart/lib/images/risol.png'
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

// void addItemToCart(int Index){
//   dataList
// }
  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   streamController.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
          return MyCart();
        })),
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_cart),
        ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
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
                            leading: Image.asset(items[index],width: 200,height: 200,), 
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
    TextButton(
      child: Text(
        "Add to cart".toUpperCase(),
        style: TextStyle(fontSize: 14)
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
        foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 44, 167, 77)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Color.fromARGB(255, 44, 167, 77))
          )
        )
      ),
      onPressed: () => null
    ),
    SizedBox(width: 10),
    ElevatedButton(
      child: Text(
        "Buy now".toUpperCase(),
        style: TextStyle(fontSize: 14)
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 0, 0, 0)),
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 235, 39, 39)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(color: Color.fromARGB(255, 218, 49, 49))
          )
        )
      ),
      onPressed: () => null
    )
  ]
)
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





// import 'dart:async';
// import 'dart:convert';
// import 'dart:html';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   StreamController<dynamic> streamController = StreamController<dynamic>();
//   Timer? _timer;
//   final List<String> items = [
//   '/Users/mrasheed/cart/lib/images/tahu.png',
//   '/Users/mrasheed/cart/lib/images/tempe.png',
//   '/Users/mrasheed/cart/lib/images/telur.png',
//   '/Users/mrasheed/cart/lib/images/risol.png'
// ];

//   Future _ambilData() async {
//     var response =
//         await http.get(Uri.parse('http://localhost/flutter/read.php'));
//     var data = jsonDecode(response.body);

//     streamController.add(data);
//   }

//   void initState() {
//     _ambilData();

//     _timer = Timer.periodic(Duration(seconds: 5), (timer) => _ambilData());
//     super.initState();
//   }

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             StreamBuilder<dynamic>(
//               stream: streamController.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   List dataList = snapshot.data;
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: dataList.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 4,
//                         child: ListTile(
//                           title: Text(items[index]),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(height: 8),
//                               Text('${dataList[index]['nama']}'),
//                               SizedBox(height: 8),
//                               Text('${dataList[index]['Harga']}'),
//                               SizedBox(height: 4),
//                               Text('${dataList[index]['Stock']}'),
//                               SizedBox(height: 4),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// }
