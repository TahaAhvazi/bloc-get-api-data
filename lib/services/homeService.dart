// To parse this JSON data, do
//
//     final boredApiClass = boredApiClassFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../main.dart';

BoredApiClass boredApiClassFromJson(String str) =>
    BoredApiClass.fromJson(json.decode(str));

String boredApiClassToJson(BoredApiClass data) => json.encode(data.toJson());

class BoredApiClass {
  BoredApiClass({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  String activity;
  String type;
  int participants;
  int price;
  String link;
  String key;
  double accessibility;

  factory BoredApiClass.fromJson(Map<String, dynamic> json) => BoredApiClass(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}

class BoredService {
  Future<BoredApiClass> getBoredActivities() async {
    final response =
        await get(Uri.parse('https://www.boredapi.com/api/activity'), headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Methods": "GET, POST"
    });
    final activity = boredApiClassFromJson(response.body);
    return activity;
  }
}
