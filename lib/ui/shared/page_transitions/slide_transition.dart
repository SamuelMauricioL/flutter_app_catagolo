import 'package:flutter/material.dart';

class SlideTransitionOnPage<T> extends Page<T> {
  const SlideTransitionOnPage({
    required this.child,
    this.direction = AxisDirection.left,
  });

  final Widget child;
  final AxisDirection direction;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: const Duration(milliseconds: 320),
      reverseTransitionDuration: const Duration(milliseconds: 320),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: getBeginOffset(),
            end: Offset.zero,
          ).animate(
            animation,
          ),
          child: child,
        );
      },
    );
  }

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
