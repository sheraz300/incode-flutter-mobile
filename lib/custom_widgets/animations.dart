// ignore_for_file: must_be_immutable
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomShowUpAnimation extends StatelessWidget {
  final Widget child;
  const CustomShowUpAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: child,
    );
  }
}

//* list item animation
class CustomListAnimation extends StatelessWidget {
  final Widget child;
  const CustomListAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 200),
      child: FadeInDown(
        duration: const Duration(milliseconds: 450),
        child: FadeInDown(
          duration: const Duration(milliseconds: 600),
          child: FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: child,
          ),
        ),
      ),
    );
  }
}