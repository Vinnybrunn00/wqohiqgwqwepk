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

  final TextEditingController cidade;
  final TextEditingController estado;
  final TextEditingController cep;
  final TextEditingController numero;
  final TextEditingController rua;

  final TextEditingController dia;
  final TextEditingController mes;
  final TextEditingController ano;

  final TextEditingController pagante;
  final TextEditingController reu;

  const CardImovel(
      {super.key,
      required this.formKey,
      required this.endereco,
      required this.metragemfrente,
      required this.metragemfundo,
      required this.valor,
      this.onTap,
      required this.isLoading,
      required this.cidade,
      required this.estado,
      required this.cep,
      required this.numero,
      required this.rua,
      required this.dia,
      required this.mes,
      required this.ano,
      required this.pagante,
      required this.reu});

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
            Row(
              children: [
                Expanded(
                  child: InputsComponents(
                    validator: (frente) {
                      if (frente != null) {
                        return voidInputs(frente, '"Metragem - frente"');
                      }
                      return null;
                    },
                    controller: widget.metragemfrente,
                    label: 'Metragem - Frente',
                    hintText: 'Metragem da frente do imóvel',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (fundo) {
                      if (fundo != null) {
                        return voidInputs(fundo, '"Metragem - fundo"');
                      }
                      return null;
                    },
                    controller: widget.metragemfundo,
                    label: 'Metragem - Fundo',
                    hintText: 'exemple',
                  ),
                ),
              ],
            ),
            InputsComponents(
              validator: (valor) {
                if (valor != null) {
                  return voidInputs(valor, '"Valor"');
                }
                return null;
              },
              controller: widget.valor,
              label: 'Valor',
              hintText: 'exemple',
            ),
            InputsComponents(
              validator: (pagante) {
                if (pagante != null) {
                  return voidInputs(pagante, '"Pagante"');
                }
                return null;
              },
              controller: widget.pagante,
              label: 'Pagante',
              hintText: 'exemple',
            ),
            InputsComponents(
              validator: (reu) {
                if (reu != null) {
                  return voidInputs(reu, '"Réu"');
                }
                return null;
              },
              controller: widget.reu,
              label: 'Réu',
              hintText: 'exemple',
            ),
            Row(
              children: [
                Expanded(
                  child: InputsComponents(
                    validator: (dia) {
                      if (dia != null) {
                        return voidInputs(dia, '"Dia"');
                      }
                      return null;
                    },
                    controller: widget.dia,
                    label: 'Dia',
                    hintText: 'Dia de hoje',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (mes) {
                      if (mes != null) {
                        return voidInputs(mes, '"Mês"');
                      }
                      return null;
                    },
                    controller: widget.mes,
                    label: 'Mês',
                    hintText: 'Mês atual',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (ano) {
                      if (ano != null) {
                        return voidInputs(ano, '"Ano"');
                      }
                      return null;
                    },
                    controller: widget.ano,
                    label: 'Ano',
                    hintText: 'Ano atual',
                  ),
                ),
              ],
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
              hintText: 'Endereço do imóvel',
            ),
            Row(
              children: [
                Expanded(
                  child: InputsComponents(
                    validator: (cidade1) {
                      if (cidade1 != null) {
                        return voidInputs(cidade1, '"Cidade"');
                      }
                      return null;
                    },
                    controller: widget.cidade,
                    label: 'Cidade',
                    hintText: 'exemple',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (rua1) {
                      if (rua1 != null) {
                        return voidInputs(rua1, '"Rua"');
                      }
                      return null;
                    },
                    controller: widget.rua,
                    label: 'Rua',
                    hintText: 'exemple',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (numero) {
                      if (numero != null) {
                        return voidInputs(numero, '"Número"');
                      }
                      return null;
                    },
                    controller: widget.numero,
                    label: 'Número',
                    hintText: 'exemple',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InputsComponents(
                    validator: (cep) {
                      if (cep != null) {
                        return voidInputs(cep, '"CEP"');
                      }
                      return null;
                    },
                    controller: widget.cep,
                    label: 'CEP',
                    hintText: 'exemple',
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: InputsComponents(
                    validator: (estado1) {
                      if (estado1 != null) {
                        return voidInputs(estado1, '"Estado"');
                      }
                      return null;
                    },
                    controller: widget.estado,
                    label: 'Estado',
                    hintText: 'exemple',
                  ),
                ),
              ],
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
