import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/models/chapter.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:giwu_mobile/screens/verse_screen.dart';

class ChaperScreen extends ConsumerWidget {
  const ChaperScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Chapter> _chapterList = [];

    for (var i = 0; i < 50; i++) {
      _chapterList.add(Chapter(chapter: i + 1,name: "Chapter " + (i + 1).toString()));
    }

    final bibleSlug = ref.read(selectionsProvider.notifier).getBibleSlug();
    final bookName = ref.read(selectionsProvider.notifier).getBook();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('$bibleSlug - ${bookName}'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ..._chapterList.map((e) => Column(
                  children: [
                    ListTile(
                      leading: Text(e.chapter.toString()),
                      title: Text(e.name),
                      onTap: () {
                        ref.read(selectionsProvider.notifier).selectChapter(e.chapter);
                        
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