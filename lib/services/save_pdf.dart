import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenPDF {
  static Future<File> savePDF({
    required String name,
    required Document pdf,
  }) async {
    try {
      final root = await getApplicationDocumentsDirectory();
      final String pathUser = root.parent.parent.path;
      final file = File('$pathUser/$name');
      await file.writeAsBytes(await pdf.save());
      return file;
    } catch (err) {
      throw err.toString();
    }
  }

  static Future<String?> openPDF(File file) async {
    try {
      final path = file.path;
      await OpenFile.open(path);
      return null;
    } catch (err) {
      return err.toString();
    }
  }
}
