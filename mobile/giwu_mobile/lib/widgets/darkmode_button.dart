import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:giwu_mobile/provider/selections_provider.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selections = ref.watch(selectionsProvider);
    final bool dark = selections.isDark;
    // print(dark);
    return IconButton(
      onPressed: () {
        ref.read(selectionsProvider.notifier).toggleMode();
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: Tween<double>(
              begin: 0.5,
              end: 1,
            ).animate(animation),
            child: child,
          );
        },
        child: Icon(
          dark ? Icons.dark_mode_outlined : Icons.dark_mode,
          key: ValueKey(dark),
        ),
      ),
    );
  }
}
