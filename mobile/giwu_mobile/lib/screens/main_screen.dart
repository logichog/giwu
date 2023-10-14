import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/functions/db_helper.dart';
import 'package:giwu_mobile/models/appError.dart';
import 'package:giwu_mobile/provider/app_provider.dart';

import 'package:giwu_mobile/provider/selections_provider.dart';
import 'package:giwu_mobile/screens/book_screen.dart';
import 'package:giwu_mobile/screens/chapter_screen.dart';
import 'package:giwu_mobile/widgets/darkmode_button.dart';

// DBHelper db = new DBHelper();
// await db.initDatabase();

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    print("init");
    _getBible();
  }

  void _getBible() async {
    print("start");
    final initAppResults =
        await ref.read(selectionsProvider.notifier).initApp();
    print('initAppResults = $initAppResults');
    final fetchBibleResults = initAppResults
        ? true
        : await ref.read(selectionsProvider.notifier).fetchBible();
    if (fetchBibleResults) {
      setState(() {
        loading = false;
      });
    } else {
      ref.read(appDataProvider.notifier).showAppError(AppError(
            errorTitle: "App Error",
            errorSubtitle: "",
            errorMessage: "Bible can not be Loaded"
          ));
      print("App Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(selectionsProvider);

    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "No bible found",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Please wait!",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
    if (loading) {
      content = const BookScreen();
    }

    return MaterialApp(
      title: 'Giwu Bible App',
      theme: ThemeData(useMaterial3: true),
      home: content,
    );
  }
}
