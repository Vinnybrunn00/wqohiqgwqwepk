import 'package:app_dinamica/constants/const_link.dart';
import 'package:http/http.dart' as http;

Future<void> sendMessage(String msg) async {
  Uri uri = Uri.parse('$url?chat_id=$chatId&text=$msg&parse_mode=MarkdownV2');

  await http.get(uri).then((response) async {
    if (response.statusCode != 200) return;
  });
}
