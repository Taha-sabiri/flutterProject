import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../home_page.dart';

Color grcolor = Color.fromARGB(255, 7, 223, 112);

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Homepage()))
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 223, 112),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/images/LOGO.png'),
            height: 100,
          ),
          SpinKitFadingCube(
            color: Colors.white,
            size: 20.0,
          )
        ]),
      ),
    );
  }
}
