// To parse this JSON data, do
//
//     final catogeryReportModel = catogeryReportModelFromJson(jsonString);

import 'dart:convert';

CatogeryReportModel catogeryReportModelFromJson(String str) =>
    CatogeryReportModel.fromJson(json.decode(str));

String catogeryReportModelToJson(CatogeryReportModel data) =>
    json.encode(data.toJson());

class CatogeryReportModel {
  Records records;

  CatogeryReportModel({
    required this.records,
  });

  factory CatogeryReportModel.fromJson(Map<String, dynamic> json) =>
      CatogeryReportModel(
        records: Records.fromJson(json["records"]),
      );

  Map<String, dynamic> toJson() => {
        "records": records.toJson(),
      };
}

class Records {
  List<The2022> the2022;

  Records({
    required this.the2022,
  });

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        the2022:
            List<The2022>.from(json["2022"].map((x) => The2022.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "2022": List<dynamic>.from(the2022.map((x) => x.toJson())),
      };
}

class The2022 {
  String id;
  String title;
  String image;
  String categoryId;
  String? description;
  String year;
  String active;

  The2022({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
    this.description,
    required this.year,
    required this.active,
  });

  factory The2022.fromJson(Map<String, dynamic> json) => The2022(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        categoryId: json["category_id"],
        description: json["description"],
        year: json["year"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "category_id": categoryId,
        "description": description,
        "year": year,
        "active": active,
      };
}
