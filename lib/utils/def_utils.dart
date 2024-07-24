

String? voidInputs(String? value, String components) {
  if (value != null) {
    if (value.isEmpty) {
      return 'Campo $components não pode estar vazio';
    }
  }
  return null;
}
