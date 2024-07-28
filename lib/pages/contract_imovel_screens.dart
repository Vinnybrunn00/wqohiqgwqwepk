import 'dart:developer';

import 'package:app_dinamica/components/inputs.dart';
import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/services/gerar_pdf.dart';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/services/box_error.dart';
import 'package:app_dinamica/services/send_message.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:app_dinamica/widgets/card_imovel.dart';
import 'package:app_dinamica/widgets/card_inputs.dart';
import 'package:app_dinamica/widgets/dropdown_event.dart';
import 'package:flutter/material.dart';

class HomeScreenContractImovel extends StatefulWidget {
  const HomeScreenContractImovel({super.key});

  @override
  State<HomeScreenContractImovel> createState() =>
      _HomeScreenContractImovelState();
}

class _HomeScreenContractImovelState extends State<HomeScreenContractImovel> {
  final List<String> _dropDownList1 = ['Terreno', 'Imóvel'];
  final List<String> _dropDownList2 = ['Rural', 'Urbano'];

  bool isLoading = false;

  String nameDrop1 = 'Terreno';
  String nameDrop2 = 'Rural';

  String sexo = 'Masculino';

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  TextEditingController root = TextEditingController();

  // controller vendedor
  TextEditingController name1 = TextEditingController();
  TextEditingController nacionalidade1 = TextEditingController();
  TextEditingController estadoCivil1 = TextEditingController();
  TextEditingController prof1 = TextEditingController();
  TextEditingController rg1 = TextEditingController();
  TextEditingController orgaoExpedidor1 = TextEditingController();
  TextEditingController cpf1 = TextEditingController();
  TextEditingController endereco1 = TextEditingController();

  TextEditingController cidade1 = TextEditingController();
  TextEditingController estado1 = TextEditingController();
  TextEditingController cep1 = TextEditingController();
  TextEditingController numero1 = TextEditingController();
  TextEditingController rua1 = TextEditingController();

  TextEditingController dia1 = TextEditingController();
  TextEditingController mes1 = TextEditingController();
  TextEditingController ano1 = TextEditingController();

  // controller comprador
  TextEditingController name2 = TextEditingController();
  TextEditingController nacionalidade2 = TextEditingController();
  TextEditingController estadoCivil2 = TextEditingController();
  TextEditingController prof2 = TextEditingController();
  TextEditingController rg2 = TextEditingController();
  TextEditingController orgaoExpedidor2 = TextEditingController();
  TextEditingController cpf2 = TextEditingController();
  TextEditingController endereco2 = TextEditingController();

  TextEditingController cidade2 = TextEditingController();
  TextEditingController estado2 = TextEditingController();
  TextEditingController cep2 = TextEditingController();
  TextEditingController numero2 = TextEditingController();
  TextEditingController rua2 = TextEditingController();

  TextEditingController dia2 = TextEditingController();
  TextEditingController mes2 = TextEditingController();
  TextEditingController ano2 = TextEditingController();

  // info compra do imovel
  TextEditingController endereco3 = TextEditingController();
  TextEditingController metragemFrente = TextEditingController();
  TextEditingController metragemFundo = TextEditingController();
  TextEditingController valor = TextEditingController();

  TextEditingController cidade3 = TextEditingController();
  TextEditingController estado3 = TextEditingController();
  TextEditingController cep3 = TextEditingController();
  TextEditingController numero3 = TextEditingController();
  TextEditingController rua3 = TextEditingController();

  TextEditingController dia3 = TextEditingController();
  TextEditingController mes3 = TextEditingController();
  TextEditingController ano3 = TextEditingController();

  TextEditingController pagante = TextEditingController();
  TextEditingController reu = TextEditingController();

