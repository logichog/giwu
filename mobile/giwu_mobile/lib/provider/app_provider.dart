import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/models/AppData.dart';
import 'package:giwu_mobile/models/appError.dart';


final appDataProvider = StateNotifierProvider<AppDataNotificatifier, AppData>((ref) {
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

        abbreviation:"KJV",
        language:"english",
        version:"King James Version",
        books: [],
      ));

  void showAppError(AppError newError) {
    state.appError = newError;
  }

  Future<bool> initApp() async {
    try {
      // Get list of host
      // final response = await http.get(Uri.parse('https://10.0.2.2:5066/bible/getkjv'));
      // add data to thhe 

      /*
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          final bibleInfo = Bible.fromJson(jsonDecode(response.body));
          
          print("success");
          
          final newState = state;
          newState.abbreviation = bibleInfo.abbreviation;
          newState.language = bibleInfo.language;
          newState.version = bibleInfo.version;
          newState.books = bibleInfo.books;

          state = newState;
          
          return true;
        } else {
          print("fails");
          print(response.statusCode);
          // If the server did not return a 200 OK response,
          // then throw an exception.
          // throw Exception('Failed to load Bible');
          return false;
        }
      */
      
      /*
        final db = await _getDatabase();
        final data = await db.query('user_places');
        final bibleVersionKeyList = data
        .map(
          (row) => BibleVersionKey(
            id: row['id'] as int,
            table: row['table'] as String,
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
          db.insert('bible_version_key', {
            'id' : "004",
            'table' : "t_kjv",
            'abbreviation' : "KJV",
            'language' : "english",
            'version' : "King James Version",
            'info_text' : "",
            'info_url' : "http://en.wikipedia.org/wiki/King_James_Version",
            'publisher' : "",
            'copyright' : "Public Domain",
            'copyright_info' : "",
            'is_default' : "true",
          });
        }
      */
      return true;
    } catch (e) {
      return false;
    }
  }
  
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

    // var bibleIndex = bibleList.indexWhere((x) => x.table == state.bible);

    // var bibleName = bibleList[bibleIndex].version;
    // return bibleName;
    return "bible";
  }

  String getBibleSlug() {

    // var bibleIndex = bibleList.indexWhere((x) => x.table == state.bible);

    // var bibleSlug = bibleList[bibleIndex].table;
    // return bibleSlug;
    return "bible";
  }

  String getBook(List<Book> bookList) {

    var bookIndex = bookList.indexWhere((x) => x.id == state.book);

    var bookName = bookList[bookIndex].name;
    return bookName;
  }
}
