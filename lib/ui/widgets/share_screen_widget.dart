import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareScreenshot(Uint8List imageBytes) async {
  // Vaqtinchalik fayl yo'lini olish
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/screenshot.png';

  // Faylni saqlash
  final file = File(filePath);
  await file.writeAsBytes(imageBytes);

  final xfile = XFile(filePath);

  // Share qilish
  await Share.shareXFiles(
    [xfile],
    text: 'Here is a screenshot from my app!',
  );
}
