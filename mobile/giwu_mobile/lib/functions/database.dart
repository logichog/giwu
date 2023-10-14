import 'package:giwu_mobile/data/defaultBibleData.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'giwu_data_6.db'),
    onCreate: (db, version) {
      String sqlQuery = 'CREATE TABLE key_english(b INTEGER PRIMARY KEY, n TEXT, t TEXT, g INTEGER)';
      // String sqlQuery = 'CREATE TABLE bible_version_key(id INTEGER PRIMARY KEY, table TEXT, abbreviation TEXT, language TEXT, version TEXT, info_text TEXT, info_url TEXT, publisher TEXT, copyright TEXT, copyright_info TEXT, is_default BOOLEAN)';
      // sqlQuery = '$sqlQuery; CREATE TABLE key_english(b INTEGER PRIMARY KEY, n TEXT, t TEXT, g INTEGER)';
      sqlQuery = '$sqlQuery; CREATE TABLE key_genre_english(g INTEGER PRIMARY KEY,n TEXT)';
      sqlQuery = '$sqlQuery; CREATE TABLE t_kjv(id INTEGER PRIMARY KEY,b INTEGER, c INTEGER, v INTEGER, t TEXT)';
      sqlQuery = '$sqlQuery; CREATE TABLE bible_version_key(id INTEGER PRIMARY KEY, table_name TEXT, abbreviation TEXT, language TEXT, version TEXT, info_text TEXT, info_url TEXT, publisher TEXT, copyright TEXT, copyright_info TEXT, is_default INTEGER)';
      print("new db");
      
      return db.execute(sqlQuery);
    },
    version: 2,
  );

  print("db");
  print(db);
  return db;
}

Future<int?> getTableCount(String table) async {
    final db = await getDatabase();
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
}

Future<bool> loadedInitData() async {
  
  bool success = false;

  try {
    final db = await getDatabase();

    // final bibleVersionKeyCount = await getTableCount('bible_version_key');
    // if (bibleVersionKeyCount == null || bibleVersionKeyCount > 0) {
    //   for (var item in bibleVerseKey) {
    //     await db.insert('bible_version_key', {
    //       'id' : item.id,
    //       'roottable' : item.table,
    //       'abbreviation' : item.abbreviation,
    //       'language' : item.language,
    //       'version' : item.version,
    //       'infotext' : item.infoText,
    //       'infourl' : item.infoUrl,
    //       'publisher' : item.publisher,
    //       'copyright' : item.copyright,
    //       'copyrightinfo' : item.copyrightInfo,
    //       'isdefault' : item.id == 4,
    //     });
    //   }
    //   print('no bible_version_key');
    // }

    
    final keyEnglishCount = await getTableCount('key_english');
    if (keyEnglishCount == null || keyEnglishCount > 0) {
      for (var item in keyEnglish) {
        await db.insert('key_english', {
          'b' : item.id,
          'n' : item.name,
          't' : item.testament,
          'g' : item.genreId,
        });
      }
      print('no key_english');
    }

    // final keyGenreEnglishCount = await getTableCount('key_genre_english');
    // if (keyGenreEnglishCount == null || keyGenreEnglishCount > 0) {
    //   for (var item in keyGenreEnglish) {
    //     await db.insert('key_genre_english', {
    //       'g' : item.genreId,
    //       'n' : item.genreName,
    //     });
    //   }
    //   print('no key_genre_english');
    // }

    final tKjvCount = await getTableCount('t_kjv');
    if (tKjvCount == null || tKjvCount > 0) {
      for (var item in verses) {
        await db.insert('t_kjv', {
          'id' : item.id,
          'b' : item.book,
          'c' : item.chapter,
          'v' : item.verse,
          't' : item.text,
        });
      }
      print('no t_kjv');
    }

    success = true;
  } catch (e) {
    print("e:103");
    print(e);
    success = false;
  }

  return success;
}