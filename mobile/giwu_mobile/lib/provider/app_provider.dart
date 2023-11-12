import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:giwu_mobile/functions/database_helper.dart';
import 'package:giwu_mobile/models/BibleVersionKey.dart';
import 'package:giwu_mobile/models/verse.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/models/AppData.dart';
import 'package:giwu_mobile/models/appError.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';

final List<KeyEnglish> bookList = [
  KeyEnglish(
    id: 1,
    name: "Genesis",
    chapter_count: 50,
  ),
  KeyEnglish(
    id: 2,
    name: "Exodus",
    chapter_count: 40,
  ),
  KeyEnglish(
    id: 3,
    name: "Leviticus",
    chapter_count: 27,
  ),
  KeyEnglish(
    id: 4,
    name: "Numbers",
    chapter_count: 36,
  ),
  KeyEnglish(
    id: 5,
    name: "Deuteronomy",
    chapter_count: 34,
  ),
  KeyEnglish(
    id: 6,
    name: "Joshua",
    chapter_count: 24,
  ),
  KeyEnglish(
    id: 7,
    name: "Judges",
    chapter_count: 21,
  ),
  KeyEnglish(
    id: 8,
    name: "Ruth",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 9,
    name: "1 Samuel",
    chapter_count: 31,
  ),
  KeyEnglish(
    id: 10,
    name: "2 Samuel",
    chapter_count: 24,
  ),
  KeyEnglish(
    id: 11,
    name: "1 Kings",
    chapter_count: 22,
  ),
  KeyEnglish(
    id: 12,
    name: "2 Kings",
    chapter_count: 25,
  ),
  KeyEnglish(
    id: 13,
    name: "1 Chronicles",
    chapter_count: 29,
  ),
  KeyEnglish(
    id: 14,
    name: "2 Chronicles",
    chapter_count: 36,
  ),
  KeyEnglish(
    id: 15,
    name: "Ezra",
    chapter_count: 10,
  ),
  KeyEnglish(
    id: 16,
    name: "Nehemiah",
    chapter_count: 13,
  ),
  KeyEnglish(
    id: 17,
    name: "Esther",
    chapter_count: 10,
  ),
  KeyEnglish(
    id: 18,
    name: "Job",
    chapter_count: 42,
  ),
  KeyEnglish(
    id: 19,
    name: "Psalms",
    chapter_count: 150,
  ),
  KeyEnglish(
    id: 20,
    name: "Proverbs",
    chapter_count: 31,
  ),
  KeyEnglish(
    id: 21,
    name: "Ecclesiastes",
    chapter_count: 12,
  ),
  KeyEnglish(
    id: 22,
    name: "Song of Solomon",
    chapter_count: 8,
  ),
  KeyEnglish(
    id: 23,
    name: "Isaiah",
    chapter_count: 66,
  ),
  KeyEnglish(
    id: 24,
    name: "Jeremiah",
    chapter_count: 52,
  ),
  KeyEnglish(
    id: 25,
    name: "Lamentations",
    chapter_count: 5,
  ),
  KeyEnglish(
    id: 26,
    name: "Ezekiel",
    chapter_count: 48,
  ),
  KeyEnglish(
    id: 27,
    name: "Daniel",
    chapter_count: 12,
  ),
  KeyEnglish(
    id: 28,
    name: "Hosea",
    chapter_count: 14,
  ),
  KeyEnglish(
    id: 29,
    name: "Joel",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 30,
    name: "Amos",
    chapter_count: 9,
  ),
  KeyEnglish(
    id: 31,
    name: "Obadiah",
    chapter_count: 1,
  ),
  KeyEnglish(
    id: 32,
    name: "Jonah",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 33,
    name: "Micah",
    chapter_count: 7,
  ),
  KeyEnglish(
    id: 34,
    name: "Nahum",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 35,
    name: "Habakkuk",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 36,
    name: "Zephaniah",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 37,
    name: "Haggai",
    chapter_count: 2,
  ),
  KeyEnglish(
    id: 38,
    name: "Zechariah",
    chapter_count: 14,
  ),
  KeyEnglish(
    id: 39,
    name: "Malachi",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 40,
    name: "Matthew",
    chapter_count: 28,
  ),
  KeyEnglish(
    id: 41,
    name: "Mark",
    chapter_count: 16,
  ),
  KeyEnglish(
    id: 42,
    name: "Luke",
    chapter_count: 24,
  ),
  KeyEnglish(
    id: 43,
    name: "John",
    chapter_count: 21,
  ),
  KeyEnglish(
    id: 44,
    name: "Acts",
    chapter_count: 28,
  ),
  KeyEnglish(
    id: 45,
    name: "Romans",
    chapter_count: 16,
  ),
  KeyEnglish(
    id: 46,
    name: "1 Corinthians",
    chapter_count: 16,
  ),
  KeyEnglish(
    id: 47,
    name: "2 Corinthians",
    chapter_count: 13,
  ),
  KeyEnglish(
    id: 48,
    name: "Galatians",
    chapter_count: 6,
  ),
  KeyEnglish(
    id: 49,
    name: "Ephesians",
    chapter_count: 6,
  ),
  KeyEnglish(
    id: 50,
    name: "Philippians",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 51,
    name: "Colossians",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 52,
    name: "1 Thessalonians",
    chapter_count: 5,
  ),
  KeyEnglish(
    id: 53,
    name: "2 Thessalonians",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 54,
    name: "1 Timothy",
    chapter_count: 6,
  ),
  KeyEnglish(
    id: 55,
    name: "2 Timothy",
    chapter_count: 4,
  ),
  KeyEnglish(
    id: 56,
    name: "Titus",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 57,
    name: "Philemon",
    chapter_count: 1,
  ),
  KeyEnglish(
    id: 58,
    name: "Hebrews",
    chapter_count: 13,
  ),
  KeyEnglish(
    id: 59,
    name: "James",
    chapter_count: 5,
  ),
  KeyEnglish(
    id: 60,
    name: "1 Peter",
    chapter_count: 5,
  ),
  KeyEnglish(
    id: 61,
    name: "2 Peter",
    chapter_count: 3,
  ),
  KeyEnglish(
    id: 62,
    name: "1 John",
    chapter_count: 5,
  ),
  KeyEnglish(
    id: 63,
    name: "2 John",
    chapter_count: 1,
  ),
  KeyEnglish(
    id: 64,
    name: "3 John",
    chapter_count: 1,
  ),
  KeyEnglish(
    id: 65,
    name: "Jude",
    chapter_count: 1,
  ),
  KeyEnglish(
    id: 66,
    name: "Revelation",
    chapter_count: 22,
  ),
];

