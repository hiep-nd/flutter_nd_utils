//
//  nd_state_utils.dart
//  nd_utils
//
//  Created by Nguyen Duc Hiep on 01/12/2021.
//

import 'package:flutter/widgets.dart';

extension NDStateUtils<T extends StatefulWidget> on State<T> {
  @protected
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(() {
        fn();
      });
    } else {
      fn();
    }
  }

  @protected
  void ndSafeSetState(VoidCallback fn) => safeSetState(fn);
}
