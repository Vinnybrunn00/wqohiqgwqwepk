import 'dart:io';
import 'package:app_dinamica/constants/font_const.dart';
import 'package:app_dinamica/services/save_pdf.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class Service {
  static Future<File> generatePDF({
    // root
    required String root,
    // vendedor
    required String name1,
    required String nacionalidade1,
    required String estadoCivil1,
    required String prof1,
    required String rg1,
    required String orgaoExpedidor1,
    required String cpf1,
    required String endereco1,
    required String cidade1,
    required String rua1,
    required String numero1,
    required String cep1,
    required String estado1,

    // comprador
    required String name2,
    required String nacionalidade2,
    required String estadoCivil2,
    required String prof2,
    required String rg2,
    required String orgaoExpedidor2,
    required String cpf2,
    required String endereco2,
    required String cidade2,
    required String rua2,
    required String numero2,
    required String cep2,
    required String estado2,
    // drop down
    required String terrenOuImovel,
    required String urbanoOuRural,
    // info venda imovel
    required String endereco3,
    required String frente,
    required String fundo,
    required String valor,
    required String cidade3,
    required String rua3,
    required String numero3,
    required String cep3,
    required String estado3,
    required String pagante,
    required String reu,
    required String dia,
    required String mes,
    required String ano,
  }) async {
    final pdf = Document();

    //final font = File('assets/fonts/arial.ttf').readAsBytesSync();
    //final ttf = Font.ttf(font.buffer.asByteData());

    pdf.addPage(
      Page(
        build: (_) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'CONTRATO DE COMPRA E VENDA DE TERRENO RURAL',
                  style: TextStyle(
                    fontSize: fontSized,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Text(
                'IDENTIFICAÇÃO DAS PARTES CONTRATANTES',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: fontSized,
                  ),
                  children: [
                    TextSpan(
                      text: 'VENDEDOR: $name1, ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          '$nacionalidade1, maior, $estadoCivil1, $prof1, portador do ',
                    ),
                    TextSpan(
                      text: 'RG nº $rg1 $orgaoExpedidor1 e CPF nº $cpf1 ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'residente e domiciliado na $endereco1, Rua $rua1, Nº $numero1, $cidade1/${estado1.toLowerCase()}',
                      style: const TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: fontSized,
                  ),
                  children: [
                    TextSpan(
                      text: 'COMPRADOR: $name2, ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          '$nacionalidade2, maior, $estadoCivil2, $prof2, portador do ',
                    ),
                    TextSpan(
                      text: 'RG nº $rg2 $orgaoExpedidor2 e CPF nº $cpf2 ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'residente e domiciliado na $endereco2, Rua $rua2, Nº $numero2, $cidade2/${estado2.toLowerCase()}',
                      style: const TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Firmam entre si o presente contrato de Compra e Venda de Bem Imóvel rural entre Pessoas Físicas, que se regida pelas cláusulas e condições a seguir descritas:',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '            I.     OBJETO DE COMPRA E VENDA ',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'É Objeto de Compra e Venda de um $terrenOuImovel $urbanoOuRural Denominada Sítio Anicepasto, medindo 96ha (Noventa e Seis hectares), localizado no $endereco3, cujo:',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 13),
              Text(
                'INCRA: 000027 367516 7,',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Solicitação: 456868-0,',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Protocolo: 461172-1',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              Text(
                'Nº do Processo: 077.1627.2021.000.386952',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '           II.     PREÇO',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: fontSized,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Pela compra e Venda prometida a ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                    TextSpan(
                      text: 'COMPRADOR(A) ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: 'pagará aos ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                    TextSpan(
                      text: 'VENDEDORES ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: 'a importância total de ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                    TextSpan(
                      text: 'R\$ $valor ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'pagos por/pela $pagante, em creditórios oriundos do processo número 0118548-98.2005.8.12.0001 da Quinta Vara Cível da Comarca de $cidade3, $estado3, tendo como réu o $reu.',
                      style: const TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    pdf.addPage(
      Page(
        build: (_) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '           III.     POSSE E ESCRITURA ',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: fontSized,
                  ),
                  children: [
                    TextSpan(
                      text: 'O COMPRADOR, ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'fica autorizada a ocupar o imóvel a partir desta data, mas somente serão emitidos na posse definitiva do imóvel a partir da data do pagamento integral da Compra e Venda e seus imitidos e seus consectários, oportunidade em que os ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                    TextSpan(
                      text: 'VENDEDORES outorgarão ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'a competente escritura e dará quitação total pela compra e venda ora pactuada.  ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '           IV.     DESPESAS',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: fontSized,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Serão suportadas pelo ',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                    TextSpan(
                      text: 'COMPRADOR, ',
                      style: TextStyle(
                        fontSize: fontSized,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text:
                          'a partir desta data, as despesas de condomínio, água, luz, taxas, impostos, seguros etc., relativamente ao imóvel objeto deste contrato de Compra e Venda, bem como as despesas futuras com a escritura e registro.',
                      style: TextStyle(
                        fontSize: fontSized,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '           V.     FORO',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Para dirimir eventuais Dúvidas sobre a interpretação das cláusulas pactuadas nomeiam os contratantes o foro da comarca de Sobradinho/BA.',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'E por estarem justos e contratados mandarem lavrar o presente contrato em duas vias de igual teor e forma, que assinam na presença de duas testemunhas, para que produza seus jurídicos e legais efeitos.',
                style: const TextStyle(
                  fontSize: fontSized,
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sobradinho/BA, $dia ${sendMonth(int.parse(mes))} de $ano',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    pdf.addPage(
      Page(
        build: (_) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'VENDEDOR',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Container(
                color: PdfColor.fromHex('#000000'),
                height: 1,
                width: 380,
              ),
              Text(
                name1,
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'RG nº $rg1 $orgaoExpedidor1',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'CPF nº $cpf1',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60),
              Text(
                'COMPRADOR',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Container(
                color: PdfColor.fromHex('#000000'),
                height: 1,
                width: 380,
              ),
              Text(
                name2,
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'RG nº $rg2 $orgaoExpedidor2',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'CPF nº $cpf2',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 80),
              Text(
                'TESTEMUNHAS:',
                style: TextStyle(
                  fontSize: fontSized,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Container(
                color: PdfColor.fromHex('#000000'),
                height: 1,
                width: 380,
              ),
              SizedBox(height: 70),
              Container(
                color: PdfColor.fromHex('#000000'),
                height: 1,
                width: 380,
              ),
            ],
          ),
        ),
      ),
    );
    return SaveAndOpenPDF.savePDF(name: 'teste.pdf', pdf: pdf, path: root);
  }
}
