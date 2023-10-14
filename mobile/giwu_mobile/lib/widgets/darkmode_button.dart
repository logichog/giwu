import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool dark = false;
    return IconButton(
      onPressed: () {
        // Todo : set dark mode
        dark = !dark;
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
          Icons.dark_mode,
          key: ValueKey(dark),
        ),
      ),
    );
  }
}
