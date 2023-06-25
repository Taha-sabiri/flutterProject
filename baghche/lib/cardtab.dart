import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../splash_screen.dart';

class Cardtab extends StatelessWidget {
  final int i;

  const Cardtab({required this.i, super.key});

  @override
  Widget build(BuildContext context) {
    final itemlist = ItemMod.itemlist();

    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: grcolor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          itemlist[i].image,
                          cacheWidth: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              itemlist[i].type + '\n' + itemlist[i].name,
                              style: TextStyle(
                                  height: 1,
                                  fontFamily: 'Klme',
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 210,
                              child: Text(
                                itemlist[i].tit,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'Klme',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 100,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Text(
                                itemlist[i].group,
                                style: TextStyle(
                                    fontFamily: 'Klme',
                                    color: grcolor,
                                    fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(scrollDirection: Axis.vertical, children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.info,
                            color: grcolor,
                          ),
                          Text(
                            "توضیحات",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Klme',
                                fontWeight: FontWeight.w700,
                                color: grcolor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            itemlist[i].longtit,
                            maxLines: 7,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Klme',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 10),
                      child: Row(
                        children: [
                          Icon(Icons.water, color: Colors.blueAccent),
                          Text(
                            "نحوه ی پرورش",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Klme',
                                fontWeight: FontWeight.w700,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 230,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            itemlist[i].longtit,
                            maxLines: 7,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Klme',
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
