import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
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
                "Supplements",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: TextStyle(color: Colors.white),
              )
            ]),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            'assets/images/Stocksy_txp2a0713a3kbz200_Medium_2888453-6a7eae7679ad4c73a384fd9dfcdf9de4.jpg'),
        fit: BoxFit.cover,
      )),
    );
  }
}
