import 'package:flutter/material.dart';
import 'package:giwu_mobile/data/book_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:giwu_mobile/screens/chapter_screen.dart';
import 'package:giwu_mobile/widgets/darkmode_button.dart';

class BookScreen extends ConsumerWidget {
  BookScreen({super.key});
  // List<Book> _bookList = [];

  // List<Book> bookList =
  void _selectBook(ctx){
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (context) => const ChaperScreen(),),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bibleName = ref.read(selectionsProvider.notifier).getBibleName();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bible - $bibleName'),
        actions: const [
          DarkModeButton(),
          SizedBox(width: 10,),
          Icon(Icons.menu_book),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ...bookList.map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e.name),
                      trailing: Text(e.chapters.toString()),
                      onTap: () {
                        ref.read(selectionsProvider.notifier).selectBook(e.id);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const ChaperScreen(),),
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
