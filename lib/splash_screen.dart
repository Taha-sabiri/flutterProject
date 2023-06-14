import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:podapp/main_screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => mainScreen()))
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
            height: 64,
          ),
          SpinKitThreeBounce(
            color: Colors.orange,
            size: 20.0,
          )
        ]),
      ),
    );
  }
}
