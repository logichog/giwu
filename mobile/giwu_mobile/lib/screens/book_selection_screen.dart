import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/models/BibleVersionKey.dart';
import 'package:giwu_mobile/models/bible.dart';
import 'package:giwu_mobile/provider/app_provider.dart';

class BookSelectionScreen extends ConsumerStatefulWidget {
  const BookSelectionScreen({super.key});

  @override
  BookSelectionScreenState createState() => BookSelectionScreenState();
}

class BookSelectionScreenState extends ConsumerState<BookSelectionScreen> {
  List<BibleVersionKey> bibleVersionList = [];

  @override
  void initState() {
    super.initState();
    _getBibleData();
  }

  void _getBibleData() async {
    final newBibleVersionList =
        await ref.read(appDataProvider.notifier).getBibles();

    if (newBibleVersionList.length > 0) {
      setState(() {
        bibleVersionList = newBibleVersionList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Bible'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(22),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final bibleVersion in bibleVersionList)
            InkWell(
              onTap: () {
                ref.read(appDataProvider.notifier).selectBible(bibleVersion);
                // Navigator.pop(context);
                Navigator.of(context).pop(true);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [Colors.grey.shade200, Colors.grey.shade300],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Text(
                  bibleVersion.version,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
