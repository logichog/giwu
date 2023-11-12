import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/provider/app_provider.dart';
import 'package:giwu_mobile/screens/verse_screen.dart';

class ChaperScreen extends ConsumerWidget {
  const ChaperScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionsInfo = ref.read(appDataProvider);

    int bookIndex = selectionsInfo.books.indexWhere((x) => x.id == selectionsInfo.book);
    KeyEnglish selectedBook = selectionsInfo.books[bookIndex];
    
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectionsInfo.abbreviation} - ${selectedBook.name}'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 70),
          children: [
            if(selectedBook.chapter_count != null && selectedBook.chapter_count! > 0)
              for (var i = 0; i < selectedBook.chapter_count!; i++)
                Column(
                  children: [
                    ListTile(
                      leading: Text((1 + i).toString()),
                      title: Text("Chapter " + (1 + i).toString()),
                      onTap: () {
                        ref.read(appDataProvider.notifier).selectChapter(i + 1);
                        
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