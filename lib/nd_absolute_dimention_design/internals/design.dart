// Privates
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:nd_utils/nd_absolute_dimention_design/internals/ppis.dart';

double defaultPpi = 96;

const platform = MethodChannel('vn.neodata. ');

Future<void> initializeDefaultPpi() async {
  if (Platform.isIOS) {
    final deviceInfo = DeviceInfoPlugin();
    final info = await deviceInfo.iosInfo;

    // device
    final machine = info.isPhysicalDevice
        ? info.utsname.machine
        : cast<Map>(await platform.invokeMethod('getEnvironment'))
            ?.getAs<String>('SIMULATOR_MODEL_IDENTIFIER');
    for (var ppi in ppis) {
      if ('${ppi.device}${ppi.version.item1},${ppi.version.item2}' == machine) {
        defaultPpi = ppi.ppi;
        return;
      }
    }

    defaultPpi = 160;
  }

  if (Platform.isAndroid) {
    defaultPpi = 160;
  }

  defaultPpi = 96;
}
