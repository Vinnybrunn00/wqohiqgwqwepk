import 'dart:io';

import 'package:app_dinamica/constants/const_link.dart';
import 'package:http/http.dart' as http;

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = PostHttpOverrides();
  await sendMessages('beep!!!');
}

Future<void> sendMessages(String msg) async {
  Uri uri = Uri.parse('$url?chat_id=$chatId&text=$msg');

  await http.get(uri).then((event) {
    print(event.body);
  });
}
