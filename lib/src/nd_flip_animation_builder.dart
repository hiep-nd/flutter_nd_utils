//
//  nd_flip_animation_builder.dart
//  nd_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'dart:math';

import 'package:flutter/widgets.dart';

class NDFlipAnimationBuilder extends StatelessWidget {
  final Duration duration;
  final bool isFront;
  final Widget Function(BuildContext context, bool isFront) builder;

  const NDFlipAnimationBuilder({
    Key? key,
    this.isFront = true,
    this.duration = const Duration(seconds: 1),
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: isFront ? 0 : pi),
      duration: duration,
      builder: (BuildContext context, double val, __) {
        final isFront = val >= (pi / 2);
        //here we will change the isBack val so we can change the content of the card
        return Transform(
          //let's make the card flip by it's center
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(val),
          child: isFront
              ? Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(pi), // it will flip horizontally the container
                  child: builder(context, isFront),
                )
              : builder(context, isFront), //else we will display it here,
        );
      },
    );
  }
}
