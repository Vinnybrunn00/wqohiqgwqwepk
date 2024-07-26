import 'package:app_dinamica/constants/const_link.dart';
import 'package:http/http.dart' as http;

Future<String?> sendMessage(String msg) async {
  String? foo;
  Uri uri = Uri.parse('$url?chat_id=$chatId&text=$msg');

  await http.get(uri).then((response) async {
    if (response.statusCode != 200) {
      foo = 'Sem internet';
    }
  });
  return foo;
}
