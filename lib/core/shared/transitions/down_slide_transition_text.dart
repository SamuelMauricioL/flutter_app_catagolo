import 'package:flutter/material.dart';

class DownSlideTransitionText extends StatelessWidget {
  const DownSlideTransitionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Padding(
            padding: EdgeInsets.only(top: value * 15),
            child: child,
          ),
        );
      },
      child: text,
    );
  }
}
