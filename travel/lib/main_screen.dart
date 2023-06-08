import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "travel",
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/airp.png'))),
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 80),
                    child: new Positioned(
                      child: new Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: Text(
                          "Genova ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 60),
                    child: new Positioned(
                        child: new Align(
                      alignment: FractionalOffset.bottomLeft,
                      child: Text(
                        "Italiya , Genova ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 40, 28, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Distance"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "72Km",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Temp"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "28C ",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Rating"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "4.8",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 0, 10),
              child: Row(
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
              child: Row(
                children: const [
                  Expanded(
                      child: Text(
                    "Lorem ipsum dolor sit amet, orem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et d consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Egestas purus viverra accumsan in nisl nisi",
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text("1200\$",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                      highlightColor: Colors.orange,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
