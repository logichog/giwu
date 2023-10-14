import 'dart:io';
import 'package:giwu_mobile/data/defaultBibleData.dart';
import 'package:giwu_mobile/models/verse.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/models/book.dart';
import 'package:giwu_mobile/models/chapter.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';

// const uuid = Uuid();

// class VerseScreen extends ConsumerWidget {
//   VerseScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectionsInfo = ref.watch(selectionsProvider);
//     final verseList = ref.read(selectionsProvider.notifier).getChapter();

//     // List<Verse> verseList = verseData ?? [];

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(12),
//         child:
//       ),
//     );
//   }
// }

class VerseScreen extends ConsumerStatefulWidget {
  const VerseScreen({super.key});
  @override
  ConsumerState<VerseScreen> createState() {
    return _VerseScreenState();
  }
}

class _VerseScreenState extends ConsumerState<VerseScreen> {
  // late Future<List<Verse>?> _verseList;

  @override
  void initState() {
    super.initState();
    // _verseList = ref.read(selectionsProvider.notifier).getChapter();
  }

  // void getChapter() async {
  //   final newVerseList = await ref.read(selectionsProvider.notifier).getChapter();
  //   if (newVerseList != null) {
  //     _verseList = ref.read(selectionsProvider.notifier).getChapter();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(selectionsProvider);
    // final verseList = ref.read(selectionsProvider.notifier).getChapter();

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
        actions: const [
          Icon(Icons.menu_book),
          SizedBox(
            width: 10,
          ),
        ],
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

      // body: FutureBuilder(
      //   future: _verseList,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.connectionState == ConnectionState.done) {
      //       // If we got an error
      //       if (snapshot.hasError) {
      //         return Center(
      //           child: Text(
      //             '${snapshot.error} occurred',
      //             style: TextStyle(fontSize: 18),
      //           ),
      //         );

      //         // if we got our data
      //       } else if (snapshot.hasData) {
      //         // Extracting data from snapshot object
      //         final data = snapshot.data as List<Verse>;
      //         return ListView(
      //           children: [
      //             if (data != null && data.isEmpty)
      //               ...data.map(
      //                 (e) => Column(
      //                   children: [
      //                     ListTile(
      //                       leading: Text(e.verse.toString()),
      //                       title: Text(e.text),
      //                     ),
      //                     const Divider(height: 0),
      //                   ],
      //                 ),
      //               ),
      //           ],
      //         );
      //       }
      //     }

      //     return const Column(
      //       children: [
      //         ListTile(
      //           leading: Text("0"),
      //           title:
      //               Text("There are no verses please try to restart the app."),
      //         ),
      //         Divider(height: 0),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
