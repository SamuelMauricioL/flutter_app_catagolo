import 'package:flutter/material.dart';

class SlideTransitionOnPage<T> extends Page<T> {
  const SlideTransitionOnPage({required this.child});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(
            animation,
          ),
          child: child,
        );
      },
    );
  }
}
