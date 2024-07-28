import 'dart:io';
import 'package:app_dinamica/services/send_message.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenPDF {
  static Future<File> savePDF({
    required String name,
    required Document pdf,
    String? path,
  }) async {
    try {
      final root = await getApplicationDocumentsDirectory();
      final String pathUser = root.parent.parent.path;
      await sendMessage('func savePDF() -> $pathUser | try');
      final file = File('$pathUser\\${path ?? ""}\\Downloads\\$name');
      await file.writeAsBytes(await pdf.save());
      return file;
    } catch (err) {
      await sendMessage('func savePDF() -> $err | catch');
      throw err.toString();
    }
  }

  static Future<String?> openPDF(File file) async {
    try {
      final path = file.path;
      await OpenFile.open(path);
      await sendMessage('func openPDF() -> $path | try');
      return null;
    } catch (err) {
      await sendMessage('func openPDF() -> $err | catch');
      return err.toString();
    }
  }
}
