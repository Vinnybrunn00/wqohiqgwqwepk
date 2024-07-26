void main() async {
  await xuxa(1).catchError((err) {
    //print(err + 'vasco  vasco');
  });
}

Future<void> xuxa(var n) async {
  try {
    //print('asasjash' + n);
  } catch (err) {
    throw err.toString();
  }
}
