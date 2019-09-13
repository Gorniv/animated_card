import 'dart:async';

import 'package:flutter/material.dart';
import 'animated_card_direction.dart';

mixin AnimatedCardMixin<T extends StatefulWidget> on State<T>, TickerProviderStateMixin<T> {
  AnimationController controller;
  Animation<Offset> initAnimation;

  Curve curve;

  Timer initTimer;
  final futures = <StreamSubscription>[];

  Duration get initDelay;
  Duration get duration;
  AnimatedCardDirection get direction;
  Offset get initOffset;

  @override
  void initState() {
    super.initState();

    //controllers
    controller = AnimationController(
      vsync: this,
      duration: duration,
      value: 0,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    configureInitialOffset(context);

    //curves
    CurvedAnimation initialCurve() {
      return CurvedAnimation(
        curve: curve,
        parent: controller,
      );
    }

    //animations
    initAnimation = Tween<Offset>(
      begin: initOffset ?? initialOffset[direction],
      end: Offset.zero,
    ).animate(initialCurve());

    initTimer = Timer(initDelay, () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    initTimer.cancel();
    futures.forEach((f) => f.cancel());
    controller.dispose();
    super.dispose();
  }
}