final appDataProvider =
    StateNotifierProvider<AppDataNotificatifier, AppData>((ref) {
  return AppDataNotificatifier();
});

class AppDataNotificatifier extends StateNotifier<AppData> {
  AppDataNotificatifier()
      : super(AppData(
          appError: null,
          host: "",
          bible: "t_kjv",
          book: 1,
          chapter: 1,
          abbreviation: "KJV",
          language: "english",
          version: "King James Version",
          books: bookList,
        ));

  void showAppError(AppError newError) {
    state.appError = newError;
  }

  List<KeyEnglish> getallBooks() {
    return state.books;
  }

  void selectBible(BibleVersionKey bible) {
    state.bible = bible.table;
    state.abbreviation = bible.abbreviation;
    state.language = bible.language;
    state.version = bible.version;
  }

  void selectBook(int book) {
    state.book = book;
  }

  void selectChapter(int chapter) {
    state.chapter = chapter;
  }

  String getBibleName() {
    var bibleIndex = state.books.indexWhere((x) => x.id == state.book);
    var bibleName = state.books[bibleIndex].name;
    return bibleName;
  }

  String getBibleSlug() {
    var bibleIndex = state.books.indexWhere((x) => x.id == state.book);

    var bibleSlug = state.books[bibleIndex].name;
    return bibleSlug;
  }

  String getBook(List<KeyEnglish> bookList) {
    var bookIndex = bookList.indexWhere((x) => x.id == state.book);
    var bookName = bookList[bookIndex].name;
    return bookName;
  }

  Future<List<Verse>> getVerses() async {
    final bibleDataBaseHelper = BibleDataBaseHelper();
    await bibleDataBaseHelper.init();
    List<Verse> verses = await bibleDataBaseHelper.getChapter(state.bible,state.book,state.chapter);
    if(verses != null && verses.isNotEmpty){
      return verses;
    }
    return [];
  }

  Future<List<BibleVersionKey>> getBibles() async {
    final bibleDataBaseHelper = BibleDataBaseHelper();
    await bibleDataBaseHelper.init();
    List<BibleVersionKey> bibles = await bibleDataBaseHelper.getAllBibles();
    if(bibles != null && bibles.isNotEmpty){
      return bibles;
    }
    return [];
  }
}
