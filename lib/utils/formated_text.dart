import 'package:app_dinamica/constants/font_const.dart';
import 'package:flutter/material.dart';

class FormatTextXXXX extends StatefulWidget {
  final String name;
  final String nacionalidade;
  final String estadoCivil;
  final String rg;
  final String orgaoExpedidor;

  final String cpf;

  const FormatTextXXXX({
    super.key,
    required this.name,
    required this.nacionalidade,
    required this.estadoCivil,
    required this.rg,
    required this.orgaoExpedidor,
    required this.cpf,
  });

  @override
  State<FormatTextXXXX> createState() => _FormatTextXXXXState();
}

class _FormatTextXXXXState extends State<FormatTextXXXX> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: fontSized,
        ),
        children: [
          TextSpan(
            text: 'VENDEDOR: ${widget.name}, ',
            style: const TextStyle(
              fontSize: fontSized,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                '${widget.nacionalidade}, maior, ${widget.estadoCivil}, portador do',
          ),
          TextSpan(
            text:
                'RG nº ${widget.rg} ${widget.orgaoExpedidor} e CPF nº ${widget.cpf},',
            style: const TextStyle(
              fontSize: fontSized,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
