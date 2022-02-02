// To parse this JSON data, do
//
//     final boomBoxModel = boomBoxModelFromMap(jsonString);

import 'dart:convert';

BoomBoxModel boomBoxModelFromMap(String str) =>
    BoomBoxModel.fromMap(json.decode(str));

String boomBoxModelToMap(BoomBoxModel data) => json.encode(data.toMap());

class BoomBoxModel {
  // int? status;
  // String? msg;
  // List<Map<String, dynamic>>? list;
  // String? volumeBar;

  BoomBoxModel({
    required this.status,
    required this.msg,
    required this.list,
    required this.volumeBar,
  });

  int status;
  String msg;
  List<ListElement> list;
  String volumeBar;

  BoomBoxModel copyWith({
    int? status,
    String? msg,
    List<ListElement>? list,
    String? volumeBar,
  }) =>
      BoomBoxModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        list: list ?? this.list,
        volumeBar: volumeBar ?? this.volumeBar,
      );

  factory BoomBoxModel.fromMap(Map<String, dynamic> json) => BoomBoxModel(
        status: json["status"],
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromMap(x))),
        volumeBar: json["volumeBar"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
        "volumeBar": volumeBar,
      };
}

class ListElement {
  ListElement({
    required this.id,
    required this.title,
    required this.icon,
  });

  int id;
  String title;
  String icon;

  ListElement copyWith({
    int? id,
    String? title,
    String? icon,
  }) =>
      ListElement(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
      );

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        id: json["id"] ?? 1,
        title: json["title"] ?? "",
        icon: json["icon"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "icon": icon,
      };
}
