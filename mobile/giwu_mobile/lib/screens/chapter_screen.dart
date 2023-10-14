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
            ...selectionsInfo.books.map((e) => Column(
                  children: [
                    ListTile(
                      leading: Text(e.id.toString()),
                      title: Text("Chapter "+ e.id.toString()),
                      onTap: () {
                        ref.read(selectionsProvider.notifier).selectChapter(e.id);
                        
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => VerseScreen(),),
                        );
                      },
                    ),
                    Divider(height: 0),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}