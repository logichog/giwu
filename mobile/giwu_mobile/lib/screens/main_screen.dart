import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/screens/book_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {

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
