// To parse this JSON data, do
//
//     final catogeryModel = catogeryModelFromJson(jsonString);

import 'dart:convert';

CatogeryModel catogeryModelFromJson(String str) => CatogeryModel.fromJson(json.decode(str));

String catogeryModelToJson(CatogeryModel data) => json.encode(data.toJson());

class CatogeryModel {
    List<Record> records;

    CatogeryModel({
        required this.records,
    });

    factory CatogeryModel.fromJson(Map<String, dynamic> json) => CatogeryModel(
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
    };
}

class Record {
    String id;
    String category;
    String isGallery;

    Record({
        required this.id,
        required this.category,
        required this.isGallery,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        category: json["category"],
        isGallery: json["is_gallery"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "is_gallery": isGallery,
    };
}
