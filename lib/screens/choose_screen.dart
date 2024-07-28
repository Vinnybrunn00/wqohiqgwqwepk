import 'package:app_dinamica/constants/constants_colors.dart';
import 'package:app_dinamica/pages/contract_imovel_screens.dart';
import 'package:app_dinamica/pages/curriculum_screens.dart';
import 'package:app_dinamica/widgets/button_event.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  @override
  Widget build(BuildContext context) {
    double widthSized = MediaQuery.of(context).size.width;
    double heightSized = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: SizedBox(
          height: heightSized / 2,
          width: widthSized / 2,
          child: Column(
            children: [
              EventButton(
                text: 'CONTRATO DE COMPRA E VENDADE TERRENO RURAL',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreenContractImovel(),
                    ),
                  );
                },
              ),
              EventButton(
                text: 'CURRICULO',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CurriculumScreen(),
                    ),
                  );
                },
              ),
              EventButton(
                text: 'exemple',
                onTap: () {},
              ),
              EventButton(
                text: 'exemple',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
