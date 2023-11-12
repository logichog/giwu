import 'package:giwu_mobile/models/KeyEnglish.dart';

class Selections {
  Selections({
    required this.bible,
    required this.book,
    required this.chapter,
  
    required this.abbreviation,
    required this.language,
    required this.version,
    required this.books,
  });
  
  String bible;
  int book;
  int chapter;
  
  String abbreviation;
  String language;
  String version;
  List<KeyEnglish> books;
}