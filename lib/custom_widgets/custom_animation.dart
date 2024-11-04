import 'dart:async';

import 'package:flutter/material.dart';

enum AnimDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

class FadeSlideTransition extends StatelessWidget {
  final Widget child;
  final int delay;
  final AnimDirection animationDirection;
  final Duration duration;

  const FadeSlideTransition({
    super.key,
    required this.child,
    this.delay = 0,
    required this.animationDirection,
    this.duration = Duration.zero,
  });

  @override
  Widget build(BuildContext context) {
    return _Animator(
      time: _getDelay(delay),
      duration: duration,
      animationDirection: animationDirection,
      child: child,
    );
  }
}

Timer? _timer;
Duration _duration = const Duration();

Duration _getDelay(int delay) {
  if (_timer == null || !_timer!.isActive) {
    _timer = Timer(const Duration(microseconds: 120), () {
      _duration = const Duration();
    });
  }
  _duration += Duration(milliseconds: 100 + delay);
  return _duration;
}

class _Animator extends StatefulWidget {
  final Widget child;
  final Duration time;
  final AnimDirection animationDirection;
  final Duration duration;

  const _Animator({
    required this.child,
    required this.time,
    required this.animationDirection,
    required this.duration,
  });

  @override
  State<_Animator> createState() => _AnimatorState();
}

class _AnimatorState extends State<_Animator>
    with SingleTickerProviderStateMixin {
  late Timer timer;
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
      animationBehavior: AnimationBehavior.preserve,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    timer = Timer(widget.time, animationController.forward);
  }

  @override
  void dispose() {
    timer.cancel();
    animationController.dispose();
    super.dispose();
  }

  double distance = 30;

  Offset getOffset() {
    switch (widget.animationDirection) {
      case AnimDirection.leftToRight:
        return Offset(-(1 - animation.value) * distance, 0.0);

      case AnimDirection.rightToLeft:
        return Offset((1 - animation.value) * distance, 0.0);

      case AnimDirection.topToBottom:
        return Offset(0.0, -(1 - animation.value) * distance);

      case AnimDirection.bottomToTop:
        return Offset(0.0, (1 - animation.value) * distance);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: getOffset(),
            child: child,
          ),
        );
      },
    );
  }
}