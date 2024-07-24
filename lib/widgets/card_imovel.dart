import 'dart:io';

import 'package:app_dinamica/components/inputs.dart';
import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:app_dinamica/widgets/button_event.dart';
import 'package:flutter/material.dart';

class CardImovel extends StatefulWidget {
  final Key formKey;
  final void Function()? onTap;
  final bool isLoading;

  final TextEditingController endereco;
  final TextEditingController metragemfrente;
  final TextEditingController metragemfundo;
  final TextEditingController valor;
  final TextEditingController data;

  const CardImovel({
    super.key,
    required this.formKey,
    required this.endereco,
    required this.metragemfrente,
    required this.metragemfundo,
    required this.valor,
    required this.data,
    this.onTap, required this.isLoading,
  });

  @override
  State<CardImovel> createState() => _CardImovelState();
}

class _CardImovelState extends State<CardImovel> {
  @override
  Widget build(BuildContext context) {
    double widthSized = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
      margin: const EdgeInsets.only(right: 12),
      width: Platform.isWindows ? widthSized / 4 : widthSized / 1.2,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'TERRENO/IMÓVEL',
                style: TextStyle(
                  color: Colors.white.withOpacity(.7),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputsComponents(
                validator: (endereco3) {
                  if (endereco3 != null) {
                    return voidInputs(endereco3, '"Endereço"');
                  }
                  return null;
                },
                controller: widget.endereco,
                label: 'Endereço',
                hintText: 'Endereço do imóvel'),
            InputsComponents(
                validator: (frente) {
                  if (frente != null) {
                    return voidInputs(frente, '"Metragem - frente"');
                  }
                  return null;
                },
                controller: widget.metragemfrente,
                label: 'Metragem - Frente',
                hintText: 'Metragem da frente do imóvel'),
            InputsComponents(
                validator: (fundo) {
                  if (fundo != null) {
                    return voidInputs(fundo, '"Metragem - fundo"');
                  }
                  return null;
                },
                controller: widget.metragemfundo,
                label: 'Metragem - Fundo',
                hintText: 'exemple'),
            InputsComponents(
                validator: (valor) {
                  if (valor != null) {
                    return voidInputs(valor, '"Valor"');
                  }
                  return null;
                },
                controller: widget.valor,
                label: 'Valor',
                hintText: 'exemple'),
            InputsComponents(
              validator: (data) {
                if (data != null) {
                  return voidInputs(data, '"Data"');
                }
                return null;
              },
              controller: widget.data,
              label: 'Data',
              hintText: 'exemple',
            ),
            EventButton(
              text: 'GERAR PDF',
              onTap: widget.onTap,
              isLoading: widget.isLoading,
            )
          ],
        ),
      ),
    );
  }
}
