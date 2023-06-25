import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../cardtab.dart';
import '../model/item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final itemlist = ItemMod.itemlist();

    Color grcolor = Color.fromARGB(255, 7, 223, 112);
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), // Farsi
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _haeder(grcolor),
              _titlist(),
              _scroll(itemlist, grcolor),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/imgh.png'))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "محبوب ترین ها",
                      style: TextStyle(
                          fontFamily: 'Klme',
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Container(
                      child: Row(children: [
                        Text(
                          "همه",
                          style: TextStyle(
                              fontFamily: 'Klme',
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              _scroll(itemlist, grcolor),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.5,
                      0.7,
                      0.6,
                    ],
                    colors: [
                      Colors.transparent,
                      Colors.white10,
                      Colors.white54,
                      Color.fromARGB(190, 255, 255, 255),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _scroll(List<ItemMod> itemlist, Color grcolor) {
    return SizedBox(
        height: 320,
        child: ListView(
          scrollDirection: Axis.horizontal,
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
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.all(8),
                    width: 230,
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
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                width: 232,
                                height: 185,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: AssetImage(itemlist[i].image))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    itemlist[i].name,
                                    style: TextStyle(
                                        fontFamily: 'Klme',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  ),
                                  Container(
                                    width: 100,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: grcolor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      itemlist[i].group,
                                      style: TextStyle(
                                          fontFamily: 'Klme',
                                          color: Colors.white,
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                itemlist[i].tit,
                                style: TextStyle(
                                    fontFamily: 'Klme',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600,
                                    fontSize: 13),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    size: 16,
                                    color: Color.fromRGBO(255, 183, 0, 1)),
                                Text(
                                  "محبوبیت:" + itemlist[i].star,
                                  style: TextStyle(
                                      fontFamily: 'Klme',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13,
                                      color: Color.fromRGBO(255, 183, 0, 1)),
                                )
                              ],
                            )
                          ]),
                    )),
              ),
          ],
        ));
  }

  Container _itemmod(List<ItemMod> itemlist, Color grcolor) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(8),
        width: 230,
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
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                width: 232,
                height: 185,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(7),
                    image:
                        DecorationImage(image: AssetImage(itemlist[0].image))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemlist[0].name,
                    style: TextStyle(
                        fontFamily: 'Klme',
                        fontWeight: FontWeight.w900,
                        fontSize: 17),
                  ),
                  Container(
                    width: 100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2),
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
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                itemlist[0].tit,
                style: TextStyle(
                    fontFamily: 'Klme',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                    fontSize: 13),
              ),
            ),
            Row(
              children: [
                Icon(Icons.star,
                    size: 16, color: Color.fromRGBO(255, 183, 0, 1)),
                Text(
                  "محبوبیت:" + itemlist[0].star,
                  style: TextStyle(
                      fontFamily: 'Klme',
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      color: Color.fromRGBO(255, 183, 0, 1)),
                )
              ],
            )
          ]),
        ));
  }

  Container _titlist() {
    return Container(
      height: 50,
      padding: EdgeInsets.only(right: 24, top: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              "گیاهان آپارتمانی",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Klme',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              "گل های آپارتمانی",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Klme',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              "کاکتوس",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Klme',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              "گیاهان باغچه ای",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Klme',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27),
            child: Text(
              "گیاهان دارویی ",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Klme',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _listtit() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(right: 24, top: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "گیاهان آپارتمانی",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Klme',
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "گل های آپارتمانی",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Klme',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "کاکتوس",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Klme',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "گیاهان باغچه ای",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Klme',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                "گیاهان دارویی ",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Klme',
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _haeder(Color grcolor) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: grcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _appbar(grcolor),
          _tit(),
          _searchbar(),
        ],
      ),
    );
  }

  Container _tit() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "سلام طاهای عزیز ، خوش آمدید!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Klme',
                fontWeight: FontWeight.w900),
          ),
          Text(
            "گیاه یا گل مورد نظر خود را جستجو کنید",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Klme',
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Container _searchbar() {
    return Container(
      height: 51,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 35),
          suffixIconColor: Color.fromARGB(255, 7, 223, 112),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Icon(Icons.search),
          ),
          hintText: "جستجو کنید...",
          fillColor: Colors.white,
          filled: true,
          hintStyle:
              new TextStyle(fontFamily: 'Klme', color: Colors.grey.shade500),
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(50),
              ),
              borderSide: BorderSide.none),
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
