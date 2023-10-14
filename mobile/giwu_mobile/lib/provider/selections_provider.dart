import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/data/defaultBibleData.dart';
import 'package:giwu_mobile/functions/database.dart';
import 'package:giwu_mobile/models/BibleVersionKey.dart';
import 'package:giwu_mobile/models/book.dart';
import 'package:giwu_mobile/models/selections.dart';
import 'package:giwu_mobile/models/verse.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

final List<Book> bookList = [
    Book(
      id: 1,
      name: "Genesis",
      chapter_count: 50,
    ),
    Book(
      id: 2,
      name: "Exodus",
      chapter_count: 40,
    ),
    Book(
      id: 3,
      name: "Leviticus",
      chapter_count: 27,
    ),
    Book(
      id: 4,
      name: "Numbers",
      chapter_count: 36,
    ),
    Book(
      id: 5,
      name: "Deuteronomy",
      chapter_count: 34,
    ),
    Book(
      id: 6,
      name: "Joshua",
      chapter_count: 24,
    ),
    Book(
      id: 7,
      name: "Judges",
      chapter_count: 21,
    ),
    Book(
      id: 8,
      name: "Ruth",
      chapter_count: 4,
    ),
    Book(
      id: 9,
      name: "1 Samuel",
      chapter_count: 31,
    ),
    Book(
      id: 10,
      name: "2 Samuel",
      chapter_count: 24,
    ),
    Book(
      id: 11,
      name: "1 Kings",
      chapter_count: 22,
    ),
    Book(
      id: 12,
      name: "2 Kings",
      chapter_count: 25,
    ),
    Book(
      id: 13,
      name: "1 Chronicles",
      chapter_count: 29,
    ),
    Book(
      id: 14,
      name: "2 Chronicles",
      chapter_count: 36,
    ),
    Book(
      id: 15,
      name: "Ezra",
      chapter_count: 10,
    ),
    Book(
      id: 16,
      name: "Nehemiah",
      chapter_count: 13,
    ),
    Book(
      id: 17,
      name: "Esther",
      chapter_count: 10,
    ),
    Book(
      id: 18,
      name: "Job",
      chapter_count: 42,
    ),
    Book(
      id: 19,
      name: "Psalms",
      chapter_count: 150,
    ),
    Book(
      id: 20,
      name: "Proverbs",
      chapter_count: 31,
    ),
    Book(
      id: 21,
      name: "Ecclesiastes",
      chapter_count: 12,
    ),
    Book(
      id: 22,
      name: "Song of Solomon",
      chapter_count: 8,
    ),
    Book(
      id: 23,
      name: "Isaiah",
      chapter_count: 66,
    ),
    Book(
      id: 24,
      name: "Jeremiah",
      chapter_count: 52,
    ),
    Book(
      id: 25,
      name: "Lamentations",
      chapter_count: 5,
    ),
    Book(
      id: 26,
      name: "Ezekiel",
      chapter_count: 48,
    ),
    Book(
      id: 27,
      name: "Daniel",
      chapter_count: 12,
    ),
    Book(
      id: 28,
      name: "Hosea",
      chapter_count: 14,
    ),
    Book(
      id: 29,
      name: "Joel",
      chapter_count: 3,
    ),
    Book(
      id: 30,
      name: "Amos",
      chapter_count: 9,
    ),
    Book(
      id: 31,
      name: "Obadiah",
      chapter_count: 1,
    ),
    Book(
      id: 32,
      name: "Jonah",
      chapter_count: 4,
    ),
    Book(
      id: 33,
      name: "Micah",
      chapter_count: 7,
    ),
    Book(
      id: 34,
      name: "Nahum",
      chapter_count: 3,
    ),
    Book(
      id: 35,
      name: "Habakkuk",
      chapter_count: 3,
    ),
    Book(
      id: 36,
      name: "Zephaniah",
      chapter_count: 3,
    ),
    Book(
      id: 37,
      name: "Haggai",
      chapter_count: 2,
    ),
    Book(
      id: 38,
      name: "Zechariah",
      chapter_count: 14,
    ),
    Book(
      id: 39,
      name: "Malachi",
      chapter_count: 4,
    ),
    Book(
      id: 40,
      name: "Matthew",
      chapter_count: 28,
    ),
    Book(
      id: 41,
      name: "Mark",
      chapter_count: 16,
    ),
    Book(
      id: 42,
      name: "Luke",
      chapter_count: 24,
    ),
    Book(
      id: 43,
      name: "John",
      chapter_count: 21,
    ),
    Book(
      id: 44,
      name: "Acts",
      chapter_count: 28,
    ),
    Book(
      id: 45,
      name: "Romans",
      chapter_count: 16,
    ),
    Book(
      id: 46,
      name: "1 Corinthians",
      chapter_count: 16,
    ),
    Book(
      id: 47,
      name: "2 Corinthians",
      chapter_count: 13,
    ),
    Book(
      id: 48,
      name: "Galatians",
      chapter_count: 6,
    ),
    Book(
      id: 49,
      name: "Ephesians",
      chapter_count: 6,
    ),
    Book(
      id: 50,
      name: "Philippians",
      chapter_count: 4,
    ),
    Book(
      id: 51,
      name: "Colossians",
      chapter_count: 4,
    ),
    Book(
      id: 52,
      name: "1 Thessalonians",
      chapter_count: 5,
    ),
    Book(
      id: 53,
      name: "2 Thessalonians",
      chapter_count: 3,
    ),
    Book(
      id: 54,
      name: "1 Timothy",
      chapter_count: 6,
    ),
    Book(
      id: 55,
      name: "2 Timothy",
      chapter_count: 4,
    ),
    Book(
      id: 56,
      name: "Titus",
      chapter_count: 3,
    ),
    Book(
      id: 57,
      name: "Philemon",
      chapter_count: 1,
    ),
    Book(
      id: 58,
      name: "Hebrews",
      chapter_count: 13,
    ),
    Book(
      id: 59,
      name: "James",
      chapter_count: 5,
    ),
    Book(
      id: 60,
      name: "1 Peter",
      chapter_count: 5,
    ),
    Book(
      id: 61,
      name: "2 Peter",
      chapter_count: 3,
    ),
    Book(
      id: 62,
      name: "1 John",
      chapter_count: 5,
    ),
    Book(
      id: 63,
      name: "2 John",
      chapter_count: 1,
    ),
    Book(
      id: 64,
      name: "3 John",
      chapter_count: 1,
    ),
    Book(
      id: 65,
      name: "Jude",
      chapter_count: 1,
    ),
    Book(
      id: 66,
      name: "Revelation",
      chapter_count: 22,
    ),
  ];

