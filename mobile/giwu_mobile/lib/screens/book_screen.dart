import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/functions/database_helper.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/provider/app_provider.dart';

import 'package:giwu_mobile/screens/chapter_screen.dart';
import 'package:giwu_mobile/widgets/darkmode_button.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {

  _initBooks() async{
    // bookList = await ref.read(appDataProvider.notifier).getallBooks();
    final bibleDataBaseHelper = await BibleDataBaseHelper();
    await bibleDataBaseHelper.init();
    // bookList = await bibleDataBaseHelper.getAllTheBookFromTheBoble();
  }

  @override
  Widget build(BuildContext context) {
    
    final selectionsInfo = ref.watch(appDataProvider);
    if (selectionsInfo.books.isEmpty) {
      _initBooks();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Bible - ${selectionsInfo.version}'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 70),
          children: [
            ...selectionsInfo.books.map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e.name),
                      trailing: Text(e.chapter_count.toString()),
                      onTap: () {
                        ref.read(appDataProvider.notifier).selectBook(e.id);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const ChaperScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(height: 0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
