import 'package:flutter/material.dart';
import '../cardtab.dart';
import '../model/item_model.dart';
import '../splash_screen.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  final itemlist = ItemMod.itemlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _hed(),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: [
                  for (var i = 0; i < itemlist.length; i++)
                    InkWell(
                      onTap: () => [
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cardtab(
                                  i: i,
                                ))),
                      ],
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 0),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Image.asset(itemlist[i].image)),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      itemlist[i].name,
                                      style: TextStyle(
                                          fontFamily: 'Klme',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      itemlist[i].tit,
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Klme',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(2),
                                            margin: EdgeInsets.only(left: 20),
                                            decoration: BoxDecoration(
                                              color: grcolor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text(
                                              itemlist[i].group,
                                              style: TextStyle(
                                                  fontFamily: 'Klme',
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 16,
                                                  color: Color.fromRGBO(
                                                      255, 183, 0, 1)),
                                              Text(
                                                "محبوبیت:" + itemlist[i].star,
                                                style: TextStyle(
                                                    fontFamily: 'Klme',
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 13,
                                                    color: Color.fromRGBO(
                                                        255, 183, 0, 1)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _bod() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(7)),
                child: Image.asset(itemlist[0].image)),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemlist[0].name,
                    style: TextStyle(
                        fontFamily: 'Klme',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    itemlist[0].tit,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Klme',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: grcolor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            itemlist[0].group,
                            style: TextStyle(
                                fontFamily: 'Klme',
                                color: Colors.white,
                                fontSize: 13),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 16,
                                color: Color.fromRGBO(255, 183, 0, 1)),
                            Text(
                              "محبوبیت:" + itemlist[0].star,
                              style: TextStyle(
                                  fontFamily: 'Klme',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                  color: Color.fromRGBO(255, 183, 0, 1)),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _hed() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: grcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            _appbar(grcolor),
            Text(
              "علاقه مندی ها",
              style: TextStyle(
                  fontFamily: 'Klme',
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Text(
              "لیست علاقه بندی های شما",
              style: TextStyle(
                  fontFamily: 'Klme',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Container _appbar(Color grcolor) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
            ),
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
