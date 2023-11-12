import 'dart:convert';

class KeyEnglish {
  KeyEnglish({
    required this.id,
    required this.name,
    this.testament,
    this.genreId,
    this.chapter_count,
  });
  
  int id;
  String name;
  String? testament;
  int? genreId;
  int? chapter_count;
  
  factory KeyEnglish.fromRawJson(String str) => KeyEnglish.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KeyEnglish.fromJson(Map<String, dynamic> json) => KeyEnglish(
    id: json["b"],
    name: json["n"],
    testament: json["t"],
    genreId: json["g"],
  );

  Map<String, dynamic> toJson() => {
    "b": id,
    "n": name,
    "t": testament,
    "g": genreId,
  };
}