final selectionsProvider = StateNotifierProvider<SelectionsNotificatifier, Selections>((ref) {
  return SelectionsNotificatifier();
});

class SelectionsNotificatifier extends StateNotifier<Selections> {
  SelectionsNotificatifier()
      : super(Selections(
        bible: "t_kjv",
        book: 1,
        chapter: 1,

        abbreviation:"KJV",
        language:"english",
        version:"King James Version",
        books: bookList,
      ));


  void selectBible(String bible) {
    state.bible = bible;
  }

  void selectBook(int book) {
    state.book = book;
  }

  void selectChapter(int chapter) {
    state.chapter = chapter;
  }

  String getBibleName() {

    var bibleIndex = bibleList.indexWhere((x) => x.table == state.bible);

    var bibleName = bibleList[bibleIndex].version;
    return bibleName;
  }

  String getBibleSlug() {

    var bibleIndex = bibleList.indexWhere((x) => x.table == state.bible);

    var bibleSlug = bibleList[bibleIndex].table;
    return bibleSlug;
  }

  String getBook(List<Book> bookList) {

    var bookIndex = bookList.indexWhere((x) => x.id == state.book);

    var bookName = bookList[bookIndex].name;
    return bookName;
  }

  Future<bool> fetchBible({String? bibleTable = "t_kjv"}) async {
    // print("fetchBible");
    try {
      /*
        final response = await http.get(Uri.parse('https://10.0.2.2:5066/bible/${bibleTable!}'));

        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          final bibleInfo = Bible.fromJson(jsonDecode(response.body));
          
          // print("success");
          
          final newState = state;
          newState.abbreviation = bibleInfo.abbreviation;
          newState.language = bibleInfo.language;
          newState.version = bibleInfo.version;
          newState.books = bibleInfo.books;

          state = newState;
        } else {
          // print("fails");
          print(response.statusCode);
          // If the server did not return a 200 OK response,
          // then throw an exception.
          // throw Exception('Failed to load Bible');
          return false;
        }
      */

      return false;

    } catch (e) {
      // print(e);
      return true;
    }
  }

  
  Future<bool> initApp() async {
    try {
      bool didLoad = await loadedInitData();

      print("didLoad : " + didLoad.toString());
      final newState = Selections(
        bible: "t_kjv",
        book: 1,
        chapter: 1,
        abbreviation:"KJV",
        language:"english",
        version:"King James Version",
        books: bookList,
      );
      
      final db = await getDatabase();
      final data = await db.query('bible_version_key');

      final bibleVersionKeyList = data
      .map(
        (row) => BibleVersionKey(
          id: row['id'] as int,
          table: row['root_table'] as String,
          abbreviation: row['abbreviation'] as String,
          language: row['language'] as String,
          version: row['version'] as String,
          infoText: row['info_text'] as String,
          infoUrl: row['info_url'] as String,
          publisher: row['publisher'] as String,
          copyright: row['copyright'] as String,
          copyrightInfo: row['copyright_info'] as String,
          isDefault: row['is_default'] as bool,
        ),
      )
      .toList();

      if (bibleVersionKeyList.isEmpty) {
        final didInit = await loadedInitData();
        return true;
      }
      else
      {
        final defaultState = bibleVersionKeyList.firstWhere((x) => x.isDefault == true);
        if (defaultState != null) {
          state = Selections(
            bible: defaultState.table,
            book: 1,
            chapter: 1,
            abbreviation: defaultState.abbreviation,
            language: defaultState.language,
            version: defaultState.version,
            books: bookList,
          );
          return true;
        }
      }
      
      state = newState;      
      return true;

    } catch (e) {
      // print(e);
      return false;
    }
  }
  

  Future<List<Verse>?> getChapter() async {

  final db = await getDatabase();
  final data = await db.query(state.bible);

  final verseList = data
  .map(
    (row) => Verse(
      id: row['id'] as int,
      book: row['b'] as int,
      chapter: row['c'] as int,
      verse: row['v'] as int,
      text: row['t'] as String,
    ),
  )
  .toList();
  print(verseList);

    return verseList;
  }
}
