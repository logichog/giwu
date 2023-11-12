import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/functions/database_helper.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/provider/app_provider.dart';
import 'package:giwu_mobile/screens/book_selection_screen.dart';

import 'package:giwu_mobile/screens/chapter_screen.dart';
import 'package:giwu_mobile/widgets/darkmode_button.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {
  String _bibleTitle = '';
  
  void _bookSelectionScreen() async {
    final hasChange = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (ctx) => BookSelectionScreen(),
      ),
    );

    if (hasChange != null && hasChange) {
      final selectionsInfo = ref.watch(appDataProvider);
      setState(() {
        _bibleTitle = selectionsInfo.version;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(appDataProvider);
    _bibleTitle = selectionsInfo.version;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bible - ${_bibleTitle}'),
        actions: [
          IconButton(
            onPressed: () {
              _bookSelectionScreen();
            },
            icon: Icon(
              Icons.menu_book,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 70),
          children: [
            ...selectionsInfo.books.map(
              (e) => Column(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
