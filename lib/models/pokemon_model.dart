import 'dart:convert';

class PokemonModel {
  int id;
  String num;
  String name;
  String img;

  PokemonModel({
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

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      num: map['num'],
      name: map['name'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));
}
