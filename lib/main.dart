import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset(
              'assets/images/Fitness-photography-elina-fairytale.jpeg'),
          title: "learn coding",
          body: "sdsadsadasdasdasda",
          footer: Text("sdadasdadasdsads")),
      PageViewModel(
          image: Image.asset(
              'assets/images/Fitness-photography-elina-fairytale.jpeg'),
          title: "learn coding",
          body: "sdsadsadasdasdasda",
          footer: Text("sdadasdadasdsads")),
      PageViewModel(
          image: Image.asset(
              'assets/images/Fitness-photography-elina-fairytale.jpeg'),
          title: "learn coding",
          body: "sdsadsadasdasdasda",
          footer: Text("sdadasdadasdsads"))
    ];
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: IntroductionScreen(
            done: Text(
              "DONE",
              style: TextStyle(color: Colors.black),
            ),
            onDone: () {},
            pages: getPages(),
            globalBackgroundColor: Colors.red,
          ),
        ));
  }
}
