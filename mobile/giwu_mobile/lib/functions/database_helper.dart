import 'package:flutter/services.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/models/verse.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class BibleDataBaseHelper {
  late Database _db;

  Future<void> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathEnglish =
        path.join(applicationDirectory.path, "bible-sqlite.db");

    bool dbExistsEnglish = await io.File(dbPathEnglish).exists();

    if (!dbExistsEnglish) {
      // Copy from asset
      ByteData data = await rootBundle
          .load(path.join("assets", "database", "bible-sqlite.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(dbPathEnglish).writeAsBytes(bytes, flush: true);
    }

    this._db = await openDatabase(dbPathEnglish);
  }

  /// get all the books from english Bible
  Future<List<KeyEnglish>> getAllTheBookFromTheBoble() async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    final data = await _db.query('key_english');
    final dbbooks = data
        .map(
          (row) => KeyEnglish(
            id: row['b'] as int,
            name: row['n'] as String,
            testament: row['t'] != null ? row['t'] as String : "",
            genreId: row['g'] != null ? row['g'] as int : 0,
          ),
        )
        .toList();

    return dbbooks;
  }

  /// get all the books from english Bible
  Future<List<KeyEnglish>> getAllBibles() async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    final data = await _db.query('key_english');
    final dbbooks = data
        .map(
          (row) => KeyEnglish(
            id: row['b'] as int,
            name: row['n'] as String,
            testament: row['t'] != null ? row['t'] as String : "",
            genreId: row['g'] != null ? row['g'] as int : 0,
          ),
        )
        .toList();

    return dbbooks;
  }

  /// get verses from chapter
  // Future<List<Verse>> getChapter(String bible, int book, int chapter) async {
  //   if (_db == null) {
  //     throw "bd is not initiated, initiate using [init(db)] function";
  //   }

  //   final data = await _db.query(bible);

  //   final dbbooks = data.map(
  //         (row) => Verse(
  //           id: row['id'] as int,
  //           book: row['b'] as int,
  //           chapter: row['c'] as int,
  //           verse: row['v'] as int,
  //           text: row['t'] != null ? row['t'] as String : "",
  //         ),
  //       )
  //       .toList();

  //   return dbbooks;
  // }

  Future<List<Verse>> getChapter(String bible, int book, int chapter) async {
    if (_db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    List<Map> maps = await _db.query(bible,
        columns: [
          'id',
          'b',
          'c',
          'v',
          't',
        ],
        where: 'b = ? and c = ?',
        whereArgs: [book, chapter]);

    // print({bible, book, chapter});
    // print(maps);

    if (maps.length > 0) {
      return maps
          .map(
            (row) => Verse(
              id: row['id'] as int,
              book: row['b'] as int,
              chapter: row['c'] as int,
              verse: row['v'] as int,
              text: row['t'] != null ? row['t'] as String : "",
            ),
          )
          .toList();
    }
    return [];
  }
}