  Future<void> generate() async {
    setState(() {
      isLoading = !isLoading;
    });
    bool validate1 = formKey1.currentState!.validate();
    bool validate2 = formKey2.currentState!.validate();
    bool validate3 = formKey3.currentState!.validate();

    if (validate1 && validate2 && validate3) {
      try {
        final pdfFile = await Service.generatePDF(
          // root
          root: root.text,
          //vendedor
          name1: name1.text.toUpperCase(),
          nacionalidade1: nacionalidade1.text,
          estadoCivil1: estadoCivil1.text,
          prof1: prof1.text,
          rg1: rg1.text,
          orgaoExpedidor1: orgaoExpedidor1.text,
          cpf1: cpf1.text,
          endereco1: endereco1.text,
          cep1: cep1.text,
          cidade1: cidade1.text,
          estado1: estado1.text,
          rua1: rua1.text,
          numero1: numero1.text,
          // comprador
          name2: name2.text.toUpperCase(),
          nacionalidade2: nacionalidade2.text,
          estadoCivil2: estadoCivil2.text,
          prof2: prof2.text,
          rg2: rg2.text,
          orgaoExpedidor2: orgaoExpedidor2.text,
          cpf2: cpf2.text,
          endereco2: endereco2.text,
          cep2: cep2.text,
          cidade2: cidade2.text,
          estado2: estado2.text,
          rua2: rua2.text,
          numero2: numero2.text,
          // drop down
          terrenOuImovel: nameDrop1,
          urbanoOuRural: nameDrop2,
          // info imovel
          endereco3: endereco3.text,
          frente: metragemFrente.text,
          fundo: metragemFundo.text,
          valor: valor.text,
          cep3: cep3.text,
          cidade3: cidade3.text,
          estado3: estado3.text,
          rua3: rua3.text,
          numero3: numero3.text,
          pagante: pagante.text,
          reu: reu.text,
          dia: dia3.text,
          mes: mes3.text,
          ano: ano3.text,
        );

        await sendMessage('func generate() -> $pdfFile');

        SaveAndOpenPDF.openPDF(pdfFile).then((value) async {
          if (value != null) {
            await dialogBarError(context: context, message: value.toString());
            setState(() {
              isLoading = false;
            });
            return;
          }
          setState(() {
            isLoading = false;
          });
        });
      } catch (err) {
        log(err.toString());
        throw err.toString();
      }
    } else {
      setState(() {
        isLoading = false;
      });
      await sendMessage('Preencha todos os campos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: secondColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardsInputs(
                    formKey: formKey1,
                    name: name1,
                    cpf: cpf1,
                    endereco: endereco1,
                    estadocivil: estadoCivil1,
                    prof: prof1,
                    nacionalidade: nacionalidade1,
                    orgaoExpedidor: orgaoExpedidor1,
                    rg: rg1,
                    typeScreen: 'Vendedor',
                    isVendor: true,
                    rua: rua1,
                    cidade: cidade1,
                    cep: cep1,
                    estado: estado1,
                    numero: numero1,
                  ),
                  CardsInputs(
                    formKey: formKey2,
                    name: name2,
                    cpf: cpf2,
                    endereco: endereco2,
                    estadocivil: estadoCivil2,
                    prof: prof2,
                    nacionalidade: nacionalidade2,
                    orgaoExpedidor: orgaoExpedidor2,
                    rg: rg2,
                    typeScreen: 'Comprador',
                    isVendor: false,
                    rua: rua2,
                    cidade: cidade2,
                    cep: cep2,
                    estado: estado2,
                    numero: numero2,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: InputsComponents(
                              controller: root,
                              label: 'root',
                              hintText: 'root',
                            ),
                          ),
                          DropDownEvent(
                            value: nameDrop1,
                            dropList: _dropDownList1,
                            onChanged: (String? value) {
                              setState(() {
                                if (value != null) {
                                  nameDrop1 = value;
                                }
                              });
                            },
                          ),
                          DropDownEvent(
                            value: nameDrop2,
                            dropList: _dropDownList2,
                            onChanged: (String? value) {
                              setState(() {
                                if (value != null) {
                                  nameDrop2 = value;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      CardImovel(
                        formKey: formKey3,
                        endereco: endereco3,
                        rua: rua3,
                        cep: cep3,
                        cidade: cidade3,
                        estado: estado3,
                        numero: numero3,
                        dia: dia3,
                        mes: mes3,
                        ano: ano3,
                        pagante: pagante,
                        reu: reu,
                        metragemfrente: metragemFrente,
                        metragemfundo: metragemFundo,
                        valor: valor,
                        onTap: () async {
                          await generate().catchError((err) async {
                            setState(() {
                              isLoading = false;
                            });
                            await sendMessage('func generate() -> $err');
                          });
                        },
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
