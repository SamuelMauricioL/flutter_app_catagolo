import 'package:flutter/widgets.dart';

class FadeTransitionOnPage<T> extends Page<T> {
  const FadeTransitionOnPage({required this.child});

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
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
