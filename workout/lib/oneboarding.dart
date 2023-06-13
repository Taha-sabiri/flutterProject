import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workout/intropage.dart';
import 'package:workout/intropage2.dart';
import 'package:workout/intropage3.dart';

import 'main_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            Intropage(),
            Intropage2(),
            Intropage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                      dotColor: Colors.white.withOpacity(0.5),
                      activeDotColor: Colors.white),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 50,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 144,
                height: 42,
                child: OutlinedButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text("Log in"),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 144,
                height: 42,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.blueAccent.shade400,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text("Sing up"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MainScreen();
                    }));
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
