import 'package:giwu_mobile/models/appError.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';

class AppData {
  AppData({
    required this.bible,
    required this.book,
    required this.chapter,
  
    required this.abbreviation,
    required this.language,
    required this.version,
    required this.books,
    required this.host,
    this.appError,
  });

  final String host;
  AppError? appError;
  
  String bible;
  int book;
  int chapter;
  
  String abbreviation;
  String language;
  String version;
  List<KeyEnglish> books;
}
