import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/models/book.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:giwu_mobile/screens/verse_screen.dart';

class ChaperScreen extends ConsumerWidget {
  const ChaperScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionsInfo = ref.read(selectionsProvider);

    int bookIndex = selectionsInfo.books.indexWhere((x) => x.id == selectionsInfo.book);
    Book selectedBook = selectionsInfo.books[bookIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectionsInfo.abbreviation} - ${selectedBook.name}'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            for (var i = 0; i < selectedBook.chapter_count; i++)
              Column(
                children: [
                  ListTile(
                    leading: Text((1 + i).toString()),
                    title: Text("Chapter " + (1 + i).toString()),
                    onTap: () {
                      ref.read(selectionsProvider.notifier).selectChapter(i);
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => VerseScreen(),),
                      );
                    },
                  ),
                  const Divider(height: 0),
                ],
              ),
          ],
        ),
      ),
    );
  }
}