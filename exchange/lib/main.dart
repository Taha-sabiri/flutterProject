import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:miniproject/model/Currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // fa
      ],
      theme: ThemeData(
          fontFamily: 'IRANSans',
          textTheme: const TextTheme(
              titleMedium: TextStyle(
                  fontFamily: 'IRANSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              titleSmall: TextStyle(
                  fontFamily: 'IRANSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w300),
              titleLarge: TextStyle(
                  fontFamily: 'IRANSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
              displaySmall: TextStyle(
                  fontFamily: 'IRANSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.green),
              displayMedium: TextStyle(
                  fontFamily: 'IRANSans',
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.red))),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> currency = [];

  getRespons() {
    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";
    http.get(Uri.parse(url)).then((value) {
      if (currency.isEmpty) {
        if (value.statusCode == 200) {
          List jsonList = convert.jsonDecode(value.body);
          if (jsonList.length > 0) {
            for (int i = 0; i < jsonList.length; i++) {
              setState(() {
                currency.add(Currency(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  changed: jsonList[i]["changes"],
                  stauts: jsonList[i]["status"],
                ));
              });
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getRespons();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          actions: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.money,
              color: Colors.green,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "قیمت به روز ارز",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ))),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.question_mark_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "نرخ آزاد ارز چیست؟",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است تکنولوژی مورد نیاز و کاربردهای متنوع  را می طلبد",
                  style: TextStyle(color: Colors.grey.shade600),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000)),
                      color: Colors.grey.shade700),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "نام آزاد ارز",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "قیمت",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        "تغییر",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: currency.length,
                      itemBuilder: (BuildContext context, int postion) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Item(postion, currency),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        if (index % 5 == 0) {
                          return Adds();
                        } else {
                          return SizedBox.shrink();
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton.icon(
                            onPressed: () => _showSnbar(
                                context, "به روزرسانی با موفقیت انجام  شد ✅"),
                            icon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Icon(CupertinoIcons.refresh,
                                  color: Colors.black),
                            ),
                            label: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                "بروزرسانی",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000))),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade400,
                                )),
                          ),
                        ),
                        Text("آخرین بروز رسانی ${_getTime()}"),
                        SizedBox(
                          width: 3,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String _getTime() {
    return "۲۰:۴۵";
  }
}

void _showSnbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      msg,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    backgroundColor: Colors.green,
  ));
}

class Item extends StatelessWidget {
  int postion;
  List<Currency> currency;
  Item(
    this.postion,
    this.currency,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 3.0, color: Colors.grey)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          )),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          currency[postion].title!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          currency[postion].price!,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(currency[postion].changed!,
            style: currency[postion].stauts == "n"
                ? Theme.of(context).textTheme.displaySmall
                : Theme.of(context).textTheme.displayMedium),
      ]),
    );
  }
}

class Adds extends StatelessWidget {
  const Adds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(blurRadius: 3.0, color: Colors.grey)
            ],
            color: Colors.green,
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            )),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            "😍تبلـــیـ",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ]),
      ),
    );
  }
}
