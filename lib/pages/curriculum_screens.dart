import 'dart:io';
import 'package:app_dinamica/components/inputs.dart';
import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/services/box_error.dart';
import 'package:app_dinamica/services/gerar_curriculo.dart';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/services/send_message.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:app_dinamica/widgets/button_event.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf/src/widgets/image_provider.dart' as wp;

class CurriculumScreen extends StatefulWidget {
  const CurriculumScreen({super.key});

  @override
  State<CurriculumScreen> createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController profissao = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController estado = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController formacao = TextEditingController();
  TextEditingController experiencia = TextEditingController();
  TextEditingController habilidade = TextEditingController();
  TextEditingController rua = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController cep = TextEditingController();

  TextEditingController root = TextEditingController();

  List<String> listaFormacao = [];
  List<String> listaExperiencia = [];
  List<String> listaHabilidades = [];

  dynamic isPick;
  String names = '';

  bool isLoading = false;

  final formkey = GlobalKey<FormState>();

  Future<void> gerarCurriculo() async {
    if (formkey.currentState!.validate()) {
      try {
        final pdfFile = await Services.generatePDFCurriculo(
          // root
          root: root.text,
          //vendedor
          name: name.text,
          cep: cep.text,
          cidade: cidade.text,
          email: email.text,
          endereco: endereco.text,
          estado: estado.text,
          experiencia: experiencia.text,
          formacao: formacao.text,
          habilidades: habilidade.text,
          idade: idade.text,
          image: isPick,
          numero: numero.text,
          profissao: profissao.text,
          rua: rua.text,
          telefone: telefone.text,
          listExperiencia: listaExperiencia,
          listFormacao: listaFormacao,
          listHablidades: listaHabilidades,
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
        throw err.toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double widthSized = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: secondColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
                margin: const EdgeInsets.only(right: 12),
                width: widthSized / 2,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          'CURRICULO',
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
                              validator: (nome) {
                                if (nome != null) {
                                  return voidInputs(nome, '"Nome"');
                                }
                                return null;
                              },
                              controller: name,
                              label: 'Nome',
                              hintText: 'Nome',
                            ),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () async {
                              final result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                final file = result.files.first;
                                var open = await File(file.path!).readAsBytes();
                                final image = wp.MemoryImage(open);
                                setState(() {
                                  isPick = image;
                                  names = file.name;
                                });
                              }
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    size: 30,
                                    color: isPick != null ? Colors.cyan : null,
                                    Icons.add_photo_alternate,
                                  ),
                                ),
                                Text(
                                  names,
                                  style: const TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      InputsComponents(
                        validator: (prof) {
                          if (prof != null) {
                            return voidInputs(prof, '"Profissão"');
                          }
                          return null;
                        },
                        controller: profissao,
                        label: 'Profissão',
                        hintText: 'Profissão',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputsComponents(
                              validator: (idade) {
                                if (idade != null) {
                                  return voidInputs(idade, '"idade"');
                                }
                                return null;
                              },
                              controller: idade,
                              label: 'idade',
                              hintText: 'idade',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: InputsComponents(
                              validator: (telefone) {
                                if (telefone != null) {
                                  return voidInputs(telefone, '"Telefone"');
                                }
                                return null;
                              },
                              controller: telefone,
                              label: 'Telefone',
                              hintText: 'Telefone',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: InputsComponents(
                              validator: (email) {
                                if (email != null) {
                                  return voidInputs(email, '"email"');
                                }
                                return null;
                              },
                              controller: email,
                              label: 'email',
                              hintText: 'email',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputsComponents(
                              validator: (endereco3) {
                                if (endereco3 != null) {
                                  return voidInputs(endereco3, '"Endereço"');
                                }
                                return null;
                              },
                              maxLength: 99999,
                              controller: endereco,
                              label: 'Endereço',
                              hintText: 'Endereço do imóvel',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: InputsComponents(
                              validator: (cidade1) {
                                if (cidade1 != null) {
                                  return voidInputs(cidade1, '"Cidade"');
                                }
                                return null;
                              },
                              maxLength: 99999,
                              controller: cidade,
                              label: 'Cidade',
                              hintText: 'exemple',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: InputsComponents(
                              validator: (rua) {
                                if (rua != null) {
                                  return voidInputs(rua, '"Rua"');
                                }
                                return null;
                              },
                              maxLength: 2,
                              controller: rua,
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
                              controller: numero,
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
                              controller: cep,
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
                              controller: estado,
                              label: 'Estado',
                              hintText: 'exemple',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputsComponents(
                              controller: habilidade,
                              label: 'Habilidades',
                              hintText: 'Habilidades',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                String text = habilidade.text;
                                if (text.isEmpty) return;
                                if (isRepeated(
                                        text: text, lista: listaHabilidades) ??
                                    true) {
                                  setState(() {
                                    listaHabilidades.add(text);
                                    habilidade.clear();
                                  });
                                  return;
                                }
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < listaHabilidades.length; i++)
                            Container(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              margin: const EdgeInsets.only(
                                right: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    listaHabilidades
                                        .remove(listaHabilidades[i]);
                                  });
                                },
                                child: Text(
                                  listaHabilidades[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputsComponents(
                              controller: formacao,
                              label: 'Formaçao',
                              hintText: 'Formaçao',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                String text = formacao.text;
                                if (text.isEmpty) return;
                                if (isRepeated(
                                        text: text, lista: listaFormacao) ??
                                    true) {
                                  setState(() {
                                    listaFormacao.add(text);
                                    formacao.clear();
                                  });
                                  return;
                                }
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < listaFormacao.length; i++)
                            Container(
                              padding: const EdgeInsets.only(left: 3, right: 3),
                              margin: const EdgeInsets.only(
                                right: 5,
                                bottom: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.green,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    listaFormacao.remove(listaFormacao[i]);
                                  });
                                },
                                child: Text(
                                  listaFormacao[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputsComponents(
                              controller: experiencia,
                              label: 'Experiencia',
                              hintText: 'EMPRESA + PERÍODO + CARGO',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                String text = experiencia.text;
                                if (text.isEmpty) return;
                                if (isRepeated(
                                        text: text, lista: listaExperiencia) ??
                                    true) {
                                  setState(() {
                                    listaExperiencia.add(text);
                                    experiencia.clear();
                                  });
                                  return;
                                }
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                      OverflowBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < listaExperiencia.length; i++)
                            OverflowBar(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.green,
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        listaExperiencia
                                            .remove(listaExperiencia[i]);
                                      });
                                    },
                                    child: Text(
                                      listaExperiencia[i],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          EventButton(
                            text: 'Gerar Curriculo',
                            onTap: () async {
                              await gerarCurriculo();
                            },
                          ),
                          const SizedBox(width: 30 * 2.2),
                          SizedBox(
                            width: 150,
                            child: InputsComponents(
                              controller: root,
                              label: 'root',
                              hintText: 'Opicional',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
