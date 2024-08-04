import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid) {
      final isGranted = await Permission.manageExternalStorage.isGranted;
      if (!isGranted) {
        await Permission.manageExternalStorage.request();
      }
      return isGranted;
    }

    final isGranred = await Permission.storage.isGranted;
    if (!isGranred) {
      await Permission.storage.request();
    }
    return isGranred;
  }
}
