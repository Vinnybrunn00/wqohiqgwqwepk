import 'dart:io';

import 'package:app_dinamica/components/inputs.dart';
import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:flutter/material.dart';

class CardsInputs extends StatefulWidget {
  final Key formKey;
  final String typeScreen;
  final bool isVendor;

  final TextEditingController name;
  final TextEditingController nacionalidade;
  final TextEditingController estadocivil;
  final TextEditingController prof;
  final TextEditingController rg;
  final TextEditingController orgaoExpedidor;
  final TextEditingController cpf;

  final TextEditingController endereco;
  final TextEditingController cidade;
  final TextEditingController estado;
  final TextEditingController cep;
  final TextEditingController numero;
  final TextEditingController rua;

  const CardsInputs({
    super.key,
    required this.formKey,
    required this.typeScreen,
    required this.nacionalidade,
    required this.estadocivil,
    required this.rg,
    required this.orgaoExpedidor,
    required this.cpf,
    required this.endereco,
    required this.name,
    required this.isVendor,
    required this.prof,
    required this.rua,
    required this.cidade,
    required this.estado,
    required this.cep,
    required this.numero,
  });

  @override
  State<CardsInputs> createState() => _CardsInputsState();
}

class _CardsInputsState extends State<CardsInputs> {
  @override
  Widget build(BuildContext context) {
    double widthSized = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
      margin: const EdgeInsets.only(left: 12),
      width: Platform.isWindows ? widthSized / 3 : widthSized / 1.2,
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
                widget.typeScreen,
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
                    validator: (name1) {
                      if (name1 != null) {
                        return voidInputs(name1, '"Nome"');
                      }
                      return null;
                    },
                    controller: widget.name,
                    label: 'Nome',
                    hintText: widget.isVendor
                        ? 'Nome do Vendedor'
                        : 'Nome do Comprador',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InputsComponents(
                    validator: (estCivil1) {
                      if (estCivil1 != null) {
                        return voidInputs(estCivil1, '"Estádo Civil"');
                      }
                      return null;
                    },
                    controller: widget.estadocivil,
                    label: 'Estado Civil',
                    hintText: widget.isVendor
                        ? 'Estado Civil do Vendedor'
                        : 'Estado Civil do Comprador',
                  ),
                ),
              ],
            ),
            InputsComponents(
              validator: (nacionalidade1) {
                if (nacionalidade1 != null) {
                  return voidInputs(nacionalidade1, '"Nacionalidade"');
                }
                return null;
              },
              controller: widget.nacionalidade,
              label: 'Nacionalidade',
              hintText: widget.isVendor
                  ? 'Nacionalidade do Vendedor'
                  : 'Nacionalidade do Comprador',
            ),
            InputsComponents(
              validator: (cpf1) {
                if (cpf1 != null) {
                  return voidInputs(cpf1, '"CPF"');
                }
                return null;
              },
              controller: widget.cpf,
              label: 'CPF',
              hintText: 'exemple',
            ),
            InputsComponents(
              validator: (rg1) {
                if (rg1 != null) {
                  return voidInputs(rg1, '"RG"');
                }
                return null;
              },
              controller: widget.rg,
              label: 'Portador(a) do RG',
              hintText: widget.isVendor ? 'RG do Vendedor' : 'RG do Comprador',
            ),
            InputsComponents(
              validator: (prof1) {
                if (prof1 != null) {
                  return voidInputs(prof1, '"Profissão"');
                }
                return null;
              },
              controller: widget.prof,
              label: 'Profissão',
              hintText: widget.isVendor
                  ? 'Profissão do Vendedor'
                  : 'Profissão do Comprador',
            ),
            InputsComponents(
              validator: (orgaoExpedidor1) {
                if (orgaoExpedidor1 != null) {
                  return voidInputs(orgaoExpedidor1, '"Orgão Expedidor"');
                }
                return null;
              },
              controller: widget.orgaoExpedidor,
              label: 'Orgão Expedidor',
              hintText: widget.isVendor
                  ? 'Orgão Expedidor do Vendedor'
                  : 'Orgão Expedidor do Comprador',
            ),
            InputsComponents(
              validator: (endereco1) {
                if (endereco1 != null) {
                  return voidInputs(endereco1, '"Endereço"');
                }
                return null;
              },
              controller: widget.endereco,
              label: 'Endereço',
              hintText: widget.isVendor
                  ? 'Endereço do Vendedor'
                  : 'Endereço do Comprador',
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
                    hintText: widget.isVendor
                        ? 'Cidade do Vendedor'
                        : 'Cidade do Comprador',
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
                    hintText: widget.isVendor
                        ? 'Rua do Vendedor'
                        : 'Rua do Comprador',
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
                    hintText: widget.isVendor
                        ? 'Número do Vendedor'
                        : 'Número do Comprador',
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
                    hintText: widget.isVendor
                        ? 'CEP do Vendedor'
                        : 'CEP do Comprador',
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
                    hintText: widget.isVendor
                        ? 'Estado do Vendedor'
                        : 'Estado do Comprador',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
