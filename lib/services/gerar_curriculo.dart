import 'dart:io';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class Services {
  static Future<File> generatePDFCurriculo({
    // root
    required String root,
    //
    required MemoryImage? image,
    required String name,
    required String profissao,
    required String idade,
    required String telefone,
    required String email,
    required String endereco,
    required String cidade,
    required String rua,
    required String numero,
    required String cep,
    required String estado,
    required String habilidades,
    required String formacao,
    required String experiencia,
    required List<String> listHablidades,
    required List<String> listFormacao,
    required List<String> listExperiencia,
  }) async {
    final pdf = Document();

    List<String> listSplit = listExperiencia
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split('-');
    //final font = File('assets/fonts/arial.ttf').readAsBytesSync();
    //final ttf = Font.ttf(font.buffer.asByteData());

    final imagePDF = (await rootBundle.load('assets/images/image_c.jpeg'))
        .buffer
        .asUint8List();

    pdf.addPage(
      Page(
        build: (_) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                        //color: PdfColor.fromHex('#8487e0'),
                        width: 100 * 3.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            image != null
                                ? Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 35,
                                        ),
                                        height: 90,
                                        width: 90,
                                        color: PdfColor.fromHex('#000000'),
                                        child: Image(
                                          image,
                                          height: 90,
                                          width: 90,
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              name.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              profissao,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              height: 1,
                                              width: 200,
                                              color:
                                                  PdfColor.fromHex('#000000'),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Idade: ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '$idade anos',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Telefone: ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text: telefone),
                                                      ],
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Email: ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(text: email),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(endereco),
                                                  Text(
                                                    'rua $rua, Nº $numero, $cidade/$estado, $cep',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          name.toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          profissao,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 1,
                                          width: 150,
                                          color: PdfColor.fromHex('#000000'),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('$idade anos'),
                                              Text('$cidade, $estado'),
                                              Text(telefone),
                                              Text(email)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(height: 30),
                            Text(
                              'OBJETIVO',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Trabalhar em equipe, colaborando com a empresa e o crescimento profissional. ',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'FORMAÇÃO',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            for (int i = 0; i < listFormacao.length; i++)
                              Text(
                                listFormacao[i],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            SizedBox(height: 15),
                            Text(
                              'HABILIDADES',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            for (int i = 0; i < listHablidades.length; i++)
                              Bullet(
                                text: listHablidades[i],
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            SizedBox(height: 15),
                            Text(
                              'EXPERIÊNCIA',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            for (int i = 0; i < listSplit.length; i++)
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${param(i)}:',
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    TextSpan(
                                      text: listSplit[i],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: PdfColor.fromHex('#de1f12'),
                    height: 200 * 3.6,
                    width: 100,
                    child: Image(
                      MemoryImage(imagePDF),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return SaveAndOpenPDF.savePDF(
        name: 'Curriculo - $name.pdf', pdf: pdf, path: root);
  }
}
