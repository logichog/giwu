import 'package:giwu_mobile/models/verse.dart';

class Chapter {
  Chapter({required this.id,required this.chapter,required this.verses});
  
  int id;
  int chapter;
  List<Verse> verses;

  factory Chapter.fromJson(Map<String, dynamic> json) {
    List<Verse> verseList = json['verses'];
    return Chapter(
      id: json['id'],
      chapter: json['verse'],
      verses: verseList
    );
  }
}