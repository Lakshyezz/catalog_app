import 'dart:convert';

class CatalogModel {
  static List<Item> items = [];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String imgUrl;
  final num price;
  final String color;

  Item(
    this.id,
    this.name,
    this.desc,
    this.imgUrl,
    this.price,
    this.color,
  );

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? imgUrl,
    num? price,
    String? color,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      imgUrl ?? this.imgUrl,
      price ?? this.price,
      color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'desc': desc});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'price': price});
    result.addAll({'color': color});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['desc'] ?? '',
      map['imgUrl'] ?? '',
      map['price'] ?? 0,
      map['color'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, imgUrl: $imgUrl, price: $price, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.imgUrl == imgUrl &&
        other.price == price &&
        other.color == color;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        imgUrl.hashCode ^
        price.hashCode ^
        color.hashCode;
  }
}
