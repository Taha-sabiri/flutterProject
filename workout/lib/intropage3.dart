import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intropage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fitness",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adid tempor incididunt ut labore et dolore magna aliqua",
                style: TextStyle(color: Colors.white),
              )
            ]),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            'assets/images/full-body-young-cheerful-smiling-woman-sports-wear-isolated-violet-light-wall.jpg'),
        fit: BoxFit.cover,
      )),
    );
  }
}
