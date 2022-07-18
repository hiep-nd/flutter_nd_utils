//
// nd_auto_unfocus.dart
// nd_utils
//
// Created by Nguyen Duc Hiep on Mon Jul 18 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'package:flutter/widgets.dart';

class NDAutoUnfocus extends StatelessWidget {
  final Widget? child;

  const NDAutoUnfocus({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      );
}
