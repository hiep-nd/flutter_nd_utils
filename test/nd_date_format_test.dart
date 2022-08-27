//
// nd_date_format_test.dart
// nd_utils
//
// Created by Nguyen Duc Hiep on Thu Mar 03 2022.
// Copyright © 2022 Nguyen Duc Hiep. All rights reserved.
//

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nd_utils/nd_utils.dart';

void main() async {
  test('Test NDDateFormatUtils', () async {
    final format = DateFormat('yyyy-MM-dd\'T\'HH:mm:ss');
    expect(
      format.tryParse('2022-11-22T15:11:16'),
      DateTime(2022, 11, 22, 15, 11, 16),
    );
    expect(
      format.tryParse('2022-11-22 15:11:16'),
      null,
    );
  });
}
