import 'package:app_dinamica/components/inputs.dart';
import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/utils/def_utils.dart';
import 'package:flutter/material.dart';

class CardCurriculo extends StatefulWidget {
  final Key formkey;
  final TextEditingController name;
  final TextEditingController profissao;
  final TextEditingController idade;
  final TextEditingController cidade;
  final TextEditingController estado;
  final TextEditingController numero;
  final TextEditingController telefone;
  final TextEditingController email;
  final TextEditingController formacao;
  final TextEditingController experiencia;
  final TextEditingController habilidade;
  final TextEditingController endereco;
  final TextEditingController rua;
  final TextEditingController cep;

  const CardCurriculo({
    super.key,
    required this.name,
    required this.profissao,
    required this.idade,
    required this.cidade,
    required this.estado,
    required this.numero,
    required this.email,
    required this.formkey,
    required this.formacao,
    required this.experiencia,
    required this.habilidade,
    required this.telefone,
    required this.endereco,
    required this.rua,
    required this.cep,
  });

  @override
  State<CardCurriculo> createState() => _CardCurriculoState();
}

class _CardCurriculoState extends State<CardCurriculo> {
  List<String> lista = [];

  @override
  Widget build(BuildContext context) {
    double widthSized = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
        margin: const EdgeInsets.only(right: 12),
        width: widthSized / 2,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Form(
          key: widget.formkey,
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
                      controller: widget.name,
                      label: 'Nome',
                      hintText: 'Nome',
                    ),
                  ),
                ],
              ),
              InputsComponents(
                validator: (prof) {
                  if (prof != null) {
                    return voidInputs(prof, '"Profissão"');
                  }
                  return null;
                },
                controller: widget.profissao,
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
                      controller: widget.idade,
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
                      controller: widget.telefone,
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
                      controller: widget.email,
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
                      controller: widget.endereco,
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
                      controller: widget.cidade,
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
              Row(
                children: [
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
                        String text = widget.idade.text;
                        for (int i = 0; i < lista.length; i++) {
                          if (text == lista[i]) return;
                          if (text.isEmpty) return;
                        }
                        setState(() {
                          lista.add(text);
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < lista.length; i++)
                    Container(
                      padding: const EdgeInsets.only(left: 3, right: 3),
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
                            lista.remove(lista[i]);
                          });
                        },
                        child: Text(
                          lista[i],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              InputsComponents(
                validator: (formacao) {
                  if (formacao != null) {
                    return voidInputs(formacao, '"Formaçao"');
                  }
                  return null;
                },
                controller: widget.formacao,
                label: 'Formaçao',
                hintText: 'Formaçao',
              ),
              InputsComponents(
                validator: (experiencia) {
                  if (experiencia != null) {
                    return voidInputs(experiencia, '"Experiencia"');
                  }
                  return null;
                },
                controller: widget.experiencia,
                label: 'Experiencia',
                hintText: 'Experiencia',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
