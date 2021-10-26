import 'dart:convert';

class Pokemon {
  int id;
  String num;
  String name;
  String img;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'],
      num: map['num'],
      name: map['name'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));
}
