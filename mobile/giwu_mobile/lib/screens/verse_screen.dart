import 'package:giwu_mobile/data/defaultBibleData.dart';
import 'package:giwu_mobile/models/verse.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/models/book.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';

class VerseScreen extends ConsumerStatefulWidget {
  const VerseScreen({super.key});
  @override
  ConsumerState<VerseScreen> createState() {
    return _VerseScreenState();
  }
}

class _VerseScreenState extends ConsumerState<VerseScreen> {

  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(selectionsProvider);

    int bookIndex =
        selectionsInfo.books.indexWhere((x) => x.id == selectionsInfo.book);
    Book selectedBook = selectionsInfo.books[bookIndex];
    List<Verse> verseList = verses
        .where((x) =>
            x.book == selectionsInfo.book &&
            x.chapter == selectionsInfo.chapter)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${selectionsInfo.abbreviation} - ${selectedBook.name} - ${selectionsInfo.chapter}'),
      ),
      body: ListView(
        children: [
          ...verseList.map(
              (e) => Column(
                children: [
                  ListTile(
                    leading: Text(e.verse.toString()),
                    title: Text(e.text),
                  ),
                  const Divider(height: 0),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
