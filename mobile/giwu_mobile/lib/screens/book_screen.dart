import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:giwu_mobile/screens/chapter_screen.dart';
import 'package:giwu_mobile/widgets/darkmode_button.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({super.key});

  @override
  BookScreenState createState() => BookScreenState();
}

class BookScreenState extends ConsumerState<BookScreen> {
  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(selectionsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bible - ${selectionsInfo.version}'),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            ...selectionsInfo.books.map((e) => Column(
                  children: [
                    ListTile(
                      title: Text(e.name),
                      trailing: Text(e.chapter_count.toString()),
                      onTap: () {
                        ref.read(selectionsProvider.notifier).selectBook(e.id);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => const ChaperScreen(),
                          ),
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
