import 'dart:convert';

import 'package:http/http.dart' as http;

Future fetch() async {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  final response = await http.get(Uri.parse(url));
  final decoded = jsonDecode(response.body)['pokemon'];
  final result = decoded.map((data) =>
      Pokemon(id: data.id, name: data.name, num: data.num, img: data.img));
  print(result[0]);
  return result;
}

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
