// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
    ArticleModel({
        required this.activity,
        required this.type,
        //required this.participants,
        //required this.price,
        required this.link,
        required this.key,
        //required this.accessibility,
    });

    String activity;
    String type;
    //int participants;
    //int price;
    String link;
    String key;
    //int accessibility;

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        activity: json["activity"],
        type: json["type"],
        //participants: json["participants"],
        //price: json["price"],
        link: json["link"],
        key: json["key"],
        //accessibility: json["accessibility"],
    );

    Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        //"participants": participants,
        //price": price,
        "link": link,
        "key": key,
        //"accessibility": accessibility,
    };
}
