import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/data/bible_list.dart';
import 'package:giwu_mobile/data/book_list.dart';
import 'package:giwu_mobile/models/selections.dart';

final selectionsProvider = StateNotifierProvider<SelectionsNotificatifier, Selections>((ref) {
  return SelectionsNotificatifier();
});

class SelectionsNotificatifier extends StateNotifier<Selections> {
  SelectionsNotificatifier()
      : super(Selections(isDark: false,bible: "004", book: 1, chapter: 1));

  void toggleMode() {
    if (state.isDark) {
      state.isDark = false;
    } else {
      state.isDark = true;
    }
    print(state.isDark);
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

    var bibleIndex = bibleList.indexWhere((x) => x.id == state.bible);

    var bibleName = bibleList[bibleIndex].fullName;
    return bibleName;
  }

  String getBibleSlug() {

    var bibleIndex = bibleList.indexWhere((x) => x.id == state.bible);

    var bibleSlug = bibleList[bibleIndex].slug;
    return bibleSlug;
  }

  String getBook() {

    var bookIndex = bookList.indexWhere((x) => x.id == state.book);

    var bookName = bookList[bookIndex].name;
    return bookName;
  }
}
