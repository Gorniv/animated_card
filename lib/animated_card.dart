library animated_card;

import 'package:flutter/material.dart';

import 'animated_card_mixin.dart';
import 'animated_card_direction.dart';

export 'animated_card_direction.dart';
export 'animated_card_mixin.dart';

class AnimatedCard extends StatefulWidget {
  final bool keepAlive;
  final Widget child;

  final AnimatedCardDirection direction;
  final Duration duration;
  final Duration initDelay;
  final Offset initOffset;
  final Curve curve;

  AnimatedCard({
    Key key,
    @required this.child,
    this.direction = AnimatedCardDirection.right,
    this.duration,
    this.initDelay,
    this.initOffset,
    this.keepAlive = false,
    this.curve = Curves.ease,
  })  : assert(child != null),
        super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with TickerProviderStateMixin, AnimatedCardMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  Duration get initDelay => widget.initDelay ?? Duration(milliseconds: 200);

  @override
  Duration get duration => widget.duration ?? Duration(milliseconds: 600);

  @override
  AnimatedCardDirection get direction => widget.direction;

  @override
  Curve get curve => widget.curve;

  @override
  Offset get initOffset => widget.initOffset;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: initAnimation,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: initAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
