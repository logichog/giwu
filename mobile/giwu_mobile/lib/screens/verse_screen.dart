import 'dart:async';

import 'package:giwu_mobile/data/defaultBibleData.dart';
import 'package:giwu_mobile/models/KeyEnglish.dart';
import 'package:giwu_mobile/models/verse.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:giwu_mobile/provider/app_provider.dart';

class VerseScreen extends ConsumerStatefulWidget {
  const VerseScreen({super.key});
  @override
  ConsumerState<VerseScreen> createState() {
    return _VerseScreenState();
  }
}

class _VerseScreenState extends ConsumerState<VerseScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Verse> _verseList = [];

  void _getVerses() async {
    final newVerseList = await ref.read(appDataProvider.notifier).getVerses();
    // print(newVerseList);
    
    setState(() {
      _verseList = newVerseList;
    });
  }

  @override
  void initState() {
    super.initState();
    _getVerses();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _verseList = [];
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final selectionsInfo = ref.watch(appDataProvider);

    int bookIndex =
        selectionsInfo.books.indexWhere((x) => x.id == selectionsInfo.book);

    KeyEnglish selectedBook = selectionsInfo.books[bookIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${selectionsInfo.abbreviation} - ${selectedBook.name} - ${selectionsInfo.chapter}'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 70),
          children: [
            ..._verseList.map(
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
        builder: (context, child) => SlideTransition(
          // position: _animationController.drive(
          //   Tween(
          //     begin: const Offset(0, 0.3),
          //     end: const Offset(0, 0),
          //   ),
          // ),
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}