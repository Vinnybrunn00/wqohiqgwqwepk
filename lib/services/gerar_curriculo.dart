import 'dart:io';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/utils/def_utils.dart';
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
                                          left: 20,
                                          top: 20,
                                        ),
                                        height: 150,
                                        width: 150,
                                        child: Image(image),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              name,
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
                                                        TextSpan(text: idade),
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
                                          name,
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
                                              Text(idade),
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
                              Text(
                                '${param(i)}: ${listSplit[i]}',
                                style: const TextStyle(
                                  fontSize: 12,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return SaveAndOpenPDF.savePDF(name: 'curriculo.pdf', pdf: pdf, path: root);
  }
}