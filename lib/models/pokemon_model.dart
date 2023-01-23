// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return <String, dynamic>{
      'id': id,
      'num': num,
      'name': name,
      'img': img,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      num: map['num'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PokemonResponse {
  List<PokemonModel> pokemon;

  PokemonResponse({
    required this.pokemon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pokemon': pokemon.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonResponse.fromMap(Map<String, dynamic> map) {
    return PokemonResponse(
      pokemon: List<PokemonModel>.from(
        (map['pokemon'] as List).map<PokemonModel>(
          (x) => PokemonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonResponse.fromJson(String source) =>
      PokemonResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
