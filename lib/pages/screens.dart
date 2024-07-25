import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/services/gerar_pdf.dart';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/services/box_error.dart';
import 'package:app_dinamica/widgets/card_imovel.dart';
import 'package:app_dinamica/widgets/card_inputs.dart';
import 'package:app_dinamica/widgets/dropdown_event.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _dropDownList1 = ['Terreno', 'Imóvel'];
  final List<String> _dropDownList2 = ['Rural', 'Urbano'];

  bool isLoading = false;

  String nameDrop1 = 'Terreno';
  String nameDrop2 = 'Rural';

  String sexo = 'Masculino';

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  // controller vendedor
  TextEditingController name1 = TextEditingController();
  TextEditingController nacionalidade1 = TextEditingController();
  TextEditingController estadoCivil1 = TextEditingController();
  TextEditingController prof1 = TextEditingController();
  TextEditingController rg1 = TextEditingController();
  TextEditingController orgaoExpedidor1 = TextEditingController();
  TextEditingController cpf1 = TextEditingController();
  TextEditingController endereco1 = TextEditingController();

  // controller comprador
  TextEditingController name2 = TextEditingController();
  TextEditingController nacionalidade2 = TextEditingController();
  TextEditingController estadoCivil2 = TextEditingController();
  TextEditingController prof2 = TextEditingController();
  TextEditingController rg2 = TextEditingController();
  TextEditingController orgaoExpedidor2 = TextEditingController();
  TextEditingController cpf2 = TextEditingController();
  TextEditingController endereco2 = TextEditingController();

  // info compra do imovel
  TextEditingController endereco3 = TextEditingController();
  TextEditingController metragemFrente = TextEditingController();
  TextEditingController metragemFundo = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController data = TextEditingController();

  Future<void> generate() async {
    setState(() {
      isLoading = !isLoading;
    });
    bool validate1 = formKey1.currentState!.validate();
    bool validate2 = formKey2.currentState!.validate();
    bool validate3 = formKey3.currentState!.validate();

    if (validate1 && validate2 && validate3) {
      final pdfFile = await Service.generatePDF(
        //vendedor
        name1: name1.text.toUpperCase(),
        nacionalidade1: nacionalidade1.text,
        estadoCivil1: estadoCivil1.text,
        prof1: prof1.text,
        rg1: rg1.text,
        orgaoExpedidor1: orgaoExpedidor1.text,
        cpf1: cpf1.text,
        endereco1: endereco1.text,
        // comprador
        name2: name2.text.toUpperCase(),
        nacionalidade2: nacionalidade2.text,
        estadoCivil2: estadoCivil2.text,
        prof2: prof2.text,
        rg2: rg2.text,
        orgaoExpedidor2: orgaoExpedidor2.text,
        cpf2: cpf2.text,
        endereco2: endereco2.text,
        // drop down
        terrenOuImovel: nameDrop1,
        urbanoOuRural: nameDrop2,
        // info imovel
        endereco3: endereco3.text,
        frente: metragemFrente.text,
        fundo: metragemFundo.text,
        valor: valor.text,
        data: data.text,
      );

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
    } else {
      setState(() {
        isLoading = false;
      });
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
      body: Center(
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
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Row(
                      children: [
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
                      data: data,
                      metragemfrente: metragemFrente,
                      metragemfundo: metragemFundo,
                      valor: valor,
                      onTap: () async {
                        await generate();
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
    );
  }
}
