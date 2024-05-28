import 'package:cart/login.dart';
import 'package:cart/register.dart';
import 'package:flutter/material.dart';

class MyGate extends StatefulWidget {
  const MyGate({Key? key}) : super(key: key);

  @override
  State<MyGate> createState() => _MyGateState();
}

class _MyGateState extends State<MyGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 10,
                left: 100,
                right: 100,
              ),
              child: Image(
                  image:
                      AssetImage('/Users/mrasheed/cart/lib/images/open.png')),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 100,
                right: 100,
              ),
              child: Text(
                "Fresh Food Every Day",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // const Spacer(),
            Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginPage(), 
                    ),
                  );
                }, style: ElevatedButton.styleFrom(
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

                child: Text('Sign In'), 
              ),
            ),

            Padding(padding: EdgeInsets.all(5),
            child: Text('Or'),),


            Padding(
              padding: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyRegister(), 
                    ),
                  );
                }, style: ElevatedButton.styleFrom(
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

                child: Text('Sign Up'), 
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
