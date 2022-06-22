import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<item> items;
}

class item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory item.fromMap(Map<String, dynamic> map) {
    return item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map['color'],
      image: map['image'],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        'color': color,
        'image': image,
      };
}
