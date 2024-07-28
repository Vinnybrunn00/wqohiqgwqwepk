import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

String? voidInputs(String? value, String components) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Campo $components não pode estar vazio';
    }
  }
  return null;
}

bool? isRepeated({required String text, required List<String> lista}) {
  bool? valid;
  for (int i = 0; i < lista.length; i++) {
    if (text == lista[i]) return valid = false;
    valid = true;
  }
  return valid;
}

Future<void> openDirectory() async {
  final result = await FilePicker.platform.pickFiles();
  if (result != null) {
    final file = result.files.first;
    await OpenFile.open(file.path);
  }
}

String? param(int index) {
  switch (index) {
    case 0:
      return 'Empresa';
    case 1:
      return 'Período';
    case 2:
      return 'Cargo';
  }
  return null;
}

String? sendMonth(int month) {
  switch (month - 1) {
    case 0:
      return 'janeiro';
    case 1:
      return 'fevereiro';
    case 2:
      return 'março';
    case 3:
      return 'abril';
    case 4:
      return 'maio';
    case 5:
      return 'junho';
    case 6:
      return 'julho';
    case 7:
      return 'agosto';
    case 8:
      return 'setembro';
    case 9:
      return 'outubro';
    case 10:
      return 'novembro';
    case 11:
      return 'dezembros';
  }
  return null;
}
