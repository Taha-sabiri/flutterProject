import 'package:flutter/foundation.dart';

class Currency {
  String? id;
  String? title;
  String? price;
  String? changed;
  String? stauts;

  Currency(
      {required this.id,
      required this.title,
      required this.price,
      required this.changed,
      required this.stauts});
}
