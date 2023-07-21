import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/models/verse.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
const uuid = Uuid();

class VerseScreen extends ConsumerWidget {
  VerseScreen({super.key});
  List<Verse> _chapterList = [];
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selections = ref.watch(selectionsProvider);

    for (var i = 0; i < 50; i++) {
      _chapterList.add(Verse(verse: i + 1,book: 1,chapter: 1,text: uuid.v4()));
    }

    final bibleSlug = ref.read(selectionsProvider.notifier).getBibleSlug();
    final bookName = ref.read(selectionsProvider.notifier).getBook();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${bibleSlug.toUpperCase()} - $bookName - ${selections.chapter}'),
        actions: const [
          Icon(Icons.menu_book),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ..._chapterList.map((e) => Column(
                  children: [
                    ListTile(
                      leading: Text(e.verse.toString()),
                      title: Text(e.text),
                    ),
                    const Divider(height: 0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
